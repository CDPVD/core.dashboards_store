# docker build --ssh default -f depechecode/Dockerfile -t rmme -o - . > out.tar
FROM ghcr.io/sciance-inc/core.dashboards_store:develop

# Set the working directory
WORKDIR /src

# Copy the code and install the dependencies
COPY macros macros
COPY models models
COPY seeds seeds
COPY snapshots snapshots
COPY tests tests
COPY dbt_project.yml dbt_project.yml
COPY packages.yml packages.yml
COPY depechecode/config.yml depechecode/DAG/config.yml 

RUN --mount=type=ssh cdbt clean && cdbt deps 
