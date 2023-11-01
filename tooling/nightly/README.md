
# Core.store : nightly
> Intgegration testing of dev and release-candidate branches.

## Why ?
* Code submitted through pull-requests is only tested in isolation from other PR. 
* Two, isolated PR which are working fine on their own, may not work well together.
* We need to test the integration of all PRs, before releasing a new version.

This sub-directory hold a smôôôl `dbt project`, named `nightly.data.store`, behaving like a regular `cssXX.data.store` project, but with all models and tests enabled. This project is run nightly (hence the name) to test the integration of all PRs against a real database.

Only the last tagged `dev` and `rc` versions of the day are tested.

If the tests / compilations / runs fail, we get the next day to fix the build ;).

## How ?
* The `nightly` run is triggered by a GitHub Action and runs againts the CSSVDC databases.

## What schould I do ?
* Every developer adding a dashboard / models to the `core.data.store` project should ensure that the `nightly` project has the new mart/dashboard/model/tests/seed enabled.

To update the `nightly` project :
* Update the `nightly/project/dbt_poject.yml` and enable your model.
* Populate any required seed data in `nightly/project/seeds/` and as per your documention.
    * Data outputed by the nightly build will never be looked at, providing the tests are passing. So you don't have to care about the business logic of your seed data. Just make sure it's plausible enough to leverage the tests suite.

## How to build and the run the nightly project locally ?
> This is not required, but can be useful to debug the nightly project. You will need an ssh key with access to the `github/Sciance-Inc/core.data.store` repository. Docker must also be installed.

### How to build it ? 

```bash
# Clone the core.data.store repository
cd core.data.store
eval $(ssh-agent)  # So the SSH key can be used by buildx
ssh-add ~/.ssh/id_rsa # Add your ssh key to the ssh-agent, you might choose another key than id_rsa
docker buildx build --ssh default -f nightly/docker/Dockerfile . -t nightly --build-arg CORE_VERSION=<core_version> --build-arg TARGET=<rc|dev>
```
Where `<core_version>` schould be set to the tag you want the integration to be tested for.

### How to run it : 

```bash
docker run --env-file=.env nightly integration
```

Where `.env` is a file containing the following variables : 

```bash
DBT_USERNAME=<DBT_USERNAME>
DBT_PASSWORD=<DBT_PASSWORD>
DBT_SERVER=<DBT_SERVER>
DBT_PORT=<DBT_PORT>
```

Each placeholder should be replaced by the appropriate value.




