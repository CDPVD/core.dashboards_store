#! /usr/bin/python3

# DAG.py
#
# Project name: core.dashboards_store
# Author: Hugo Juhel
#
# description:
"""
    Build the DAG for the core.dashboards_store.
"""

import json
import os
from datetime import datetime, timedelta  # type: ignore
from pathlib import Path

import requests
import yaml
from airflow import DAG  # type: ignore
from airflow.providers.docker.operators.docker import DockerOperator  # type: ignore
from airflow.utils.task_group import TaskGroup  # type: ignore
from onepasswordconnectsdk.client import new_client  # type: ignore

# Extract the root path to to read the manifest and the config from.
ROOT_PATH = Path(__file__).absolute().parent
TARGET = str(ROOT_PATH.parent).split("_")[
    -1
]  # Extract the target from the project name : either staging or master

# Open the config file
with open(ROOT_PATH / "config.yml", "r") as f:
    config = yaml.safe_load(f)

DEFAULT_ARGS = {
    "owner": "Juhel Hugo",
    "email": ["juhel.hugo@sciance.ca"],
    "email_on_failure": False,
    "email_on_retry": False,
    "start_date": datetime(2022, 2, 3),
    "retries": 3,
}

DOCKER_URL = (
    config["docker_url"] or "unix://var/run/docker.sock"
)  # The backend to run the ETL on
OP_URL = (
    config["onepassword_url"] or "http://192.168.26.100:8079"
)  # The 1Password Connect URL, located on the backend


# creates a client by supplying hostname and 1Password Connect API token
def get_runtime_env():
    """
    Build the environment variables dictionnary to be injected into the docker.
    """

    # Fetch the secret from 1Password
    client = new_client(
        OP_URL,
        os.environ["OP_CONNECT_TOKEN"],
    )

    vault_ids = [vault.id for vault in client.get_vaults() if vault.name == "store"]
    secret = client.get_item_by_title(config["css_name"], vault_ids[0]).fields
    secret = {item.label: item for item in secret}

    return {
        "DBT_USERNAME": secret["username"].value,
        "DBT_PASSWORD": secret["password"].value,
        "DBT_SERVER": secret["server"].value,
        "DBT_PORT": secret["port"].value,
        "DBT_DATABASE": secret["database"].value,
        "DBT_STAGING": secret["staging"].value,
    }


def DBTDockerFactory(command: str, dag: DAG, task_id: str) -> DockerOperator:
    """
    Run an arbitrary DBT command on the Docker
    """

    return DockerOperator(
        api_version="auto",
        docker_url=DOCKER_URL,
        command=command,
        image=f"ghcr.io/sciance-inc/{config['css_name']}.dashboards_store:{TARGET}",
        network_mode="host",
        task_id=task_id,
        docker_conn_id="github_registry",
        dag=dag,
        auto_remove=True,
        force_pull=True,
        environment=get_runtime_env(),
        mount_tmp_dir=False,
    )


def RunFactory(model_name: str, dag: DAG) -> DockerOperator:
    """
    Run a DBT model on the Docker
    """

    return DBTDockerFactory(
        task_id=model_name,
        command=f"cdbt run --select {model_name} --target {TARGET}",
        dag=dag,
    )


# Open the JSON manifest
with open(ROOT_PATH / "manifest.json", "r") as f:
    manifest = json.load(f)


def dag_failure_callback(context):
    """
    Callback to send a message on Microsoft Teams when the DAG fails.
    """

    payload = {
        "@type": "MessageCard",
        "@context": "http://schema.org/extensions",
        "themeColor": "0076D7",
        "summary": f"DAG execution failed for '{config['css_name']}' on '{TARGET}'",
        "sections": [
            {
                "activityTitle": f"DAG execution failed for '{config['css_name']}' on '{TARGET}'",
                "activitySubtitle": "Dashboards store",
                "activityImage": "https://m.media-amazon.com/images/I/51trRVcd7gL._AC_UF1000,1000_QL80_.jpg",
                "facts": [
                    {"name": "CSS", "value": config["css_name"]},
                    {"name": "Environnement", "value": TARGET},
                    {"name": "Execution date", "value": context["execution_date"]},
                ],
                "markdown": True,
            }
        ],
        "potentialAction": [
            {
                "@type": "OpenUri",
                "name": "Who's been a bad DAG ?",
                "targets": [
                    {
                        "os": "default",
                        "uri": f"https://airflow.maas.sciance.ca/dags/{context['dag_run'].dag_id}/grid",
                    }
                ],
            }
        ],
    }

    requests.post(config["teams_webhook"], data=json.dumps(payload))


with DAG(
    dag_id=f"{config['css_name']}_dashboards_store_{TARGET}",
    default_args=DEFAULT_ARGS,
    catchup=False,
    schedule_interval=config["schedule"][TARGET],
    dagrun_timeout=timedelta(minutes=int(config["timeout"])),
    max_active_tasks=config["concurrency"],
    tags=["dashboards store", config["css_name"], TARGET],
    on_failure_callback=dag_failure_callback,
) as dag:

    seed = DBTDockerFactory(
        task_id="seed",
        command=f"cdbt seed --full-refresh --target {TARGET}",
        dag=dag,
    )

    tests = DBTDockerFactory(
        task_id="tests",
        command=f"cdbt test --target {TARGET}",
        dag=dag,
    )

    # Iterate over the manifest items and buid Docker operator
    tasks = {}
    with TaskGroup(group_id="run_group") as run:

        # Create the tasks for each model
        for node_name in manifest["nodes"].keys():
            if node_name.split(".")[0] == "model":

                # Make the run nodes
                model_name = node_name.split(".")[-1]
                tasks[node_name] = RunFactory(model_name, dag)

        # Add upstream and downstream dependencies for each run task
        for node_name in manifest["nodes"].keys():
            if node_name.split(".")[0] == "model":
                for upstream_node in manifest["nodes"][node_name]["depends_on"][
                    "nodes"
                ]:
                    upstream_node_type = upstream_node.split(".")[0]
                    if upstream_node_type == "model":
                        tasks[upstream_node] >> tasks[node_name]

    # Bind the run with the seed and the tests
    seed >> run >> tests

    # Airflow needs DAG to exists in the the Global space (yes, cause you know, properly importing stuff is a pain -_-)
    globals()[f"{config['css_name']}_dashboards_store_{TARGET}"] = dag
