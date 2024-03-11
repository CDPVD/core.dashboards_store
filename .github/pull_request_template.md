# Objectives of the Pull Request ? 
> Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?

# What is left out of the Pull Request ? 
> Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

# How to run the pull request ?
> Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store and the <cssXX>.data.store folder.
# Update the code
cd core.dashboards_store
git checkout feature/<feature_name>
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell && poetry lock && poetry install 
cd ../<cssXX>.dashboards_store
git checkout feature/<feature_name>
git pull  
# Might be required if you add a new DBT dependency
# dbt deps
# Run dbt 
dbt build --select +tag:<my resources tag>+
```

# Checklist
> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

* **Code** :
  * [ ] The code I'm asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My code follows the conventions described in the `contribution guide`.
  * [ ] My `models` / `seeds` / `adapters` are tested and documented in DBT 9through the `yaml` files.
  * I have a added a new **mandatory seed** / a new **mandatory adapter** : 
    * [ ] I have you populated the `tooling/nightly` project with my new seed / adapter.
    * [ ] An exemple of how to populate the adapter can be found in the `analysis` folder.
  * I have added a new **dashboard** : 
    * [ ] I have updated the `core.dashboards_store/tooling/template/{{ cookiecutter.css_short_name + '.dashboards_store' }}/dbt_project.yml` file with my new dashboard. 
    * [ ] I have added a new `doc` page in the `core.dashboards_store/tooling/docs/content/` appropriate folder, describing what my dashboards does and how to configure it.
    * [ ] The dashboard is saved with `.pbit` extension, **not** a `.pbix` extension, so it doesn't contains any data.
  * [ ] I have called `sqfmt .` to format my code, and **made sure my code was still running as expected after having been reformated**.
* **Documentation** : 
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** : 
  * [ ]  My merge message is prefixed with a `commitizen` key word so it looks something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [ ]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  My pull request is documented. I have explained the needs for the PR, what was left out of the it and why.
  * [ ]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purpose.
  * [ ]  I have assignee at least **1** people to review my PR.