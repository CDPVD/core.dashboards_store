# CHANGELOG



## v0.7.0-dev.6+20231026 (2023-10-26)

### Feature

* feat(chronic_absenteeism): splitting between lateness and absences (#10)

Co-authored-by: hugo juhel &lt;juhel.hugo@stratemia.com&gt; ([`eb5ba61`](https://github.com/Sciance-Inc/core.dashboards_store/commit/eb5ba61db01148f5eca7e5b1a3dfdc356d529c6d))


## v0.7.0-dev.5+20231024 (2023-10-24)

### Chore

* chore(licence-check): warning won t be treated as error anymore ([`c161e9e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c161e9e62a791eceae175b60ffa64c34b13f2515))

* chore(fix): fixing badly resolved conflict in the template s dbt_project ([`89dc589`](https://github.com/Sciance-Inc/core.dashboards_store/commit/89dc58970ed194b3f55b85c6d80ac845dd3067d0))

### Documentation

* docs: adding docs about overriding populations ([`13b1118`](https://github.com/Sciance-Inc/core.dashboards_store/commit/13b11180491d64036230832bac61f59db1625128))

* docs: fixing a typo in the overriding section ([`95c6bef`](https://github.com/Sciance-Inc/core.dashboards_store/commit/95c6befa8378838aed9041994555aa0fc04b6b11))

### Feature

* feat(chronic_absenteeism): adding support for customizable list of absences and lateness (#8)

Co-authored-by: hugo juhel &lt;juhel.hugo@stratemia.com&gt; ([`4d2b29e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4d2b29eee58242dd62835d91d68b4146ddba38d1))

### Fix

* fix: filter_non_null_obj_number (#9)

Co-authored-by: sadqim &lt;sadqim@csvdc.qc.ca&gt;
Co-authored-by: Hugo Juhel &lt;22279443+hugoJuhel@users.noreply.github.com&gt;
Co-authored-by: hugo juhel &lt;juhel.hugo@stratemia.com&gt; ([`3c120b2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/3c120b2c73b75329906ed3225eaa3aa657614927))

* fix(spine): removing students with duplicated code perm ([`b0464e1`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b0464e1595b41efd3ae2ff5a06cf727f9067fe51))

* fix: properly injecting the name of the db when not using a linked server ([`ff6fbf5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ff6fbf5b98ecfb8ec0aad69c679ec8b3624869c3))

### Unknown

* Merge branch &#39;develop&#39; of github.com:Sciance-Inc/core.dashboards_store into develop ([`111ab95`](https://github.com/Sciance-Inc/core.dashboards_store/commit/111ab95eab8cab03c271a8bf4fb68f7374adc3fd))


## v0.7.0-dev.4+20231023 (2023-10-23)

### Chore

* chore: excluding template from formatting ([`8cf9428`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8cf94285fc8304e463cdbd936e5540a8d305fefb))

* chore: mobing the template folder into the tooling folder ([`0a0bd2f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0a0bd2f78defbe96dc7488bdf905a068f446f117))

* chore: adding missing licence ([`fa498a6`](https://github.com/Sciance-Inc/core.dashboards_store/commit/fa498a60d189c8c369a790cb185a616bd9962346))

* chore: fixing path in licence checker ([`c1f5523`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c1f552383289cf5bd914f253f431ead156f2a653))

* chore: adding assignee item ([`e9d123d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e9d123dbb22d440811e9f6f53e80dcf7496ff4df))

* chore: adding licence checker ([`468e4a0`](https://github.com/Sciance-Inc/core.dashboards_store/commit/468e4a08ff9672b849217a3c37e035b72054070e))

* chore: updating actions to not triggers on PR if not needed ([`5b68894`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5b68894fa4a7425dabf85d67b6320b679cc7703e))

* chore: adding sqlfmt guidelines and check ([`9623bae`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9623baed2cacb68dac60b83cc53232c98e2d5b63))

* chore: adding question template ([`81b9cf7`](https://github.com/Sciance-Inc/core.dashboards_store/commit/81b9cf72e7517e48d495995de0fde152cd405579))

* chore: updating feature request template ([`6ac3de5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6ac3de52da533f6db26e9f14048958a6213e96fd))

### Style

* style: applying sqlfmt ([`a6c4b99`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a6c4b9971d3b2b0764bfc32fb4d4fc484bb8cfd3))

### Unknown

* Merge branch &#39;develop&#39; of github.com:Sciance-Inc/core.dashboards_store into develop ([`a8d8e7f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a8d8e7f3b0ac737f8492322a4a993d879c829a0d))


## v0.7.0-dev.4+20231021 (2023-10-21)

### Chore

* chore: adding PR, bug, and feature templates ([`a14021f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a14021fdca6d65ec53889f52587b56d9e0de6c50))

* chore: moving the nightly build to the tooling subfolder ([`1d82aec`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1d82aecd7e159e4d2c472a04a67ad16381a68c54))

* chore(fix): setting the build context to the root of the folder as pyproject is required ([`36b7a8f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/36b7a8fdf190188d3ee6818ac9e34ce1accad10a))

* chore: moving depeche code to the tooling folder ([`a928669`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a9286696bbb76b3454f66eaa8de7a8fc3265a8f4))

### Documentation

* docs: reflecting changes of template new location ([`0b089f4`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0b089f44b08d3db1c8146cdd3fc5bdff01f55750))

* docs: migrating docs notification ([`f4a2739`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f4a2739176e28dc88e7b8b6d0f2e22b30b7a88d4))


## v0.7.0-dev.4+20231020 (2023-10-20)

### Documentation

* docs: adding doc website ([`37f63ee`](https://github.com/Sciance-Inc/core.dashboards_store/commit/37f63eee7bbcc646ccace0bb7c1ef0b4d845d748))

### Unknown

* Merge branch &#39;develop&#39; of github.com:Sciance-Inc/core.dashboards_store into develop ([`2d2bd9b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/2d2bd9ba20c0461e06de81f222c43bde6c53b813))


## v0.7.0-dev.4+20231019 (2023-10-19)

### Feature

* feat: add new res_scolaire dashboard

&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
cette PR introduit un nouveau TDB qui agrège les résultats au bilan des compétences et matières choisies
&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?
dans une prochaine PR nous allons ajouter les résultats au Étapes pour les compétence et les matières choisies
&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout feature/res_scolaire
git pull
cd ../cssvdc.data.store
git checkout feature/res_scolaire
git pull
dbt build --select +tag:res_scolaires
```

&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per models).
  * [X] I have formatted the code with the help of `sqlfmt .`.
  * [X] Did you add a new **mandatory seed** ? If so, have you populated the `nightly` project with your new seed ?
* **Template** :
  *  [X] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added o... ([`e2ea271`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e2ea27179170e04d9cff68fab0a75b6c1914589e))

### Refactor

* refactor(hr mart): switching to historical activity table

This PR refactors the RH mart and introduces new tables than can be used to ease future downstream computations.

* This PR firsts adds a new **historical** `stg_activity_history` tables. This table is a consolidated version of `pai_hemp`
* The main job history of employees, which was previously unavailable, is built by parsing the XML payload of `hcha_pai_dos_empl`.
* A **historical**, table with point-in-time metadata is derived from precedings table. This `fact_activity_yearly` provide the point-in-time following attributes :
    * workplace
    * stat_eng
    * stat_empl
    * main_job (main ref empl)
    * This table can then be used a a spine to add point-in-time filters to every metrics computed at an employee / year level.
* A `fact_current_active_employees` table is derived from the `fact_activity_table`, listing all the currently enroled employees is introduced.

The retirement dashboard is rebuilt upon the new tables.

To reduce the need for double joining on both `pai_dos` and `pai_dos2`, a new `dim_employees` is created, providing usefull static information at the employees level. Future static metrics of interest could be added to this table.

As noted by Maryna, the meaning of the seeds is not constant over time. To allow for time-varying seed, the two existing seeds are refactored with the addition of two new columns : `valid_from` and `valid_until`.

Yearly versions of the seed tables are derived in `dim_employment_status_yearly` and `dim_engagement_status_yearly`. The two derived tables expand the seeds by year. Time varying mapping can then by handled by joining on both the code (ex stat_eng) and the year we want the valid code for.

Permanence will be rebuilt upon the new activity table. For now, the table is flagged as deprecated and a new `stg_seniority` is added as work-in-progress.

* `stg_seniority` will be completed in another PR, this one being big enough.
* Refactoring other RH dashboards schould be done in another PR

**A companion branch cssvt.data.tbe/feature/rh_dim_empl has been created to help the reviewers. The companion branch targets CSSVT**

```bash
cd core.data.store
git checkout feature/rh_dim_empl
poetry shell &amp;&amp; poetry install
git pull
cd ../cssvt.data.store
git checkout feature/rh_dim_empl
git pull
dbt run-operation drop_schema
dbt build --select +tag:human_resources --full-refresh
``` ([`d88a4e5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/d88a4e50d5a7e872ee4a6180efb40c507e3784ae))

### Unknown

* Merge branch &#39;develop&#39; of github.com:Sciance-Inc/core.dashboards_store into develop ([`35a1627`](https://github.com/Sciance-Inc/core.dashboards_store/commit/35a16279c8e29978f16424e03e73b6a663134ce8))


## v0.7.0-dev.3+20231018 (2023-10-18)

### Unknown

* Merge branch &#39;develop&#39; of ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/core.data.tbe into develop ([`35fe131`](https://github.com/Sciance-Inc/core.dashboards_store/commit/35fe13145a03ded9282b7ae0e64243da06349dac))

* Merged PR 453: feat :  add new res_scolaie dashboard

# Objectives of the Pull Request ?
&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
cette PR introduit un nouveau TDB qui agrège les résultats au bilan des compétences et matières choisies
# What is left out of the Pull Request ?
&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?
dans une prochaine PR nous allons ajouter les résultats au Étapes pour les compétence et les matières choisies
# How to run the pull request ?
&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store and the &lt;cssXX&gt;.data.store folder.
# Update the code
cd core.data.store
git checkout feature/res_scolaire
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
cd ../cssvdc.data.store
git checkout feature/res_scolaire
git pull
# Might be required if you add a new DBT dependency
#dbt deps
# Run dbt
dbt build --select +tag:res_scolaires
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per models).
  * [X] I have formatted the code with the help of `sqlfmt .`.
  * [X] Did you add a new **mandatory seed** ? If so, have you populated the `nightly` project with your new seed ?
* **Template** :
  *  [X] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added o... ([`f330ca9`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f330ca98313d04165a0a24f6733597e7c1f67d3a))


## v0.7.0-dev.3+20231013 (2023-10-13)

### Chore

* chore: disabling fail-fast so all the matrix runs will be tried each day ([`8a00df3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8a00df3c8a123663674eae98b06a314741a92160))

* chore: renaming gabarait to gabarit ([`34d409c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/34d409c6c608bf1962cf3552f47bca10ef7edcaa))

### Documentation

* docs: improving profiles documentation ([`148f0fd`](https://github.com/Sciance-Inc/core.dashboards_store/commit/148f0fd7bcb57d3089af84de23410a239c395da5))

### Refactor

* refactor: renaming profiles with profiles-sample and remove password to avoid giting it by accident ([`017f960`](https://github.com/Sciance-Inc/core.dashboards_store/commit/017f9600bf07bc7797d46960d68ce907d2effb9c))


## v0.7.0-dev.3+20231012 (2023-10-12)

### Chore

* chore: gitignoring the pbix ([`cb92a3d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/cb92a3d35c6f6417ab7ad36642e23d8bd7ed6d28))

### Feature

* feat: adding dashboards ([`7ab3ec2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7ab3ec2bb1249e10fe2aa94943176841cf9b2280))

### Fix

* fix: disembiguate duplicates resulting from multiple fetchs from the Jade database

Done with Fred and Mohamed :

* Remove duplicates introduced by fetching the Jade database multples times.
* Only the most recent upserted grade is now used., Previous results are removed. ([`b66b53e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b66b53ec6f377ee072240be60bc1dd46f4f6a098))


## v0.7.0-dev.2+20230926 (2023-09-26)

### Fix

* fix: removing dead code ([`1f64fe2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1f64fe242dccb0152887c66a3da87710c4fddb12))

### Unknown

* Merge branch &#39;develop&#39; of github.com:Sciance-Inc/core.dashboards_store into develop ([`7f7e7e6`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7f7e7e6ad8640279566252788909d4f602811666))


## v0.7.0-dev.1+20230925 (2023-09-25)

### Feature

* feat: adding licence ([`25994ad`](https://github.com/Sciance-Inc/core.dashboards_store/commit/25994ad9cf1c11b9291d5cba5cece37ede4caa1f))

* feat: adding dim_employees ([`99ee1db`](https://github.com/Sciance-Inc/core.dashboards_store/commit/99ee1dbdd030547a78233cc872e567a32935fc5b))

### Unknown

* Merge branch &#39;develop&#39; of github.com:Sciance-Inc/core.dashboards_store into develop ([`fd0ec2a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/fd0ec2af247545e14e6ea200cd5928848be8e16e))

* fix : add filtre to compare with curent day date

# Objectives of the Pull Request ?
&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
cette Pr a pour but d&#39;ajouter un filtre pour arreter le calcul des absence à la date du jour
# What is left out of the Pull Request ?
&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

# How to run the pull request ?
&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store and the &lt;cssXX&gt;.data.store folder.
# Update the code
cd core.data.store
git checkout bugfix/abs_date_actu
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
cd ../cssvdc.data.store
git checkout develop
git pull
# Might be required if you add a new DBT dependency
#dbt deps
# Run dbt
dbt build --select tag:chronic_absenteeism
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per models).
  * [ ] I have formatted the code with the help of `sqlfmt .`.
  * [ ] Did you add a new **mandatory seed** ? If so, have you populated the `nightly` project with your new seed ?
* **Template** :
  *  [ ] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [x]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in... ([`37f403b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/37f403b93cdeacf9a7316e7020176b480a0adc0f))


## v0.6.2+20230913 (2023-09-13)

### Documentation

* docs(fix): updatating the stamp_model&#39;s macro name ([`404c505`](https://github.com/Sciance-Inc/core.dashboards_store/commit/404c50554330cb1b2767230c7c56a6f45fad19b9))


## v0.6.2+20230831 (2023-08-31)


## v0.6.0-dev.6+20230831 (2023-08-31)

### Chore

* chore(cicd): adding concurrency piority ([`dbff52c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/dbff52c6c90b055510733b4b00811304c1bcc58f))

### Fix

* fix(cicd): adding job scope to group name ([`508f8de`](https://github.com/Sciance-Inc/core.dashboards_store/commit/508f8de800f145202bf23de0419053f61e1baa3c))

### Style

* style: applying sqlfmt ([`b822989`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b82298934ab59740fe2ece0097eb2f44d63d579b))

### Unknown

* Merge branch &#39;master&#39; into develop ([`0bf1d28`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0bf1d282a29f4a166a1fb6a58310cdee3d3d0484))

* Merge branch &#39;develop&#39; of github.com:Sciance-Inc/core.dashboards_store into develop ([`b0cf8f9`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b0cf8f999e179c76193b3c8dc0dc4b8164e2f982))


## v0.6.0-dev.5+20230831 (2023-08-31)


## v0.6.1+20230831 (2023-08-31)

### Fix

* fix(cicd): fixing the stable pattern ([`9a2959c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9a2959cd8d4e1a8d553db2310b788855207b5cdb))

* fix(cicd): fixing the stable pattern ([`f00b560`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f00b560efb13bac0264b3fd48868cc43901ec25c))


## v0.6.0+20230831 (2023-08-31)

### Chore

* chore(test): adding the stable version to the nightly build ([`ad7fc6c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ad7fc6c7c4e0aef4c338049830a0a19c306ed460))

* chore(cicd): fixing maximal matrix concurrency to 1 to avoid burning the database ([`e22153a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e22153a163345ae009ce9524a3507a8673deab28))

* chore(fix): logging to the github registry before pushing the docker ([`493e726`](https://github.com/Sciance-Inc/core.dashboards_store/commit/493e726ffd8395aa2ab3f46c6e1e4eff7d470fc2))

* chore(cicd): adding the command to run the integration tests suite ([`da003f3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/da003f39d1925e5c50575d1c438ae98c3df187d2))

* chore: trigger the nightly on master ([`5e34159`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5e34159c32fcd697667b1abdda44bfcae95134f6))

* chore: adding CICD pipeline for nightly release ([`1fc829f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1fc829ffe2b1e1f82f94fea1790bb8ff5d82492a))

* chore(test): adding the dockerfile and the required files to run the integration tests ([`c99333d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c99333dfbd03f8296d0fe61724fbc7a829884019))

### Documentation

* docs: updating both the readme and the PR template to help developers populating seeds in the nightly project ([`2a1b15f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/2a1b15fff10c8c765eeab5f4676753f83fc4ec5f))

* docs(test): adding an how-to about the way to run the integration test on your local computer ([`dc05178`](https://github.com/Sciance-Inc/core.dashboards_store/commit/dc05178f21798eeaecbed9ca34b305e401af57a3))

### Test

* test(fix): fixing the test populations ([`6be75a0`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6be75a085ab0d9fd5e5e6065b4f75fd2e9e9bebd))

* test: adding a simple /default dbt project to be run as an integration test ([`46bc620`](https://github.com/Sciance-Inc/core.dashboards_store/commit/46bc6200e358b343779523da179bdfe4ff856c12))

### Unknown

* Merge branch &#39;develop&#39; of github.com:Sciance-Inc/core.dashboards_store into develop ([`a909dee`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a909dee40543f89fb10070a1498b799738fafea3))

* Merge branch &#39;master&#39; of github.com:Sciance-Inc/core.dashboards_store ([`d186286`](https://github.com/Sciance-Inc/core.dashboards_store/commit/d1862863a8c0db36016d5bded32631f82477cef8))


## v0.5.3 (2023-08-31)


## v0.6.0-dev.4+20230831 (2023-08-31)

### Fix

* fix: adding dummy id_eco to custom_fgj_population so the table is now working when not overrided ([`4cb464c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4cb464c115a88a3ba9bb8c639ddcbac0684eba0c))

* fix: the default empty custom population now properly support the id_eco ([`17e25e9`](https://github.com/Sciance-Inc/core.dashboards_store/commit/17e25e9a0f4336fb868272ecd52f08f472998604))

### Unknown

* Merge tag &#39;populations&#39; into develop

v0.5.2 ([`a301879`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a301879aee5b933745b9a7a0c9bb65ebcb317ee8))


## v0.6.0-dev.3+20230831 (2023-08-31)

### Build

* build(dag): disabling email on failure as I don t have any smtp server ([`e66f488`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e66f488f4e33b6bee7490eccbfeb38110cfebf75))

### Chore

* chore: adding the sqlfmt linter

# Objectives of the Pull Request ?
&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?

* The PR introduces the `sqlfmt` formatter in the tools chain.
* `sqlfmt` parses the SQL code and produces a formatted version of it.
* The formatted version uses standard style guidelines, that are NOT developer-dependant, resulting in a more coherent developing experience.
* Formatting the SQL code will help developers review other developer&#39;s code

* The PR also adds a `git pre-commit-hook` that can be installed to automagically format the code prior to the commit.
* The pre-commit-hook can be install with the commands documented in the `README.md`

* A new item is added to the `pull-request-template` to remind developers of formatting their code.

# What is left out of the Pull Request ?
&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

* The PR does not decide on whether or not, the particular style-guide of `sqlfmt` should be accepted as-is or tuned. For now, everything is set as default

# How to review the PR ?
* The commit `style: applying fmt` contains ALL newly-styled files.
* I advise you not to first select this commit, as doing so will impair your ability to review the other files.

# How to run the pull request ?
&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store and the cssvdc.data.store folder.

## MIGHT BE core.data.tbe AND cssvdc.data.tbe depending on your setup

# Update the code
cd core.data.store
git checkout feature/linter
git pull

# Install the linter
poetry shell
poetry lock
poetry install

# Might as well install the precommit
pre-commit install

cd ../cssvdc.data.store
git checkout feature/develop
git pull

# Run everything as a sanity check
dbt build --full-refresh
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Template** :
  *  [X] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request... ([`c80072e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c80072e048897680152d38f83b71020afb28153a))


## v0.5.2 (2023-08-30)


## v0.6.0-dev.3+20230830 (2023-08-30)

### Fix

* fix: adding the missing is_context_core variable to the cookiecutter

commit 541e66cd7e66564c2c16c99e27da30538469c3b8
Author: hugo juhel &lt;juhel.hugo@stratemia.com&gt;
Date:   Wed Aug 30 12:58:33 2023 -0400

    fix: adding the missing is_context_core variable to the cookiecutter ([`3e57cf2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/3e57cf26677ca94b5a52a4594049efbf7401975b))

### Unknown

* Merge tag &#39;core_context&#39; into develop

v0.5.2 ([`3d3d924`](https://github.com/Sciance-Inc/core.dashboards_store/commit/3d3d924251f4e4aa462cf5b9bb6ea6455cfb891c))


## v0.6.0-dev.2+20230830 (2023-08-30)


## v0.5.1 (2023-08-30)

### Fix

* fix: dependencies will now be parsed as ref when source are used and is_context_core is set to false ([`a8316f7`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a8316f7346e4c62725eeea6f76eff77468cc2e6a))

* fix: dependencies will now be parsed as ref when source are used and is_context_core is set to false ([`8a97d08`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8a97d08db0615440925c82a7f236f6d412cc2a31))


## v0.6.0-dev.1+20230830 (2023-08-30)

### Build

* build(fix): addinthe token as an header ([`434a6fd`](https://github.com/Sciance-Inc/core.dashboards_store/commit/434a6fdd2f2cf6f5702886241e5e589525e22888))

* build(fix): addinthe token as an header ([`9b8678d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9b8678d13641048c88d7f8ef4f5874747238f298))

* build(azure): removing azure build ([`4627ecc`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4627ecce83461c192b0d24461d55fc98beafee15))

* build(azure): swithcing to deep fetch ([`2646d79`](https://github.com/Sciance-Inc/core.dashboards_store/commit/2646d79c5cad6f42544aacf53b5aee73218f48a6))

* build: update azure-pipelines.yml for Azure Pipelines ([`c2923c3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c2923c36387deab9d142cf9b549265ee86970139))

* build: committing on VDC will now push to the sciance repo where tagging happens ;) ([`222b64c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/222b64c139540cd3db59aa771cee5ea5c09d0562))

* build(release): updating the release process ([`8f4c64e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8f4c64ef12e7a38e392f2a713cd2965463e49eee))

* build(release): updating the release process ([`c323552`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c3235522cbe90b3c7de921ced9f25f41f6502207))

### Chore

* chore: removing dead code ([`6f4b768`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6f4b76829df260c4a774dc8e235dc782518c5535))

### Fix

* fix: the purge_metadata_macro will no be triggered in compile only mode ([`d038274`](https://github.com/Sciance-Inc/core.dashboards_store/commit/d0382743b8cdd3984dd1ae7584fb929f9866c48d))

* fix: the drop_schema macro won&lt;t try to remove the public schema dbo anymore ([`88e0414`](https://github.com/Sciance-Inc/core.dashboards_store/commit/88e04149036bed97a4aa6aea27e6c3c8c473360f))

* fix: uniformizing the base version of dbt-sqlserver and dbt-core so raised errors are now hidden behin RuntimeExeception anymore ([`e9deef0`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e9deef0f0a56475f3c5f76c493186af60828d799))

* fix(build): fixing the azure target ([`ce6bad3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ce6bad3304167af68e94141296b691fb8d5e34f2))

### Unknown

* Merge branch &#39;develop&#39; of github.com:Sciance-Inc/core.dashboards_store into develop ([`96a8be4`](https://github.com/Sciance-Inc/core.dashboards_store/commit/96a8be44f353bbd8aceea845b07fffd81c04f46a))

* Merge branch &#39;master&#39; into develop ([`1da93c3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1da93c37d203480c6b1c2461e0d365b33db06e16))


## v0.5.0 (2023-08-28)

### Build

* build: pining sr version ([`7f2f78a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7f2f78a55d96de77265b5341cc86357d150b9d55))

* build: casting the timeout as integer to allow for string like definition in the inherited dags ([`2f99f7f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/2f99f7f88374032484b746d86750dcd7fd8b49c7))

### Chore

* chore: updating PR template ([`1abf722`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1abf722c9adc2b84a3e1f9f8acb638fd4201c6b8))

### Documentation

* docs: fixing typo in the gpi&#39;s database name ([`02ae6f7`](https://github.com/Sciance-Inc/core.dashboards_store/commit/02ae6f75b3c1898d316e8745c40012eeb06496dc))

### Feature

* feat: add id_eco to population table and add population template

&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
- ajout du id eco au population et la spine
- ajout de modèles de population dans le dossier analyse

&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout feature/modif_spine
git pull
cd ../cssvdc.data.store
git checkout feature/modif_spine
git pull
dbt build
```

&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Template** :
  *  [ ] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [x]  I have updated the documentation (README) accordingly to my changes.
  * [x]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [x]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard.

Related work items: #2323 ([`665583b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/665583b7f26b218ff0a4d559b408a2dd21b04635))

* feat: update effectif_css dashboard

# Objectives of the Pull Request ?
&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
cette à pour but de mettre à jou le tdb d&#39;effectif avec les norme du template qui a été adopter.
# What is left out of the Pull Request ?
&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

# How to run the pull request ?
&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store and the &lt;cssXX&gt;.data.store folder.
# Update the code
cd core.data.store
git checkout feature/maj_tplt_effectf
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
cd ../cssvdc.data.store
git checkout develop
git pull
# Might be required if you add a new DBT dependency
#dbt deps
# Run dbt
dbt build --select tag:effectif_css
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Template** :
  *  [ ] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [x]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard.

Related work items: #2291 ([`088007f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/088007fb4dcf1ca2217b5b8ee9aa9f2c37766e65))

* feat: add id_eco to population table and add population template

&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
- ajout du id eco au population et la spine
- ajout de modèles de population dans le dossier analyse

&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout feature/modif_spine
git pull
cd ../cssvdc.data.store
git checkout feature/modif_spine
git pull
dbt build
```

&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Template** :
  *  [ ] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [x]  I have updated the documentation (README) accordingly to my changes.
  * [x]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [x]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard.

Related work items: #2323 ([`1d982da`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1d982dabfa76d990ec33a0d9c905ed347e8f809d))

* feat: adding a cookiecutter template to help greenfield CSS bootstraping the cssXX.data.store

# Objectives of the Pull Request ?
&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?

* The PR adds a cookie cutter template helping new CSS to scaffold the store.
* The template basically populate a folder with a pre-filled `dbt_project.yaml`, a `profiles.yml` file and a github pipelines already configured

# How to run the pull request ?
&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store.
# Update the code
cd core.data.store
git checkout feature/cookiecutter
git pull

poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
cd ../

cookiecutter core.data.store/template/

# Enter some dummy vars when prompted for

cd ../

# Check if the you project as been properly scaffolded
ls -l
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in the taskboard. ([`6d823bd`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6d823bd13476eb46c9bf6874bcce0f09f283d695))

* feat: adding the chronic_absenteeism dashboard

# Objectives of the Pull Request?
* This PR introduces a new dashboard to monitor the chronic absenteeism among students. Chronic absenteeism is defined as a pattern of absence of some sort. The dashboard helps SÉ department monitoring and assess the situation.
* The PR create a new table in the `mart` : `fact_absences_sequence` listing all the absences sequences for the students.
* The dashboard uses the new population mechanism.

# What is left out of the Pull Request ?
* As there was not prototyping phase for this dashboard, some cosmetic / filtering adjustments will have to be made once this dashboard is presented to the clients.

# How to run the pull request ?
You will need a repo with the population tables ... populated. A companion branch has been created on the CSSVDC repo to help you review this PR. The companion branch&#39;s name is `feature/absenteism`. (yes, with  a typo -_-)

```bash
# Assuming you are in a folder containing both the core.data.tbe and the &lt;cssXX&gt;.data.tbe folder, where &lt;cssXX&gt; being either CSSVDC or your own repo with a `feature/absenteism` population-enabled branch.

cd core.data.tbe
git checkout feature/absenteeism
git pull
cd ../&lt;cssXX&gt;.data.tbe
git checkout feature/absenteism
git pull
dbt run-operation drop_schema
dbt build --select +tag:chronic_absenteeism
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in the taskboard. ([`cf8c809`](https://github.com/Sciance-Inc/core.dashboards_store/commit/cf8c8092aa97f469dbf629a7d8ce0730a732fe54))

* feat: adding the stamping mechanism to expose the data freshness in the dashboards ([`27f1cb7`](https://github.com/Sciance-Inc/core.dashboards_store/commit/27f1cb768ee8904cafe4ff56ba48f3b875cc6b80))

* feat: adding the stamper ([`7b01a24`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7b01a241e9fd15449cc3394b158ec3af913c7055))

* feat: adding the retirement dashboard. This dashboard monitors the number of retired employees in the past 10 years and provides forecasts for up to 5 years.

# Objectives of the pull request
* This PR adds a new dashboard monitoring the retirement situation.
* A `fact_retirement` and a `fact_active` tables, used as a backbone for the report are introduced in the `human_resources` mart.
* A `fact_retirement_forecasts` is added to the mart as it could be reused in a more strategical dashboard.
* A new seed, `int_sequence_0_to_1000` is introduced. This seed can be cause to generate integer sequences.

# What is left out of the pull request
* Due to the summer break, the human resources&#39; product owner (@&lt;melanie.ranger&gt; ) hasn&#39;t review the dashboard yet. The wording of the dashboard, as well as some cosmetics adjustments following Mélanie&#39;s review will be done in an other pull request.

# How to run the pull request ?

You will need a working development branch with the `human resources` mart enabled and seeds populated as per the `core.develop` branch requirements.
For the **cssvt**, a companion branch (*feature/retirement*) has been created to run and review the pull request.

```bash
# Assuming you are in a folder containing both the core.data.tbe and the &lt;cssXX&gt;.data.tbe folder.
# Update the code
cd core.data.tbe
git checkout feature/retirement
git pull
cd ../cssvt.data.tbe
git checkout feature/retirement
git pull

dbt build --select +tag:retirement
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My workw item has been moved to `review` in the taskboard. ([`34a32ca`](https://github.com/Sciance-Inc/core.dashboards_store/commit/34a32ca26c5095f2b383c4fa761d0ff30845023e))

* feat: adding hooks for implementing custom populations

# Objectives of the pull request

This PR adds an overridable placeholder, acting as an entry point to add custom populations. The placeholders is designed to be overrided in the `cssXX.data.tbe`.

# How to run the pull request ?
&gt; By default the custom populations are empty.

```bash
# Assuming you are in a folder containing both the core.data.tbe and the &lt;cssXX&gt;.data.tbe folder.
# Update the code
cd core.data.tbe
git checkout feature/customPopulations
git pull
cd ../&lt;cssXX&gt;.data.tbe
dbt build --select +custom_fgj_populations
```

# Pull request&#39;s checklist

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X} My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My workw item has been moved to `review` in the taskboard.

feat: adding hooks for implementing custom populations ([`966e55d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/966e55d5c5ab4d08dd199a498c339e67fb8d4a02))

* feat: adding fact_permanent_employe

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

Le but principal de cette requête est d&#39;aller chercher l&#39;état de permanence.

Dans cet PR nous considérons que pour avoir une permanence, il faut avoir travailler une période de deux ans, soit à partir de la date de début du poste actuel ou d&#39;un poste dans le même groupe demploi et la date courante et ce sans cessation d&#39;emploi.

Nous sommes conscients qu&#39;il y a une pluralité de définitions sur qu&#39;est-ce que la permanence.

Mais il s&#39;agit d&#39;une définition qui s&#39;applique à tous les CSS

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout **feature/rh_permanence**
git pull
Add a CSV named rh_etat_empl here : cssXX/seeds/marts/human_resources/rh_etat_empl.csvcsv
with the content you can find here : https://dev.azure.com/Centre-Expertise-IA/COTRA-CE/_git/core.data.tbe?path=/seeds/marts/human_ressources/schema.yml&amp;version=GBdevelop&amp;_a=contents
cd ../&lt;cssXX&gt;.data.tbe
dbt build --select tag:rh_permanence
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes. **not applicable**
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [ ]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
![pr.jpg](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/398/attachments/pr.jpg)
  * [X]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have careful... ([`e30fc89`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e30fc89f5e639934eb198c8782fff7fa8f29beea))

### Fix

* fix: change_dbt_project_name_to_store

&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
- le seul but de cette PR est de corriger le nom du dbt_project du core de &#34;TBE&#34; à &#34;STORE&#34;

&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout bugfix/rename_dbt_project
git pull
cd ../cssvdc.data.store
git checkout develop
git pull
dbt build compile
```

&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Template** :
  *  [ ] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [ ]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [ ]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in the taskboard.

fix :change_dbt_project_name_to_store ([`30a4bdb`](https://github.com/Sciance-Inc/core.dashboards_store/commit/30a4bdb81169e0edff0de351c88bc5abcc894502))

* fix: typo in doc ([`512903f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/512903f1d4b24b8771e26f051cf88efd6c885dbb))

* fix: the macro no properly delete the schema and the views ([`71ec6a1`](https://github.com/Sciance-Inc/core.dashboards_store/commit/71ec6a187a03e374c2e31d4a3bdc9d8b8b67f9b8))

* fix(suivi_resultat): correcting seeds&#39; friendly name and mandatory courses

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
cette PR a pour but de corriger le nom des épreuves et de les rendre compréhensibles

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/subj_name
git pull
cd ../cssvdc.data.tbe
git checkout develop
git pull
dbt build --select tag:res_epreuves
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [ ]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
  * [x]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

Related work items: #2219 ([`aa80750`](https://github.com/Sciance-Inc/core.dashboards_store/commit/aa807507cdbf878b5bc16fb51a7e0107c2b2701d))

### Refactor

* refactor: update effectif_css dashboard to match the template

&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
cette à pour but de mettre à jou le tdb d&#39;effectif avec les norme du template qui a été adopter.
&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout feature/maj_tplt_effectf
git pull
cd ../cssvdc.data.store
git checkout develop
git pull
dbt build --select tag:effectif_css
```

&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Template** :
  *  [ ] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [x]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard.

Related work items: #2291 ([`91de6a4`](https://github.com/Sciance-Inc/core.dashboards_store/commit/91de6a4fa5131b5aa6dd390d724048a7c6e38cac))

* refactor: renaming TBE to store, uniformizing code accross dashboards and enforcing conventions

# Objectives of the Pull Request ?
* The previous name of the dbt project : `tbe` (_tableau de bord equilibre_) wasn&#39;t making sense. This PR renames the project to `store`.
* The PR cleans the existing code base and improves code consistency across dashboards.
* All dashboards have now their own schema, every single one being prefixed with `dashboard_`
* The `.pbit` files have been plugged into the new schemas
* The deprecated `is_context_core`, an unused varaible has been removed. As a consequence, the `adapt` macro has been removed and every call to this macro has been replaced with the dbt-ic command `{{ source }}`

# What is left out of the Pull Request ?
* The PR does not introduces any changes to the code semantic.

# How to run the pull request ?
__It is advised to rename the folder `core.data.tbe` to `core.data.store` and to update the `&lt;cssXX&gt;.data.tbe/packages.yml` to references `core.data.store`__

__a companion branch (named `uniformization`) has been created in `cssvdc.data.tbe`  to help you review the pull request__

```bash
# Assuming you are in a folder containing both the core.data.tbe and the &lt;cssXX&gt;.data.tbe folder.
# Update the code
cd core.data.tbe # OR core.data.store
git checkout feature/uniformization
git pull
cd ../&lt;cssXX&gt;.data.tbe # OR &lt;cssXX&gt;.data.store
git checkout feature/uniformization
git pull

dbt clean
dbt deps
dbt run-operation drop_schema
dbt build --full-refresh
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ X I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in the taskboard. ([`e4110f2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e4110f2811c7ab4287dc9d7d7ec1ce0f7119b649))

* refactor: moving the prospective dashboards s facts to the prospective dashboard folder

# Objectives of the Pull Request ?
* The PR cleans up the educ_serv mart and move back the prospective related files into the prospective dashboard folders.
* As the `fact_freq_fga` and `fact_freq_fga` are only used by the prospective dashboard, it does not make sense to have those tables in the mart. In addition, and since the introduction of the new mechanism population, base population should be directly computed from the `pop*` table.

# What is left out of the Pull Request ?
* The PR does not refactor the prospective dashboard to use the new population tables. This change should be a part of a more profound refactor of the dashboard.

# How to run the pull request ?
&gt; Running the pull request assumes you have the `prospective_tbe` dashboard enabled and configured as per the documentation.

**You must replace `&lt;cssXX&gt;` with the name of a (your ?) running CSS repo with the prospective dashboard enabled.

```bash
# Assuming you are in a folder containing both the core.data.tbe and the &lt;cssXX&gt;.data.tbe folder.
# Update the code
cd core.data.tbe
git checkout feature/movingToDashboard
git pull
cd ../&lt;cssXX&gt;.data.tbe
git checkout develop
git pull

dbt build --select +tag:prospectif_cdp
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.

# Commits
refactor: moving the prospective dashboards s facts to the prospective dashboard folder ([`476c69b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/476c69b7b9abb63b4efdb5825b46f0456010f4c8))

* refactor: renaming ressources -&gt; resources

* This PR correct a typo in the tags and in the models tree. `human resources`  was incorrectly labelled. The supernumerary `s` has been removed.
* This PR actually introduces a breaking change as all inherited dbt project will have to properly rewrite the path to the resources.

You must have a valid `cssXX.data.tbe/dbt_project.yml` configured to use `human_resources` instead of `human_resources`

```bash
cd core.data.tbe
git checkout feature/typoResources
git pull
cd ../&lt;cssXX&gt;.data.tbe
git checkout develop
git pull
dbt build
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My workw item has been moved to `review` in the taskboard.

refactor: renaming ressources -&gt; resources ([`48381fe`](https://github.com/Sciance-Inc/core.dashboards_store/commit/48381feeee5b03dac15d6d3f444b0926c4b9fcf4))

### Unknown

* fix :change_dbt_project_name_to_store

# Objectives of the Pull Request ?
&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
- le seul but de cette PR est de corriger le nom du dbt_project du core de &#34;TBE&#34; à &#34;STORE&#34;

# What is left out of the Pull Request ?
&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

# How to run the pull request ?
&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store and the &lt;cssXX&gt;.data.store folder.
# Update the code
cd core.data.store
git checkout bugfix/rename_dbt_project
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
cd ../cssvdc.data.store
git checkout develop
git pull
# Might be required if you add a new DBT dependency
#dbt deps
# Run dbt
dbt build compile
```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Template** :
  *  [ ] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [ ]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [ ]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in the taskboard.

fix :change_dbt_project_name_to_store ([`ff28e96`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ff28e9661069dbb70e93b801b86f6c29fc854839))

* Merge branch &#39;master&#39; of github.com:Sciance-Inc/core.dashboards_store ([`f9b5e9d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f9b5e9d2af119a2f638096f0903179ee90d6ac97))

* Merge pull request #1 from Sciance-Inc/develop

release v4.0 ([`bce8ddd`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bce8ddd5154b7472e77d075e7ef288582b728b7f))

* Merge branch &#39;master&#39; into develop ([`26606f2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/26606f2266029edf45e1594445ee684765f32e67))

* Merged PR 423: Ajout des tags pour les tableaux de bord prospectif_cdp

# Objectives of the Pull Request ?
&gt; Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?

The goal of this PR is to run the tdb of prospectif_cdp individually or all of them in 1 command. Hence, the addition of these tag mentionned under.

# What is left out of the Pull Request ?
&gt; Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

Nothing. Everything that we have planned is accomplished so far.

# How to run the pull request ?
&gt; Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store and the &lt;cssXX&gt;.data.store folder.
# Update the code
cd core.data.store OR cd core.data.tbe
git checkout feature/prospectif_tag
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
cd ../&lt;cssvt&gt;.data.store OR .data.tbe
git checkout feature/prospectif_tag
git pull
# Might be required if you add a new DBT dependency
#dbt deps

# Run dbt
Do not forget to run dbt seed --select tag:prospectif_cdp --full-refresh
dbt build --select tag:prospectif_cdp
```

The goal of this PR is this test the tag. Be free to do so.

Tag Available :

prospectif_cdp
res_matieres
anciennete
cout_roulement
emp_retraite
fidelite
emp_retraite

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. Your PR&#39;s review might be delayed otherwise.

First PR with tag. Tag me if something is not right!

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [NA] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Documentation** :
  * [NA]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR wer... ([`07a4d25`](https://github.com/Sciance-Inc/core.dashboards_store/commit/07a4d25e2b07a76422123407f27c0b96f10989da))

* Merged PR 412: Bugfix pour res_matieres prospectif_cdp

# Objectives of the pull request
&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

J&#39;ai appliqué une correction d&#39;orthographe sur la seed res_matieres (colonne friendly_name) et j&#39;ai ajouter les tests dans le shema.yml, sans parler des modifications par rapport aux changement du nom de friendly_name également dans le schemal.yml

# How to run the pull request ?
&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.tbe and the &lt;cssXX&gt;.data.tbe folder.

Pour rouler le code :

cd core.data.tbe/
git checkout bugfix/prospectif_fix
cd ..
cd cssvt.data.tbe/
git checkout bugfix/prospec_fix
dbt run-operation drop_schema
dbt seed --full-refresh
dbt build --select +prspctf_nb_ele_plus_de_66

```

# Pull request&#39;s checklist
&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `&lt;feat|fix|chore|doc|refactor|perf|style&gt;: foo bar`
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes. ([`fb94ef9`](https://github.com/Sciance-Inc/core.dashboards_store/commit/fb94ef9c6b6e0a0f2a959aac3816bb4a12de410a))


## v0.3.2 (2023-06-26)

### Build

* build: updating version REGEX ([`e48cb4a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e48cb4ae32652cf67c03cf82b27e8b17cf95b00d))

### Fix

* fix: casting the timeout as integer to allow for string like definition in the inherited dags ([`987b90a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/987b90afa242e9a3d346edfd848b385ad635596a))

### Unknown

* Merge branch &#39;develop&#39; ([`ae3a746`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ae3a7460b03b1259b2321ce6e35de8ec7176d15a))

* Merge branch &#39;develop&#39; ([`0003eb1`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0003eb112b0c88f63b3c3aec2f59074f700f4358))

* Merge branch &#39;master&#39; of github.com:Sciance-Inc/core.dashboards_store ([`12eac82`](https://github.com/Sciance-Inc/core.dashboards_store/commit/12eac825e0d03ab0cd01d27a7add6afc6a734c6a))

* Merge branch &#39;develop&#39; ([`a198eb3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a198eb30159f7a9697844a39554a272fa8ce0717))

* Revert &#34;fix | PR comments v2&#34;

This reverts commit 438dbca74ae6fad3628913db750dec82c442b807. ([`7c3ea68`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7c3ea6859135c810b1dd6cc4b3b7746576f7167e))

* fix | PR comments v2 ([`5fe82c0`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5fe82c08693e3d9c78a1d83f8a89f34bdc37c400))

* doc: Bonification du readme pour Effectif_css

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

Cette PR modifie aucun code. C&#39;est une bonification fait au readme pour l&#39;effectif_CSS. Aucun test est à faire.

* **Code** :
Ne s&#39;applique pas

Feat : Bonification du readme pour Effectif_css ([`0d3b381`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0d3b38140c954d41c25b87daba05058b9d46a5ad))


## v0.3.1 (2023-06-08)

### Build

* build: dumping json to keep header properly setted ([`bad9a83`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bad9a83ed2dfc4551e493f2acb27347556cf5bf3))

* build: payalod is now a dictionary to be serialized ([`86806d7`](https://github.com/Sciance-Inc/core.dashboards_store/commit/86806d7be75d8747a531e9418f4f7c87ab6f664c))

* build: adding etl_profile ([`0318e2f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0318e2f8ddbc63386862631d9c2641ec3af73f75))

* build: forcing the use of the etl_profile to make the etl profile invariant ([`6970c3a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6970c3a3e543386aa866e374275ace350f4471b5))

* build: adding notification to the DBT failure ([`a133b6c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a133b6c4dffa84c3042febc18fd952ac1c5bc7d4))

* build: including the manifest in the dag folder ([`f88ecae`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f88ecaef65b82374959120a557eb15a7cabdce19))

* build: unesting deployment folder ([`5451735`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5451735fbb196e4b096f7fae2bd58ec55a8b0585))

* build: adding support for variable docker host ([`6ebbaa3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6ebbaa33d3f6e15861d0730192b14daddcc382cd))

* build: reducing the exported files ([`38cf61b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/38cf61bcdf31d5c35230ac0278f1cf938f3814a7))

* build: add profiles and dag file to the image ([`561ef91`](https://github.com/Sciance-Inc/core.dashboards_store/commit/561ef91313980b92d2bdcfd150082e0a259b5862))

### Chore

* chore: adding item to the pull request template ([`68b6eee`](https://github.com/Sciance-Inc/core.dashboards_store/commit/68b6eeed603b2b66b0edd10616417d17820d7388))

### Fix

* fix: remove blank results and correct subject evaluation code

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
Cette PR a pour objectif de régler le problème des doublons qui proviennent de la table des résultats ministérielles de Jade. elle corrige aussi des typos dans les codes des matières des épreuves

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout bugfix/doublons_res_epr
git pull
cd ../cssvdc.data.tbe
git checkout develop
git pull
dbt build --select tag:res_epreuves
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
  * [x]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

Related work items: #2014 ([`de87bc1`](https://github.com/Sciance-Inc/core.dashboards_store/commit/de87bc13bb3b79917d77760f0249b9362358b24d))

### Refactor

* refactor: defaulting docker URL on local socket ([`1f0cb0d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1f0cb0d92677fb2189ac203cb361a4a5b08ae164))

### Unknown

* Merge branch &#39;master&#39; into develop ([`9e3755c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9e3755cff98e933541a6ed31eab76a22a8f7d6d1))

* Merge branch &#39;master&#39; into develop ([`893f1bd`](https://github.com/Sciance-Inc/core.dashboards_store/commit/893f1bdfecd25f89d91375edcc55e431d1c111a5))


## v0.3.0 (2023-05-30)

### Build

* build: adding CICD

build: adding missing workflows folder

build: adding notifcation of failures

build: renaming staging database to staging

build: adding building of master images

feat: adding semantic release

feat: disabling all release ([`51aa803`](https://github.com/Sciance-Inc/core.dashboards_store/commit/51aa80389fe86f0f21c5287c8fb52ca5d355c24d))

* build: adding semantic release ([`5e6c24c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5e6c24c5bd18f1bd9533db9f81e8963ce36aea59))

* build: adding CICD

build: adding missing workflows folder

build: adding notifcation of failures

build: renaming staging database to staging

build: adding building of master images

feat: adding semantic release

feat: disabling all release ([`d689069`](https://github.com/Sciance-Inc/core.dashboards_store/commit/d689069fcb984a2f68551d9f7bd84d7004baa8c5))

* build: adding semantic release ([`8a80d88`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8a80d8833cbee0e1306447b51b0c2212d7814608))

### Chore

* chore: template typo correction ([`1466eef`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1466eef469bb630ad9d5a59f5482f297f7de7669))

* chore: template typo correction ([`fbc9541`](https://github.com/Sciance-Inc/core.dashboards_store/commit/fbc9541f7e77026a69bcd87f8e2d0b4f6df08f0f))

* chore: adding a pull request template to the repo ([`c84fed3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c84fed331269e24307f099babc6ec89892e81067))

* chore: empty commit to trigger a revierw from Julie and Nathalie ([`1d1a660`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1d1a660dd6db4ab95cf8441b7fa3316ce38ba951))

* chore: updating dependencies ([`6c1ca12`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6c1ca12227cc817a37455af9fa84251fa47ac23e))

* chore: adjustment of the schema that describes the emp_conge dashboard scripts ([`b8c3981`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b8c39812bd059d765417f8fa7c41c5482723beb1))

* chore: update README part 2 ([`243bca7`](https://github.com/Sciance-Inc/core.dashboards_store/commit/243bca72396eb9c6ab4f4e0971b4224d3c6ad27c))

* chore: management of the centralized schema ([`718b7a4`](https://github.com/Sciance-Inc/core.dashboards_store/commit/718b7a40881700c7144802bb8efd96ad3b813b3e))

* chore: update the README ([`1eb7208`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1eb720861fd881a43f2f5610f3da6d98095d6e8d))

* chore: change the table empcong_fact_emp_conge to fact_emp_conge ([`9952e66`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9952e66a5ba7047615d34f907972f85be865fc0f))

* chore: adjustment of the schema that describes the dashboard scripts prospective_cdp ([`8a5a316`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8a5a3162fa15788d788aaeaa0ee3341ada2bad51))

* chore: adjustment of the schema that describes the emp_conge dashboard scripts ([`0aaf111`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0aaf1112f7a29f86b581b024aced1513efe8c459))

* chore: modification of the dbt_project so that it respects the conventions of the tbe project ([`ccc203e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ccc203efb7d8ae6f1e59e759352ce095a0e910b9))

* chore: rename the script stg_parc_activ_10y because it is not used to generate a staging table ([`a7cbebf`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a7cbebfda9c62a02aa865ce8af2e91ec57e79664))

* chore: rename the script stg_parc_activ_10y because it is not used to generate a staging table ([`ee0cf3f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ee0cf3fc806313d9f74d80e660e8f62a29692f3c))

* chore: modif of the stg_parc_activ_10y script so that it respects the conventions of the project ([`97b0fd3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/97b0fd334a3d567a558754952ff1e71e1f7d2ce2))

* chore: adjustment of the schema that describes the interface tables of the geobus database ([`0f17bc9`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0f17bc9f7082b5d2dac4bf5e9570e5f2059ccdc4))

* chore: modification of the i_geobus_parc script so that it respects the conventions of the project (part2). ([`2bfc12d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/2bfc12d644dbdbc94c78a8bbc0ed5a12241e338a))

* chore: adjustment of the schema that describes the interface tables of the piastre database ([`863cccc`](https://github.com/Sciance-Inc/core.dashboards_store/commit/863cccc3ce258c7bd2dc59e4348a232f7cabf74f))

* chore: modification of the i_geobus_parc script so that it respects the project conventions ([`eb0088c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/eb0088c485cacfa71b5e1789bb805c27334c4e6a))

* chore: move the schema of the &#39;transport&#39; dashboard. 1 schema that centralizes all the information ([`81123d2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/81123d22b133b6139890862735f4ec0f85ee5b04))

* chore: change the project structure (store structure) ([`961bf8c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/961bf8c1f2c340f57f4172cb67ce490485a76f6f))

* chore: put the tests in the macro adapt in comments ([`66f790d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/66f790d004f90313daa492e88338a24d4767eafd))

* chore: update the packages ([`f9c77d5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f9c77d5e222896f632406b5e892bae2fd53d2322))

* chore: update the sources file ([`4ba22f8`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4ba22f8a127c3f2e87ae6f86c3b9d74317deeabf))

* chore: change the project structure (store structure) ([`c1f2d90`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c1f2d9069f3c0a0764516176f8059f69c507639c))

* chore: put the tests in the macro adapt in comments ([`4f576fd`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4f576fd7767ee6fa7e284bcf744b08b1fc063a46))

* chore: update the packages ([`aa19145`](https://github.com/Sciance-Inc/core.dashboards_store/commit/aa19145099f5c21ebb98c9608466a2cddfc378ee))

* chore: update the sources file ([`a8e09f9`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a8e09f919e85087d87643861fd41755eda231086))

* chore: update of the source file which indicates the adapters ([`140c98d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/140c98d1bd1ce282898b3ed2b0af79656f248c73))

* chore: change the name of the source database ([`8ef893a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8ef893a92ebe9a3411c83d1c5441a30c90c432b9))

* chore: add schema file for bridges folder ([`bf0f765`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bf0f7659a1eaad9da71d99d12e0ecfca728708ac))

* chore: change keyword pevr by tbe ([`8ba436e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8ba436e1c2458b46671f39cd24d09a0ebe6c523d))

### Documentation

* docs: fixing various typos in the docs and adding a placeholder for populations ([`27e8ee0`](https://github.com/Sciance-Inc/core.dashboards_store/commit/27e8ee047b5d138343a263f279461b655d46cf0d))

* docs: fixing a typo in the prospectif_cdep interfaces ([`982ab5c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/982ab5cbf455fd496a82c23e19f92a2d5408224f))

### Feature

* feat: adding the effectif_css dashboard

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

Le but de ce tdb est de faire le dénombrement de la population au sein d&#39;un centre de service scolaire. La population étant séparé en 4 : Prescolaire, primaire régulier, primaire adapté, secondaire régulier et secondaire adapté.

Cette population est divisé selon le niveau scolaire de l&#39;élève également. PRES4ANS, PRES5ANS, 1er année à la 6ème année, puis 1er secondaire au 5ème secondaire.

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/effectif_css
git pull
cd ../cssvt.data.tbe
git checkout feature/tdb_effectif
git pull
dbt build --select tag:effectif_css
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  *  [X] My work item is linked to the pull request.
  * [X] My workw item has been moved to `review` in the taskboard. ([`11f44d5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/11f44d5204857f2a4a21e98fe9d4aa25ef61fd73))

* feat: adding sectors and filter-by-sectors to the transport dashboard

make of filtering of circuits by sectors.

The following section describe the specific for transport scolaire  dashboard in the READEME.md
 __236_ to 252_ lines

How to run the pull request ?
git checkout core.data.tbe/feature/trnsp_secteurs
git pull
cd ../csshc.data.tbe
git checkout transport
git pull
dbt build --select tag:transport

* **Code** :
  * [ x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ x]  I have updated the documentation (README) accordingly to my changes.
  * [ x]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [ x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x ]  I have added my CSS lead as a reviewer.
  * [x ]  My pull request is documented.
  * [x ]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [X ] My work item is linked to the pull request.
  * [X ] My workw item has been moved to `review` in the taskboard.

Related work items: #1935, #1938, #2003 ([`e3f7ff2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e3f7ff243d83f2fec0366197b7132fb53bb77349))

* feat: adding the effectif_css dashboard

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

Le but de ce tdb est de faire le dénombrement de la population au sein d&#39;un centre de service scolaire. La population étant séparé en 4 : Prescolaire, primaire régulier, primaire adapté, secondaire régulier et secondaire adapté.

Cette population est divisé selon le niveau scolaire de l&#39;élève également. PRES4ANS, PRES5ANS, 1er année à la 6ème année, puis 1er secondaire au 5ème secondaire.

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/effectif_css
git pull
cd ../cssvt.data.tbe
git checkout feature/tdb_effectif
git pull
dbt build --select tag:effectif_css
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  *  [X] My work item is linked to the pull request.
  * [X] My workw item has been moved to `review` in the taskboard. ([`0f94a10`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0f94a102f887e50b17395787f0e767845b8d3022))

* feat: adding sectors and filter-by-sectors to the transport dashboard

make of filtering of circuits by sectors.

The following section describe the specific for transport scolaire  dashboard in the READEME.md
 __236_ to 252_ lines

How to run the pull request ?
git checkout core.data.tbe/feature/trnsp_secteurs
git pull
cd ../csshc.data.tbe
git checkout transport
git pull
dbt build --select tag:transport

* **Code** :
  * [ x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ x]  I have updated the documentation (README) accordingly to my changes.
  * [ x]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [ x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x ]  I have added my CSS lead as a reviewer.
  * [x ]  My pull request is documented.
  * [x ]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [X ] My work item is linked to the pull request.
  * [X ] My workw item has been moved to `review` in the taskboard.

Related work items: #1935, #1938, #2003 ([`b69e865`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b69e865c2afab0d52ea7ee410f4815e480ca33ea))

* feat: improvind documentation of the PR template ([`c0c0841`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c0c084146462e3e86f2602a360c631aa478fe983))

* feat: adding drop schema macro ([`e7c30de`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e7c30de1e916150396ccae85554dfce8e9ca47a9))

* feat: adding missing seeds in core_dbt_project ([`3c5ecec`](https://github.com/Sciance-Inc/core.dashboards_store/commit/3c5ecec4b1408884fed580ae6d9e5d2a555d87a2))

* feat: adding MatieresEleve  interfaces ([`b627acd`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b627acd5f881c42ce8d7c98300505c3fb8c17a0a))

* feat: add_masse_sal_to_this_table ([`64649b6`](https://github.com/Sciance-Inc/core.dashboards_store/commit/64649b61681be40ee14b0b52d843b3c04fd61b8e))

* feat: move_table_to_sub_folder_cout_roulement ([`7856608`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7856608825b45c39c459e14a6f719171e31a6aed))

* feat: move_table_to_sub_folder_cout_roulement_and_modify_filter_and_annee_type ([`a7ffeaa`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a7ffeaa7c806bbe05d302e1a7b48ebbaf6f525a4))

* feat: add taux roulement personnel ([`ca56f85`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ca56f85f400867b71defa3bda7ae1d1e08ad2c10))

* feat: modify_filter ([`e13caf8`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e13caf8d7e08629cec44f63593e90c597380fdc7))

* feat: addtable_empl_quitter ([`d97b1b1`](https://github.com/Sciance-Inc/core.dashboards_store/commit/d97b1b1b9df848a9f4483f4ada209dc7d2de1683))

* feat: delet_shema ([`bd9d293`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bd9d293b3f53fc1e2bb7c0cb152ca8fdf97c7847))

* feat: add_schema_to_staging_res_etapes_table ([`6c9f7c5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6c9f7c5673282817dfa72b78c4e6df392579c9c9))

* feat:  detele_non_used_table ([`2911998`](https://github.com/Sciance-Inc/core.dashboards_store/commit/29119981c5df10a6824d65128fc009703f82c4e2))

* feat: freezing dbt-core and dbt-sql-server to ensure across CSS dependencies consistency ([`dc4e7da`](https://github.com/Sciance-Inc/core.dashboards_store/commit/dc4e7da0c932f0688fcdfe6e74406c6cb8d04ed2))

* feat: add_new_fields_i_e_ri_resultats ([`c577b84`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c577b84757925330fca70f9176b04b234add7de1))

* feat: add_new_vars_to_dbt_project ([`11bdb39`](https://github.com/Sciance-Inc/core.dashboards_store/commit/11bdb39fd2c850f9d550685e2d0faea08b7f8980))

* feat: update_README_with_new_info_for_model_res_etapes ([`3cd96d1`](https://github.com/Sciance-Inc/core.dashboards_store/commit/3cd96d172a31ef7457e4bcb7fbdd5066536a4916))

* feat: add_new_table_to _schema ([`c34fad2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c34fad28abaa803cdaac3534bc1c3b81723060d3))

* feat: add_gouv_evaluation_name _to_seed_table ([`445813d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/445813d3fee3faa4c6c9c77e7a67cbd632b2e41b))

* feat: add_new_interface_table_to_schema ([`fbf0149`](https://github.com/Sciance-Inc/core.dashboards_store/commit/fbf01498ac5decd3240f3235d5da0d99764fae12))

* feat: extract_gouv_rslt_from_interface_table ([`89ae487`](https://github.com/Sciance-Inc/core.dashboards_store/commit/89ae4873d7115429c78bf5909216cd36238e9a32))

* feat: add_diff_to_school_table ([`31f943e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/31f943e0750cd0d4633f5c6b609ed8500645f487))

* feat: add_dbt_utils_package ([`2338780`](https://github.com/Sciance-Inc/core.dashboards_store/commit/23387805c5af3ae5cd23994ff82091b55d57fd70))

* feat: add_id_friendly_name ([`a7eea47`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a7eea476ea403228bdb3fba25b9fa884f6c8874f))

* feat: add_new_model_emp_cong_to_dbtproject ([`ff11e76`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ff11e76db48b1163e6cba67ad8fac474a1b261fc))

* feat: move_interface_table_cssrepo_to_core_modify_schema.yml ([`84bf8c8`](https://github.com/Sciance-Inc/core.dashboards_store/commit/84bf8c80b822723005b9e5dc59bfa368c796a4f0))

* feat: change in the dbt_project to manually activate the dashboards of interest on the css repo (enable option) ([`9ee5048`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9ee5048b96c2fc0ea17e3e1ac324d2a10396af6a))

* feat: adapt macro test ([`c97cb31`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c97cb31433cd1acd53f8a00224f3eed4019aacd0))

* feat: add a fact table that tracks the number of part-time employees in the last 10 years ([`c0df3ae`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c0df3ae02ec2a266606a789aa68dbaa2ce9c45e7))

* feat: connection of databases: geobus and piastreto obtain data for analyzing school transport  efficiency ([`cb197de`](https://github.com/Sciance-Inc/core.dashboards_store/commit/cb197dec0ebf67c67ca7526ea08577c44c2e3daa))

* feat: add_new_model_emp_cong_to_dbtproject ([`baa58eb`](https://github.com/Sciance-Inc/core.dashboards_store/commit/baa58eb89cc34ca0859480106572050294528944))

* feat: move_interface_table_cssrepo_to_core_modify_schema.yml ([`6edb881`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6edb881d56c8495643e87f2470a1e91953832a08))

* feat: change in the dbt_project to manually activate the dashboards of interest on the css repo (enable option) ([`f8dd5ab`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f8dd5abcfef0573f20632d5fbd2c1086c15b4b99))

* feat: connection of databases: geobus and piastreto obtain data for analyzing school transport  efficiency ([`4c21bd8`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4c21bd8c6cc509400b1f5ac11eb3b218ac91e218))

* feat: adapt macro test ([`c70431b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c70431bb84fcbbf2b775b63ddc23c1967f0f672b))

* feat: add a fact table that tracks the number of part-time employees in the last 10 years ([`87c16e2`](https://github.com/Sciance-Inc/core.dashboards_store/commit/87c16e2c05ac4869efc1c08e93925ccf3594d995))

* feat: add base_spine table ([`819cf5a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/819cf5ad3ce05b628d5522e363fc874b05a6d608))

* feat: add stg_populations ([`512146d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/512146d40003a8151877c098b9af7ec48097ce05))

* feat: add adapt macro ([`de7b290`](https://github.com/Sciance-Inc/core.dashboards_store/commit/de7b290b3f442025d2823017a738c87096871e2f))

* feat: adding test  in the core repo ([`a4acb2a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a4acb2a9ab9e16155f780c4caf00b1692918495b))

### Fix

* fix: transports tests are now only executed if the transport is available ([`8231318`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8231318591708316e3df2d175ea9b6919a54820a))

* fix: transports tests are now only executed if the transport is available ([`e7c2157`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e7c21572225a214fe6702a7cf14217a15769d412))

* fix: propagating renaming ([`cc9de86`](https://github.com/Sciance-Inc/core.dashboards_store/commit/cc9de86bdb61b77d02c955108f15b472da510a00))

* fix: updating the code-placeholder since the commands in the placeholders were out of order ([`659a75b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/659a75b37419e2ad6dfaaf2377b35d0e30105601))

* fix: correct_error_in_schema ([`831ecad`](https://github.com/Sciance-Inc/core.dashboards_store/commit/831ecad6d37b20098516b9c316afb154b5ad383e))

* fix: modification of the &#39;transport&#39; dashboard schema ([`6984b85`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6984b857dfe97e4ad119050c9326f5c537ec38a8))

* fix: adding missing weighting ([`9739c88`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9739c88884affee5006b9bc293163a6c8de5cdfa))

* fix: adding missing weighting ([`11bf79f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/11bf79f3cf625f8a00d28ee988812a33bdf777d7))

* fix: add_model_prefix ([`cdabb33`](https://github.com/Sciance-Inc/core.dashboards_store/commit/cdabb33ff4bd9a95c2ae00a77e900e52e562f3df))

* fix: correcti models_name ([`83ca72b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/83ca72b3aff7976c3fb44347b9dc9f7c64a455e2))

* fix: modify_var_naming ([`bb2e1e5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bb2e1e5cc2247b37fec9581b78313165038a2e6c))

* fix: fixing dbt project ([`5a6a4e6`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5a6a4e63f4bfaa1d9e8f24041dd67bf94f7ed532))

* fix: removing dead code ([`a16cc66`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a16cc660b3750ce603632f01517f1a6968515723))

* fix: add_prefix_to test_name_to_resolve_ambiguity ([`0338c88`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0338c88b01c9eb73cb7007080a469e191e72a75d))

* fix: modify version_from_0_to_2 ([`cc16df3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/cc16df3305e3dca0c29e39827e45bb0e21677ff1))

* fix: updated comments ([`178f319`](https://github.com/Sciance-Inc/core.dashboards_store/commit/178f319bf9b2891e371e6ec9a6cf3485f9c4796e))

* fix: add_prefix_to test_name_to_resolve_ambiguity ([`d8dacaa`](https://github.com/Sciance-Inc/core.dashboards_store/commit/d8dacaa4f4d3d9012ada872f77bcb97d2e9873c4))

* fix: modify version_from_0_to_2 ([`2a99c8e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/2a99c8ed44d896f663a6e56876380f80099cb544))

* fix: delet_conflict_message ([`7c7dc62`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7c7dc62482c64e1ce70ff675b59b9c10f1ad950e))

* fix: updated comments ([`13ce039`](https://github.com/Sciance-Inc/core.dashboards_store/commit/13ce039e786a12ff6667aa65f5c89416fa8c6ccb))

### Refactor

* refactor: renaming the prspctf_nb_el_fgj table

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
cette PR a pour but de  :
   - changer le nom de la table emp_retraite dans les connection de base de donner dans le PBIT du tdb preospectif
   - modifier le code de la table nb_el_fgj pour matcher le changement de la spine
   - modifier un typo dans le template des PR

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/modif_table_name_prspctf_db
git pull
cd ../cssvdc.data.tbe
git checkout feature/modif_table_name_prspctf_db
git pull
dbt run-operation drop_schema
dbt build --select tag:prospectif_cdp
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
  * [x]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

Related work items: #1889

Merged PR 392: refactor: renaming the prspctf_nb_el_fgj table

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
cette PR a pour but de  :
   - changer le nom de la table emp_retraite dans les connection de base de donner dans le PBIT du tdb preospectif
   - modifier le code de la table nb_el_fgj pour matcher le changement de la spine
   - modifier un typo dans le template des PR

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/modif_table_name_prspctf_db
git pull
cd ../cssvdc.data.tbe
git checkout feature/modif_table_name_prspctf_db
git pull
dbt run-operation drop_schema
dbt build --select tag:prospectif_cdp
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
  * [x]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

Related work items: #1889 ([`7cce3bb`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7cce3bb1dc3102d0e887c85140181bf1568c3c2a))

* refactor: prospectif_cdp is now using the rh seed from the RH mart

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
- remove prefix from seed name
- delete sources.yml
- add stat_eng to the schema.yml
- modification stat_eng name in fact tables

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout bugfix/correct_bug
git pull
cd ../&lt;cssvdc&gt;.data.tbe
git checkout develop
git pull
dbt build --select tag:prospectif_cdp
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [x]  I have updated the documentation (README) accordingly to my changes.
  * [x]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
  * [x]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard. ([`4b3c755`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4b3c755e2d57c4d57a163ae61990277636718a08))

* refactor: prospectif_cdp is now using the rh seed from the RH mart

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
- remove prefix from seed name
- delete sources.yml
- add stat_eng to the schema.yml
- modification stat_eng name in fact tables

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout bugfix/correct_bug
git pull
cd ../&lt;cssvdc&gt;.data.tbe
git checkout develop
git pull
dbt build --select tag:prospectif_cdp
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [x]  I have updated the documentation (README) accordingly to my changes.
  * [x]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
  * [x]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard. ([`1416a75`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1416a75459e13f257b61dada9db51d0a390e1bb6))

* refactor: fix the bug introduced earlier ([`5a1b94e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5a1b94e9cf8cc5544ca7ffc2fb570330b03d2881))

* refactor: test if an error message is sent when dbt test fails ([`b9bd671`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b9bd671a7be4ec9b0444d4b7972ac73558c44783))

### Unknown

* Merged PR 392: refactor: renaming the prspctf_nb_el_fgj table

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
cette PR a pour but de  :
   - changer le nom de la table emp_retraite dans les connection de base de donner dans le PBIT du tdb preospectif
   - modifier le code de la table nb_el_fgj pour matcher le changement de la spine
   - modifier un typo dans le template des PR

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/modif_table_name_prspctf_db
git pull
cd ../cssvdc.data.tbe
git checkout feature/modif_table_name_prspctf_db
git pull
dbt run-operation drop_schema
dbt build --select tag:prospectif_cdp
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
  * [x]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

Related work items: #1889

Merged PR 392: refactor: renaming the prspctf_nb_el_fgj table

&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
cette PR a pour but de  :
   - changer le nom de la table emp_retraite dans les connection de base de donner dans le PBIT du tdb preospectif
   - modifier le code de la table nb_el_fgj pour matcher le changement de la spine
   - modifier un typo dans le template des PR

&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/modif_table_name_prspctf_db
git pull
cd ../cssvdc.data.tbe
git checkout feature/modif_table_name_prspctf_db
git pull
dbt run-operation drop_schema
dbt build --select tag:prospectif_cdp
```

&gt; Please, read carefully each item before checking it. You PR&#39;s review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
  * [x]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

Related work items: #1889 ([`1f847bd`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1f847bd84def95c6efca39daf082b8c837beb531))

* doc: removing unused code ([`e542959`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e5429598faad5493543da7b59c7e566971e5ee44))

* Merged PR 379: refactoring the tree by gathering the dashboards into a dashboard folder and getting rid of the shared folder

# Objectives of the pull request
* This PR refactors the folder tree. The addition of the marts created a confusion between the `marts` and the `shared` folders. The common code had been moved into the `marts` leaving only the interfaces in the `shared` folder.
* A new top level folder : `dashboards` is created, gathering all the dashboards. This helps uncluttering the models between `marts` models and the dashboards-specifics models.
* The `shared` folder is removed, and the `interfaces` and `rls` folders are now top-level folders.
* Adding the dashboards top-level folder is now consistent with the use of the same convention in the `seeds` folder.

As a side effect, the `adapters / sources` files are moved into the dashboard folder they refer to.

What is left out of the PR
The PR does not update the documentation for prospectif_tbe. The deployment procedure is very specific and need to be refactored by itself.

# How to run the pull request ?
&gt; Assuming you are in a folder containing both the core.data.tbe and the cssvdc.data.tbe repos..

This PR use a companion branch : cssvdc.data.tbe/feature/fixingIntegrationProcedures. This branch is not to be merged yet

```
# Update the code
cd core.data.tbe
git checkout feature/refactoringTree
git pull
poetry shell
cd ../cssvdc.data.tbe
git checkout feature/refactoringTree
git pull

dbt build --full-refresh
```

# Pull request&#39;s checklist
* Code :
* Documentation :
  * [X]  I have updated the documentation accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* Pull request :
  * [X]  The provided code is working.
  * [X]  My pull request is documented.
* Taskboard : ([`802fec5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/802fec55245073086d2dce0e0b0c0388e7664c41))

* Merged PR 378: fix: readding poetry-lock removed by PR 366

# Objectives of the pull request
* The `poetry.lock` file was removed in !366 . This was a mistake. This PR brings back the file.

# How to run the pull request ?
&gt; Assuming you are in a folder containing `core.data.tbe`

```bash
# Update the code
git checkout bugfix/poetryLock
git pull
poetry install
poetry shell
```

# Pull request&#39;s checklist
* Code :
* Documentation :
* Pull request :
  * [X]  The provided code is working.
  * [X]  My pull request is documented. ([`f577b59`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f577b595a3bef6d3c8cac4ee4179d2040cd713d7))

* Merged PR 377: Simplifying the dashboards integrations by removing the need for seeds.yml files

# Objectives of the pull request
* The PR simplifies the way a dashboard can be deployed by :
  * Updating and uniformizing the documentation for all the dashboards but `prospectif_cdep`
  * Removing the need for integrators to writes `yaml` specifications when creating a seed required by a dashboard.

__Documentation__
The documentation has been reviewed for all existing dashboards. The new table-like-description has been added to all of the store&#39;s dashboard. The `data / dashboard` dependencies section has been removed. A new `additional configuration` section has been added to all dashboards previously using it.

__Seeds__
The `seeds` specification has been moved from `core.data.tbe/dbt_project` to the various and matching `core.data.tbe/seeds/*/**/schema.yml` files. These `schema.yml` files now contain : the seeds&#39; tags, the seeds&#39; schema and the seeds&#39; tests. Consequently, when implementing a seed from the `cssXX` side, it&#39;s not required to create the corresponding `schema.yml` file. Everything is now properly inherited from the core&#39;s definition. Manually repeating the tags and schema was prone to integrator&#39;s errors.

__Integrator&#39;s perspective__
By default, the `seeds` section of the `cssXX.data.tbe/dbt_project.yml` can be safely removed as it&#39;s not needed anymore to enable a seed. Of course, this section can still be used to OVERRIDE the core implementation of a (default) seed. A concrete walkthrough / use case can be found in the `res_epreuves` section of the README.

# What is left out of the PR
* The PR does not update the documentation for `prospectif_tbe`. The deployment procedure is very specific and need to be refactored by itself.

# How to run the pull request ?
&gt; Assuming you are in a folder containing both the `core.data.tbe` and the `cssvdc.data.tbe` repos..

__This PR use a companion branch : cssvdc.data.tbe/feature/fixingIntegrationProcedures. This branch is not to be merged yet__

```bash
# Update the code
cd core.data.tbe
git checkout feature/fixingIntegrationProcedures
git pull
poetry shell
cd ../cssvdc.data.tbe
git checkout feature/fixingIntegrationProcedures
git pull

dbt build --full-refresh
```

# Pull request&#39;s checklist
* Code :
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* Documentation :
  * [X]  I have updated the documentation accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* Pull request :
  * [X]  The provided code is working.
  * [X]  My pull request is documented.
* Taskboard : ([`bb9a968`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bb9a968173ae07643b093051e8351e6e0147a1e7))

* Merged PR 366: Ajout de la colonne permanence

# Objectives of the pull request

The purpose of the application is to add a filter to the active employee dashboard to identify permanents from others.
To do so, we just need to add a &#39;Oui&#39; or &#39;Non&#39; indicator.

Change SQL code from &#39;model/pni_table/ema_report_empl_actif.sql&#39; to add &#39;permanent&#39; field
Added the interface in &#39;emp_actif/shared/interfaces/i_pai_dos_perc.sql&#39; which contains the field &#39;permanent&#39;.

# How to run the pull request ?

# Update the code
git checkout core.data.tbe/feature/emp_perm
git pull
poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install

# Might be required if have cssdgs.data.tbe cloned
cd ../cssdgs.data.tbe
git checkout develop
git pull
git checkout feature/empl_perm
git rebase develop

# Run dbt
dbt seed --full-refresh
dbt run --select emp_actif

# Test the code
dbt test

# Pull request&#39;s checklist
* Code :
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* Documentation :
  * [X]  I have updated the documentation accordingly to my changes.
  * [x]  The models I have added are documented in a `schema.yml` file.
* Pull request :
  * [X]  The provided code is working.
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
* Taskboard :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

Ajout de la colonne permanence

Related work items: #1783 ([`5dfa869`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5dfa869fc99ccca7af65d8ee8515b31c5ded507d))

* Merged PR 354: create and display the indicators Parcours and Circuits in the transport dashboard

# Objectives of the pull request
&gt;  Parcours and Circuits indicators are taken to analyze
How the number of school transport services evolves in 10 years.
What is the difference in service between morning and afternoon?
Also revealed how many routes are served by the same fleet of buses in the morning, afternoon and in general

infrastructure:

** shared/interface/geobus
* i_geo_p_circ.sql - buses (where cod_transp foreign key references subcontractor/transportur)
* i_geo_p_parc.sql - routes (where no_circ foreign key references buses/cercuit) )
* i_geo_x_annee.sql - dimension of school years

** transport/features

* trnsprt_fact_parcours_10an.sql -  list of active routes and buses serving these routes.
* trnsprt_fact_circuits_10an.sql- List of circuits and calcul number the rutts am,pm,total

 ** transport/dimenisions

* trnsprt_dim_ecoles.sql
* trnspt_dim_circ.sql -  unique numbers of circuits for a filter - circuits

 ** transport/pbi_tables
  * rpt_trnsprt_resultat_prc_circ.sql - total summ of cercuits and parcours - calculation by years

** reporting/transport
* rprt_transport_scolaire.pbit

# How to run the pull request ?
&gt;

```bash
# Update the code
git checkout core.data.tbe/feature/trnsp_circ2
git pull
poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
dbt deps
cd ..
git checkout csshc.data.tbe/transport
git pull

# Run dbt
dbt build --select tag:transport
```

# Pull request&#39;s checklist
* Code :
  * [x ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [x ] I have added DBT tests to my models ( `unique` per model).
* Documentation :
  * [x ]  I have updated the documentation accordingly to my changes.
  * [ x]  The models I have added are documented in a `schema.yml` file.
* Pull request :
  * [x ]  The provided code is working.
  * [x ]  I have added my CSS lead as a reviewer.
  * [ x]  My pull request is documented.
* Taskboard :
  * [ x] My work item is linked to the pull request.
  * [ ] My workw item has been moved to `review` in the taskboard.

Related work items: #1843, #1844, #1845, #1847 ([`75eba53`](https://github.com/Sciance-Inc/core.dashboards_store/commit/75eba53ffe150d4ac8bb9b803eb8be9649a1f0cc))

* Merged PR 374: Revert &#34;feat : ajouter des colonnes a la table interface&#34;

# Objectives of the pull request
&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

# How to run the pull request ?
&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected.**

```bash
# Update the code
git checkout core.data.tbe/feature/&lt;feature_name&gt;
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
cd ../&lt;project_name&gt;
git checkout feature/&lt;feature_name&gt;
git pull
# Might be required if you add a new DBT dependency
#dbt deps
# Run dbt
dbt build --select tag:&lt;my ressources tag&gt;
```

# Pull request&#39;s checklist
* Code :
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* Documentation :
  * [ ]  I have updated the documentation accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* Pull request :
  * [ ]  The provided code is working.
  * [ ]  I have added my CSS lead as a reviewer.
  * [ ]  My pull request is documented.
* Taskboard :
  * [ ] My work item is linked to the pull request.
  * [ ] My workw item has been moved to `review` in the taskboard.

Revert &#34;feat : ajouter des colonnes a la table interface&#34;

Reverted commit `8bc2684d`. ([`430cf60`](https://github.com/Sciance-Inc/core.dashboards_store/commit/430cf6076b62f4a0f46f5911d50a8555ce3db965))

* Merged PR 375: Revert &#34;factor : modifier le nom des table&#34;

# Objectives of the pull request
&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

# How to run the pull request ?
&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected.**

```bash
# Update the code
git checkout core.data.tbe/feature/&lt;feature_name&gt;
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
cd ../&lt;project_name&gt;
git checkout feature/&lt;feature_name&gt;
git pull
# Might be required if you add a new DBT dependency
#dbt deps
# Run dbt
dbt build --select tag:&lt;my ressources tag&gt;
```

# Pull request&#39;s checklist
* Code :
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* Documentation :
  * [ ]  I have updated the documentation accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* Pull request :
  * [ ]  The provided code is working.
  * [ ]  I have added my CSS lead as a reviewer.
  * [ ]  My pull request is documented.
* Taskboard :
  * [ ] My work item is linked to the pull request.
  * [ ] My workw item has been moved to `review` in the taskboard.

Revert &#34;factor : modifier le nom des table&#34;

Reverted commit `55a86f7c`. ([`65c119e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/65c119ec4fe79773ffc476025ca36dd2e08e6da7))

* feat : ajouter des colonnes a la table interface ([`fea0037`](https://github.com/Sciance-Inc/core.dashboards_store/commit/fea003790c8497c20c5a12d2bf4b79700d833266))

* factor : modifier le nom des table ([`b463a1a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b463a1a169707b31fca14decf47ac2429f634c94))

* doc: updating typo in Fred&#39;S name ([`cc05d69`](https://github.com/Sciance-Inc/core.dashboards_store/commit/cc05d6962b68c561a2a28695c79fe604d843a4d9))

* Merged PR 370: adding table of contents to the readme

# Objectives of the pull request
* The PR aims at easing the navigation through the README. As pointed by @&lt;philippe.paquette&gt; the readme contains a lot of information and It might be tough to jump between relevant sections.
* The PR introduces a new Table of Contents, at the top of the readme  :
    * The Table of Contents can be used to jump to the `Dashboards Table` section
* The PR refactor the `Dashboards Table` by adding, for each dashboard, a link to it&#39;s integration guidelines section.

An integrator can now reach a Dashboard&#39;s documentation in two clicks.

# What is left out of the PR
* The PR does not introduce any change to the README&#39;s semantic. The already-out-of-date information is still...well, out of date.

# How to run the pull request ?
&gt; Assuming you are in a folder containing the `core.data.tbe`.

That&#39;s the neat part ! You don&#39;t ! You can review the README in your browser. How lucky are you ?
That being said, if you want the full experience, you can always checkout the branch on your local computer.

```bash
cd core.data.tbe
git checkout feature/fixupDoc
git pull
```

# Pull request&#39;s checklist
* Code :
* Documentation :
  * [X]  I have updated the documentation accordingly to my changes.
* Pull request :
  * [X]  The provided code is working.
  * [X]  My pull request is documented. ([`bf8c9d5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bf8c9d5ad10e88dd8e8048c57590bf48b90b3560))

* doc: typo in Frederyk&#39;s name ([`9efb110`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9efb110e63af3f036c013dc788d0fe3c93b55d0c))

* Merged PR 355: Modifier l&#39;âge de départ à la retraite et prendre supérieur ou égale

# Objectives of the pull request
&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

L&#39;objectif était de modifier l&#39;âge du départ à la retraite de 65 à 55 et de ne pas uniquement aller chercher les gens qui avaient 55, mais 55 et plus.

Pour ce faire, nous avons modifié et renommer le fichier **prspctf_rprt_emp65_ann_bdgtr.sql** pour **prspctf_rprt_emp_ge55_ann_bdgtr.sql**

* Avant de rouler cette PR, il faut impérativement excécuter celle de Fréderyk

# How to run the pull request ?
&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected.**

```bash
# Update the code
git checkout core.data.tbe/feature/emp_retraite
git pull
poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install

# Run dbt
dbt seed --full-refresh
dbt run --select +prspctf_rprt_emp_ge55_ann_bdgtr
```

# Pull request&#39;s checklist
* Code :
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* Documentation :
  * [X]  I have updated the documentation accordingly to my changes.
  * [x]  The models I have added are documented in a `schema.yml` file.
![image (2).png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/355/attachments/image%20%282%29.png)
* Pull request :
  * [x]  The provided code is working.
![image.png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/355/attachments/image.png)
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
* Taskboard :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

chore: change the name of the profile and the project

Related work items: #1770 ([`5ef7d3a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5ef7d3a7f509cfd365d753d645f6a3d97500fe79))

* Merged PR 365: Refractor : Moved file related to SE into the mart educ_serv

# Objectives of the pull request
&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

The goal of this PR is to bring the table into ours marts, which is educ_serv. All change needed related to the file being deplaced has been done and we tested beforehand.

# How to run the pull request ?
&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected.**

We used a dbt run to test the whole PR. No error occured.

```bash
# Update the code
git checkout core.data.tbe/feature/refractor_mart_se
git pull

Its should be working in any cssxxx with the dbt_project being up to date.

Add the following to the dbt_project:

models:
    tbe:
        marts:
            educ_serv:
                +enabled: true

# Pull request&#39;s checklist
* Documentation :
  * [x ]  I have updated the documentation accordingly to my changes.
  * [x ]  The models I have added are documented in a `schema.yml` file.
* Pull request :
  * [x ]  The provided code is working.
* Taskboard :

Refactor : move table into mart serv_educ ([`8d045b4`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8d045b4fe6a54f20c54322976a06e180fe08accc))

* Merged PR 364: Ajouté emp_actif.rdl

# Objectives of the pull request
&gt; describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
L&#39;objectif est pour avoir le rapport emp_actif.rdl. On peut l&#39;importer dans PBIRS.

# How to run the pull request ?
&gt; Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected.**

```bash
# Update the code
git checkout core.data.tbe/feature/report
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell &amp;&amp; poetry lock &amp;&amp; poetry install
cd ../reports
git checkout feature/report
git pull
# Might be required if you add a new DBT dependency
#dbt deps
# Might be required if not have cssdgs.datatbe
#git clone branch develop cssdgs.data.tbe
git clone git@ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/cssdgs.data.tbe
# Might be required if have cssdgs.data.tbe cloned
cd ../cssdgs.data.tbe
git checkout develop
git pull
git checkout feature/report
git rebase develop
# Run dbt
dbt seed --full-refresh
dbt build --select emp_actif
```

# Pull request&#39;s checklist
* Code :
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* Documentation :
  * [x]  I have updated the documentation accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* Pull request :
  * [x]  The provided code is working.
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
* Taskboard :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

Related work items: #1848, #1853 ([`2b1bad7`](https://github.com/Sciance-Inc/core.dashboards_store/commit/2b1bad779a52246667566bdece20f21fbe60409c))

* Merged PR 341: Rehaussement du tdb emp_congé

Le code utilise la base de donnée de la PAIE.

Comment l&#39;exécuter
cd core.data.tbe
git fetch origin
git checkout feature/emp_cong
cd ../cssvt.data.tbe
git fetch origin
git checkout feature/modify_dbt_project

Commandes :
dbt seed --full-refresh
dbt run --select +reporting_emp_cong ([`d7b7fb4`](https://github.com/Sciance-Inc/core.dashboards_store/commit/d7b7fb496f98581183b33e45e3146659fbc1c0b1))

* Merged PR 357: Refactoring the `integrator` guide

# Objectives of the pull request
* The PR aims at providing a more comprehensive introduction to the ways the store works.
* The PR adds a section with helpful links
* The PR refactors the README in two sections : one for the `integrators` who are deploying dashboard, and one for the `developers` add new dashboard to the repo.

# What is left out of the PR
* The PR only focus on the `integrator` side, as integrator are less used to the store than developers. The developers section will be refactored in an upcoming pull request
* The `prospective_cdep` is left untouched. With the addition of `Marts`, the dashboard&#39;s code should be refactored. It was useless to create a short-lived, and already out of sync documentation. Refactoring the dashboard to use the new `Marts` has been backloged

# How to run the pull request ?
That&#39;s the neat part ! You don&#39;t ! You can review the `README` in your browser. How lucky are you ?
That being said, if you want the full experience, you can always checkout the branch on your local computer.

```bash
cd core.data.tbe
git checkout feature/fixupDoc
git pull
```

# Pull request&#39;s checklist
* Code :
* Documentation :
  * [X]  I have updated the documentation accordingly to my changes.
* Pull request :
  * [X]  The provided code is working.
  * [X]  My pull request is documented.
* Taskboard :
  * [X] My work item is linked to the pull request.
  * [X] My work item has been moved to `review` in the taskboard.

Related work items: #1875 ([`cf8905a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/cf8905adbefebc92108202f30f0a8bc62ff04ba6))

* Merged PR 356: refactor: factoring seed into a mart

# Objectives of the pull request
&gt; The PR uses a companion branch from `cssvdc.data.tbe`. That branch can be safely manipulated by the reviewers.

* The PR aims at moving a seed used in both `emp_actif` and `emp_conge` into a common folder.  As the main job of the store is to factor code, we shouldn&#39;t have to duplicate code. Common code (either `seeds` definitions or fact/dim tables should be stored in a `mart`)
* Since common code is shared, we can&#39;t attach it to only one dashboard. The usual naming convention where seeds are written under the dashboard&#39;s name they belong to does not hold anymore.
* A new convention is used (and documented). Common code schould now be stored under the `marts` folder, UNDER the mart&#39;s name the code belongs to.
* About the marts :
    * Marts are orthogonal to dashboards.
    * Marts are available for both `seeds` and `models`

The `human_resources` is introduced for both the seeds and models. The model mart is currently left empty to keep it consistent with the seed folder.
The `human_resources` mart is populated with a `seed` file definition.
The `emp_actif` dashboard has been refactored to use this new seed.

`core/seeds/marts` should only contains seeds file definition. Actual implementation of the seeds should be done on the cssXX repo. The concrete should be saved under the same folder (but in the cssXX repo) as the definition file.

**Caveat**
* `+schema` and `+tags`  does not work for seeds when set through `dbt_project` (I have raised the issue on the official DBT repo). The whole configuration of the seed, including the tags and schema, is gathered in the `yaml` defining the seed.
* `seeds` are not sensitive to setting `+enabled:true/false` meaning that every non-enabled seed will trigger a warning. (I have raised an issue on the official DBT repo). A `seed` is implicitly enabled by creating a `.CSV` file. As a consequence, every seed defined in a `mart` for which there is no `.CSV` in either the core or the cssXX repo will trigger.

# How to run the pull request ?

```bash
# Update the code
cd core.data.tbe
git checkout feature/refactoringRHMart
git pull
poetry shell
cd ../cssvdc.data.tbe
git checkout feature/refactoringRHMart
git pull
dbt clean &amp;&amp; dbt deps

# Run dbt
dbt run-operation drop_schema # To drop all of the user&#39;s schema
dbt build --select tag:emp_actif
```

# Pull request&#39;s checklist
* Code :
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.

* Documentation :
  * [X]  I have updated the documentation accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* Pull request :
  * [X]  The provided code is working.

  * [X]  My pull request is documented.
* Taskboard :
  * [X] My work item is linked to the pull request.
  * [X] My workw item has been moved to `review` in the taskboard.

![image.png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c5... ([`4b33994`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4b33994729e35b92c297ad3b7c238d5df307ee9c))

* Merged PR 339: Tableau de bord emp_actif

Ajout le script pour générer la table emp_actif
Ajout le rapport em_actif.pibt dans le répertoire &#39;reporting&#39;
Voir readme (section emp_actif)  avant de rouler le dbt

Related work items: #1614 ([`bd5dd72`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bd5dd72839324d3e6fb22745504c9659c15824c0))

* Merged PR 338: fix: modif unit tests de fact_evaluations_grades_from_dim et du RLS et verif code matière sec 4 et 5

J&#39;ai ajouter une vérification qui s&#39;assure d&#39;aller chercher uniquement les code matières de sec 4 et 5 quand on veut les résultats des examens du ministère sec 4 et 5 (donc exclus sec 2).

J&#39;ai également modifié les unit tests du RLS et j&#39;ai ajouté des unit test pour fact_evaluations_grades_from_dim pour s&#39;assurer qu&#39;on n&#39;obtiens plus de doublon dans cette table.

Related work items: #1619 ([`e89a6ec`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e89a6ec28847bbfef852b5bd70d57e0c42f3090c))

* Merged PR 337: fix: modif scripts tables RLS

Modifications des scripts pour la génération des tables du RLS.
J&#39;ai supprimé 2 tables qui n&#39;étaient pas utiles et j&#39;ai modifié le scripts utilisateurs_ecoles.sql pour utiliser le même code que celui utilisé dans prodrome pour produire la table &#34;utilisateurs&#34;.

Related work items: #1676 ([`4a327be`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4a327beedee99f112bfa83f490e0013053822514))

* Merged PR 330: refactoring cout de roulement code

- réécrire le code pour la table prspctf_fact_emp_quitter
- remplacer la masse salariale de par la masse salariale de l&#39;année précédente dans le calcul du cout de roulement de l&#39;année en cours
- mettre a jours le Readme avec l&#39;explication du calcul de l&#39;indicateur
- pour rouler le code :
cd core.data.tbe
git checkout bugfix/cout_roulement
cd ../css***.data.tbe
git checkout develop
dbt run ([`4bd515a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4bd515a35096c016986603c750cba59245c27553))

* Merged PR 317: RLS

Description: produire le code DBT pour générer les tables RLS

**Les ajouts apportés au répertoire core**
models/shared/interfaces/paie :
	i_pai_dos_2.sql 		: avoir le courriel de l&#39;employé.
	i_pai_dos_empl.sql		: avoir le corps d&#39;emploi,état, date effective, lieu et l&#39;emploi principal de l&#39;employé.

**Les modifications apportées au répertoire core**
	i_pai_tab_lieu_trav.sql	: ajouté eco_off pour avoir seulement les écoles.
	schema.yml			: ajouté le nom, tag et description pour les interfaces ajoutés ci-hauts.

**Les ajouts apportés au répertoire core**
models/shared/rls :
	directeurs.sql			: pour pousser l&#39;ETL et la table &#39;directeurs&#39; dans bd
	ecoles.sql				: pour pousser l&#39;ETL et la table &#39;ecole&#39; dans bd
	enseignants.sql		: pour pousser L&#39;ETL et la table &#39;enseignants&#39; dans bd
	utilisateurs_ecoles.sql	: pour pousser L&#39;ETL et la table &#39;utilisateurs_ecoles&#39; dans bd

**Les modifications apportées au répertoire core**
	schema.yml				: ajouté le nom, tag et description pour les modèles ajoutés ci-hauts.

       dbt_project.yml : ajouté les alias suivants
          directeurs:
            +schema: directeurs
          ecoles:
            +schema: ecoles
          enseignants:
            +schema: enseignants
          utilisateurs_ecoles:
            +schema: utilisateurs_ecoles

**Les ajouts apportés au répertoire css**
       dbt_project.yml: ajouté  rls suivant dans la section models/tbe/shared
        rls:
            +enabled: true

**Compilation:**
cd core.data.tbe/
git checkout develop
cd cssdgs.data.tbe/
git checkout develop
dbt run

Related work items: #1474, #1477, #1480 ([`26a6eee`](https://github.com/Sciance-Inc/core.dashboards_store/commit/26a6eeef1c4bfef6c8d163b6810aaa75963c4dba))

* Merged PR 320: Ajout de l&#39;indicateur AI6 et C6

# **Objectif**

Ce PR ajout l&#39;indicateur AI6 (Développer des stratégies de fidélisation innovantes) et C6 (Attirer et retenir du personnel qualifié et engagé) au Dashboard prospectif_cdp.

Le code utilise la base de donnée de la PAIE.

Il manque une fonctionnalité à l&#39;indicateur C6 :
- Filtrer seulement les employés du centre administratif. Cette fonctionnalité a été rajouté en TODO dans le README.

# **Comment l&#39;exécuter**

cd core.data.tbe
git fetch origin
git checkout feature/ratio_anciennete
cd ../cssvt.data.tbe
git fetch origin
git checkout feature/modify_dbt_project

### Commandes :
dbt run --select prspctf_ratio_anc
dbt run --select prspctf_taux_fidelite ([`812d487`](https://github.com/Sciance-Inc/core.dashboards_store/commit/812d4873ab3ef054a596ba6652eaf3a0a5d5f04f))

* Merged PR 314: Update Readme file

Objectifs et indicateurs pour la priorité #1442 TBE# ([`ff42d0e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ff42d0eaca30373c79df7c7ec954cf94746c22b8))

* Merged PR 319: fix: removing empty results has we don&#39;t want them to be tracked

# Objective
The PR remove the courses not sanctioned by a result, as tracked by the `result` column.

# How to run it

```bash
cd core.data.tbe
git checkout bugfix/removeEmptyResult
git pull
poetry shell
cd ../cssvdc.data.tbe
git checkout develop
git pull
dbt build --select suivi_resultat
``` ([`e4adb95`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e4adb95dfa758e5e5c8232afa0152ff93243297b))

* Merged PR 316: Adding 10 new materials codes

After the validation of the exams/materials codes with CSSHC, were found several ministerial codes of the materials used  by CSSHC. Since these codes are from the ministry, I added them to the default list

1. Added code materials in the seeds/res_eppruves
-   default_subject_evaluation.csv

![image.png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/316/attachments/image.png)

Related work items: #1546 ([`a6842d5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a6842d5ba6d16086fcb13c585c327d0f11a6614b))

* Merged PR 318: fix: fixing babel misspelling

# Objective
The PR renew the `poetry.lock` file to handle the Babel&#39;s package renaming.

# Commits
fix: fixing babel misspelling

# how to run

```bash
git checkout develop
poetry install
```` ([`ef72101`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ef7210180c1fe0aacf5ff4df4ccff426cc0635af))

* Merged PR 309: feat: adding suivi_resultats_s1_s3 dashboard

# Objective
This PR aims at adding a generical `suivi_resultat` dashboard to the store.  The work is heavily inspired by the dashboard in `comite_donnees`. One major difference is that this PR eliminates the `main_course` concept.

The code is based on the GPI database and makes heavy use of the `edo` schema. Two configuration seeds are available: one to configure the courses to be tracked, and one to configure the levels the students are enrolled in we want to track. Both of these seeds can of course be overridden if needed.

Three features are voluntarily left out of the PR:
* This PR DOES NOT implement the RLS for this dashboard, as a generical solution to this issue is going to be worked on by the ops team in the upcoming sprint. A TODO has been added to the README and will be backlogged on this PR acceptance.
* This PR DOES NOT filter on the regular student, as I am going to introduce a generic, shared across dashboard, way to handle populations in an upcoming spring. Once again, a TODO has been added to the README and will be backlogged on this PR acceptance.
* The concept of `re-taking` a course has been left of the PR, as I haven&#39;t found a proper solution to it for now.

# How to run it

## Get the code
&gt; This PR has a companion branch / PR on CSSVDC. You need to checkout the CSSVDC&#39;s to run the PR without additional configuration. !310

```bash
cd core.data.tbe
git fetch origin
git checkout feature/suivi_resultat_s1_s3
cd ../cssvdc.data.tbe
git fetch origin
git checkout feature/suivi_resultat_s1_s3
```

## Optionally : drop all the schemas in your schema / database to start from a clean slate
&gt; Do not run this command when using the service account as it will drop all the development schemas.

```bash
dbt run-operation drop_schema
```

## Load the seeds, run the code and test the table
&gt; Use the `suivi_resultat` tag to limit the ETL to the suivi_resultats nodes.

```bash
dbt build --select suivi_resultat
``` ([`5c65188`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5c651880b9f1481d685e36ffd65fcb10265f1087))

* Squashed commit of the following:

commit 371c19d136492c0610f0a8ea476f8be6e297523a
Author: hugo juhel &lt;juhel.hugo@stratemia.com&gt;
Date:   Wed Mar 8 08:47:14 2023 -0500

    chore: removing duiplicated code

commit deef357531ca726d92fc075e5faf606e4d9bf500
Merge: 10baa51 dc3a2fc
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Wed Mar 8 08:28:08 2023 -0500

    Merge branch &#39;feature/avg_pp_rtrt&#39; (HUGO BOSS)

commit dc3a2fcf1c8ce32826e9cd2aac5515dd380a73be
Author: hugo juhel &lt;juhel.hugo@stratemia.com&gt;
Date:   Tue Mar 7 16:46:55 2023 -0500

    doc: fixing a minor typo in the readme

commit db96146e81c72e6ab8030f8e3b53b146b78be286
Author: hugo juhel &lt;juhel.hugo@stratemia.com&gt;
Date:   Tue Mar 7 16:45:15 2023 -0500

    doc: updating the readme with the new conventional prefix fgor reporting tables

commit 0b1d6c8385202c28bf318d0996fba13cd17c6201
Author: hugo juhel &lt;juhel.hugo@stratemia.com&gt;
Date:   Tue Mar 7 16:39:53 2023 -0500

    fix: updating the documentation to better reflect the purpose of the table

commit 79d8d24e21d6fe4507250d983daf6dce1203d657
Author: hugo juhel &lt;juhel.hugo@stratemia.com&gt;
Date:   Tue Mar 7 16:36:48 2023 -0500

    fix: adding missing documentation and renaming exposed fields to increase readibility

commit d3cf2695d55f3f52a88d3e6c599e43c51e9e501c
Author: hugo juhel &lt;juhel.hugo@stratemia.com&gt;
Date:   Tue Mar 7 16:00:14 2023 -0500

    fix: adding missing codeblock

commit 0de61f52611fe3723cdbbe0419c1bbcdd8796b14
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Tue Mar 7 15:33:54 2023 -0500

    dox: more accurate description

commit 52f903dcaa304227cf1093ebe988009a26b36ead
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Tue Mar 7 15:05:12 2023 -0500

    fix: fix errors in columns names

commit 275f64add1abccbd8bb80a53a139eb0725ef87e0
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Tue Mar 7 13:40:30 2023 -0500

    docs: prospectif_cdep -add seeds employees status

commit 01aa3a5c107b87518f913ff76567c1542d46c014
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Tue Mar 7 13:37:58 2023 -0500

    refactor: added sources name employees_status

    Co-authored-by: hugoJuhel &lt;juhel.hugo@stratemia.com&gt;

commit fe82436efd4a50825c7a638b69be580799bc1b5d
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Mon Mar 6 15:22:08 2023 -0500

    fix: sorry:) its suppsd to b in the cadention now

commit 6edff6d7ce22fff1b841f43b3b1aba1b5019af24
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Mon Mar 6 11:56:17 2023 -0500

    renamed sql files via the  &#39;prspctf&#39; namecodention

commit 7208e06104d90546cd9721377eed50b12cecb26f
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Thu Mar 2 15:00:08 2023 -0500

    delete extra code from prct_hemp_65an

commit 96c0f3a987a26b322b32129f0f0e553b345d29e0
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Thu Mar 2 14:59:15 2023 -0500

    new table prtc_hemp_65an_1joul.sql

commit 538c9b88584a9f097b4477ffed8e4bcf23d5a7fc
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Thu Mar 2 09:30:42 2023 -0500

    feat: created history_post_permanant.sql

commit 10baa51011ea0589f48b2c1876578c28fb0472c6
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Tue Mar 7 15:33:54 2023 -0500

    dox: more accurate description

commit 7f7bc50dfaa03324c974971b18a3550d505f4d0b
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Tue Mar 7 15:05:12 2023 -0500

    fix: fix errors in columns names

commit 440120bcb737c449e5343d28d419b5b29ac5a1b9
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Tue Mar 7 13:40:30 2023 -0500

    docs: prospectif_cdep -add seeds employees status

commit efc4fc2500b296e988a7ad67bcb13a6706fd0040
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Tue Mar 7 13:37:58 2023 -0500

    refactor: added sources name employees_status

    Co-authored-by: hugoJuhel &lt;juhel.hugo@stratemia.com&gt;

commit 6854def5cd20fa7068fb1611506a82d35b45550d
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Mon Mar 6 15:22:08 2023 -0500

    fix: sorry:) its suppsd to b in the cadention now

commit 865b3ac73161b92961712cde62e85836a0f21edf
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Mon Mar 6 11:56:17 2023 -0500

    renamed sql files via the  &#39;prspctf&#39; namecodention

commit 48087822106bd3b8ed6c2eb0da3b411895aebd4e
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Thu Mar 2 15:00:08 2023 -0500

    delete extra code from prct_hemp_65an

commit c8611d8c4bf581976059c1935c6f399ea8a88331
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Thu Mar 2 14:59:15 2023 -0500

    new table prtc_hemp_65an_1joul.sql

commit 29b5a3f21179de3dc2d77488992f572e2ceb81e0
Author: mazhur &lt;mzhuravlova@cshc.qc.ca&gt;
Date:   Thu Mar 2 09:30:42 2023 -0500

    feat: created history_post_permanant.sql ([`04e9833`](https://github.com/Sciance-Inc/core.dashboards_store/commit/04e983372e4d66526d8cab6c692a81b0f0f8d3f1))

* Merged PR 307: typo: fixing typo prevailing the code to compile

typo: fixing typo prevailing the code to compile ([`ed61c6d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ed61c6d255ee420978c295f7613fca3c9651417d))

* Merged PR 306: reorganization of  files insid shared/interface

**1.  i_pai_dos.sql  renemed to i_pai_dos_empl.sql**
-     added comments and new colomn
-      chenge link name to  i_pai_dos in the file:  prspctf_fact_emp_quitter.sql
-     updated schema.yml
**2.   new fil i_pai_dos.sql**
-    updated schema.yml

**3.  renomed i_pai_tab_eat_empl_conge  to i_pai_tab_eat_empl**
-      chenge link name to /models/emp_conge/features/empcong_fact_emp_conge.sql
-     updated schema.yml
**4. **new file pai_tab_stat_eng.sql****

-     updated schema.yml ([`e9e1a5c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e9e1a5c1babe07328e6182d62cc61021a06d2e44))

* Merged PR 304: creat table for students result indicator

- creat  mat_select dimensions table unioning a default and a custom CSV (if exist)
-  adding MatieresEleve  interfaces
-  add result table by matiere
-  add reporting table with proportion by year
-  add new table to schema

use develop branch in cssvdc to test the PR ([`7baa89d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7baa89d3b55282d20cc42a6c1d8d159aec5aa06c))

* feat : update_readme_file ([`2dbdf21`](https://github.com/Sciance-Inc/core.dashboards_store/commit/2dbdf216c35511e41fa8c8ae81321bf162d067e3))

* feat : add_schema_file ([`4ca4c41`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4ca4c415fe1dc55f579f7065177e06eae833db4e))

* feat : add new table to schema ([`4626f24`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4626f2406c66b6f92119e6fc25a0a27f32b448b1))

* feat :  add reporting table with proportion by year ([`ce398ec`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ce398ec84f444fef6c863baa129a1e47eca0cf38))

* feat : add result table by matiere ([`b2d02a3`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b2d02a3c1694a9e13216fbf2820afdb4db2b1db9))

* feat : creat  mat_select dimensions table unioning a default and a custom CSV (if exist) ([`d95a5b4`](https://github.com/Sciance-Inc/core.dashboards_store/commit/d95a5b4db0c0fa5cc86f72af6c9ad69f143b837c))

* chore : delete_table ([`7daf101`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7daf1019543ff1d58cf7fd07df31ed7ebe61e32d))

* feat : move_table_to_sub_folder_cout_roulement_and_delete_join_on_fact_masse_sal ([`e17a502`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e17a5029aa34aee8f5f5152ec0d3e1e5800aa42e))

* Merge branch &#39;develop&#39; into feature/massesalariale ([`f13e07c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f13e07cead40efa1189f6a87f94b675f962d639d))

* Merge branch &#39;feature/massesalariale&#39; of https://dev.azure.com/Centre-Expertise-IA/COTRA-CE/_git/core.data.tbe into feature/massesalariale ([`c85b2f8`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c85b2f8cbe494ea771e821599107b3ee274a6136))

* Renommer une référence sur masse sal corp empl ([`816a721`](https://github.com/Sciance-Inc/core.dashboards_store/commit/816a72191cebefa9911abbe50f302f29ef01a8fd))

* Updated prspctf_couts_de_roulement.sql ([`771c3cc`](https://github.com/Sciance-Inc/core.dashboards_store/commit/771c3cce96a375d413ad07fb3de8f89281c28af2))

* feat taux roulement personnel ([`6fa3c1c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6fa3c1c63b7016cb41f80284a3346db0908ae3b8))

* Merge branch &#39;feature/massesalariale&#39; of ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/core.data.tbe into feature/massesalariale ([`06ba03a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/06ba03a14f077fef32bbf1b72fcc1201f6a67fbb))

* feat : creat_fact_emp_quitter ([`59684af`](https://github.com/Sciance-Inc/core.dashboards_store/commit/59684afc8e148bffd5284c3a2b5cc3c8afaeceed))

* feat :add_new_field ([`566b990`](https://github.com/Sciance-Inc/core.dashboards_store/commit/566b990873dedca7937401956d73a208a350f3aa))

* feat : add_masse_salariale_tables ([`a98ea84`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a98ea848aca8a08698eb772dddf691089e4e24ba))

* masse salariale ([`7c273be`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7c273be25c7cf0680428d1c0c542e97dd5681329))

* Merged PR 285: création du tableau de bord des résultats aux épreuves

- feat : create_new_db_rslt_etape_epreuves
- Merge branch &#39;develop&#39; into feature/res_etape_db
- feat: add_diff_to_school_table
- feat_add_diff_to_db
- Merge branch &#39;develop&#39; into feature/res_etape_db
- fix: adding missing weighting
- feat: add_res_exam_anonymous_db
- feat: DB_modification
- Merge branch &#39;feature/res_etape_db&#39; of ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/core.data.tbe into feature/res_etape_db
- fix: modification of the &#39;transport&#39; dashboard schema
- chore: move the schema of the &#39;transport&#39; dashboard. 1 schema that centralizes all the information
- chore: modification of the i_geobus_parc script so that it respects the project conventions
- modification of the i_piastre script so that it respects the project conventions
- chore: adjustment of the schema that describes the interface tables of the piastre database
- chore: modification of the i_geobus_parc script so that it respects the conventions of the project (part2).
- chore: adjustment of the schema that describes the interface tables of the geobus database
- chore: modif of the stg_parc_activ_10y script so that it respects the conventions of the project
- chore: rename the script stg_parc_activ_10y because it is not used to generate a staging table
- chore: rename the script stg_parc_activ_10y because it is not used to generate a staging table
- chore: modification of the dbt_project so that it respects the conventions of the tbe project
- Merge branch &#39;feature/correctif&#39; of ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/core.data.tbe into feature/correctif
- chore: adjustment of the schema that describes the emp_conge dashboard scripts
- chore: adjustment of the schema that describes the dashboard scripts prospective_cdp
- chore: change the table empcong_fact_emp_conge to fact_emp_conge
- chore: update the README
- chore: management of the centralized schema
- chore: update README part 2
- feat: extract_gouv_rslt_from_interface_table
- Commit a3cb1dff: feat : add_gouv_evaluation_result_to_interface_table
- feat : add_adapted_gouv_evaluation_reslt_to_fact_table
- feat: add_new_interface_table_to_schema
- feat: add_gouv_evaluation_name _to_seed_table
- feat: add_new_table_to _schema
- Merge branch &#39;feature/correctif&#39; into feature/res_etape_db
- Merge branch &#39;feature/res_etape_db&#39; into feature/epreuve_unique
- fix: correct_error_in_schema
- feat: add_dashboard
- Changement suite aux modifs sec4 et 5, update version dbt utils 1.0.0 et ajout interface pour num organisation
- Changement pour Mohamed
- feat: update_README_with_new_info_for_model_res_etapes
- feat: add_new_vars_to_dbt_project
- feat:add_new_filter_to_fact_evaluation_minist_sec4_sec5
- feat: add_new_fields_i_e_ri_resultats
- feat: add_sec4_and_sec4_evaluation_to_db ([`8017786`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8017786e776509171b1630c1e29a49cc216db3c7))

* Merge branch &#39;develop&#39; into feature/epreuve_unique ([`9abefff`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9abefffa3c3e05e1e6fb9612293587d942ba74e8))

* chore : Change_res_etapes_model_name_to res_epreuves ([`dc0780f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/dc0780ffd4fd37ee09655b45aa501103ec7b8fe2))

* feat : change_column_name ([`6030535`](https://github.com/Sciance-Inc/core.dashboards_store/commit/60305356472e457ef6ee9b4e0a4cbdf6ed652310))

* feat : modify_columns_name ([`ddcd1c1`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ddcd1c1f74784eae3053a1459736d4c43f55dd52))

* doc: adding missing docstring ([`9406fc5`](https://github.com/Sciance-Inc/core.dashboards_store/commit/9406fc52db38fef1cf008f7626479ebca6658cbc))

* Updated empcong_fact_emp_conge.sql ([`f8d0537`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f8d0537faa5ad17775cdd11cc025c769f25600f5))

* Merged PR 272: Correctifs afin d&#39;harmoniser le process

Ci-dessous un récapitulatif des modifications apportées au répertoire `core`

- `emp_conge` :
1. Pour ne plus voir le message de warning j&#39;ai modifié le schéma du projet.

![image.png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/272/attachments/image.png)

2. J&#39;ai également configuré un alias pour que la table générée dans la base de données soit nommée `fact_emp_conge` plutot que `empcong_fact_emp_conge`

![image (2).png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/272/attachments/image%20%282%29.png)

@&lt;Mohamed Sadqi&gt; , @&lt;Gabriel Thiffault&gt;  Assurez-vous que ces modifications n&#39;aient pas d&#39;impact sur le tableau de bord  (le chemin pour accéder à la table plus précisément).

- `prospectif_cdp` : petite coquille dans le schéma du projet qui générait un warning.

![image (3).png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/272/attachments/image%20%283%29.png)

- `shared/interfaces/geobus` et `shared/interfaces/piastre` : j&#39;ai fait des modifications afin de respecter les conventions du projet. @&lt;Maryna Zhuravlova&gt;  le nom des champs doit être en minuscule.

     ex:
![image (4).png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/272/attachments/image%20%284%29.png)

- `transport` :

1. J&#39;ai modifié le nom du script `stg_parc_activ_10y` par `trnsprt_parc_activ_10y`. Tout d&#39;abord, ce n&#39;est pas une table de staging donc ca ne nécessite pas de préfixe `stg`. Finalement, afin d&#39;avoir un schéma centralisé, j&#39;ai rajouté le prefixe `trnsprt_`

2. J&#39;ai également configuré un alias pour que la table généré dans la base de données soit nommé `parc_activ_10y` plutôt que `trnsprt_parc_activ_10y`

![image (5).png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/272/attachments/image%20%285%29.png)

3. En conséquence, j&#39;ai ajusté le schéma qui d&#39;ailleurs ne fonctionnait pas initialement.

@&lt;Maryna Zhuravlova&gt; , assure-toi que ces modifications n&#39;aient pas d&#39;impact sur le tableau de bord. Je pense que le tableau de bord ne retrouvera pas sa table source sachant que son nom a été modifié

- `dbt_project` : j&#39;ai corrigé la section `transport` du fichier pour harmoniser le processus.

![image (6).png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/272/attachments/image%20%286%29.png)

- `README` : ajustement de la section `transport`.

@&lt;Maryna Zhuravlova&gt;  je ne comprends pas l&#39;intérêt de la base de données `piastre`. Est-elle vra... ([`4a53b30`](https://github.com/Sciance-Inc/core.dashboards_store/commit/4a53b30fdbd6f4442bddbfbd6e7b857d00dcee11))

* feat:add_new_filter_to_fact_evaluation_minist_sec4_sec5 ([`12817e7`](https://github.com/Sciance-Inc/core.dashboards_store/commit/12817e749b87e7e0300eba63b381066027b41fe8))

* Changement pour Mohamed ([`c1b08bf`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c1b08bfa7fe5ad58d4fb02fcc390141989c3ba6c))

* Changement suite aux modifs sec4 et 5, update version dbt utils 1.0.0 et ajout interface pour num organisation ([`7346485`](https://github.com/Sciance-Inc/core.dashboards_store/commit/73464859f5d0a6ec1de640e32ea1efb5efa838b2))

* Merged PR 281: Change the table emp_conge alias

- chore : change_the_table_empcong_fact_emp_conge_to_fact_emp_conge
- chore: adjustment of the schema that describes the emp_conge dashboard scripts ([`a1fc494`](https://github.com/Sciance-Inc/core.dashboards_store/commit/a1fc494031164a524174a526213f398da9d172e5))

* chore : change_the_table_empcong_fact_emp_conge_to_fact_emp_conge ([`802aaaf`](https://github.com/Sciance-Inc/core.dashboards_store/commit/802aaaf704670e32684c440dbbfdb40c4b813fd4))

* Merge branch &#39;feature/res_etape_db&#39; into feature/epreuve_unique ([`6b77647`](https://github.com/Sciance-Inc/core.dashboards_store/commit/6b77647a9067836d1c51b2d0e504a69e9e5caf2a))

* Merge branch &#39;feature/correctif&#39; into feature/res_etape_db ([`032940b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/032940bc1e7df4bba388f06f01839a52ec9f6cb5))

* feat : add_adapted_gouv_evaluation_reslt_to_fact_table ([`f2b7e5d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f2b7e5d92d5346a0ee04a80195df0f5066c21e71))

* Commit a3cb1dff: feat : add_gouv_evaluation_result_to_interface_table ([`b893ce4`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b893ce435450cbc8ce509f8f632fb97cadd555b8))

* Merge branch &#39;feature/correctif&#39; of ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/core.data.tbe into feature/correctif ([`b18d157`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b18d15718723442a2837ac07ad25d81e661b4edc))

* modification of the i_piastre script so that it respects the project conventions ([`face65f`](https://github.com/Sciance-Inc/core.dashboards_store/commit/face65f1b3a00618cbf32726df32373347f5880e))

* Merged PR 253: transport_scoler_geobus

Progect  transport scolarite
1.  Add: intregace/piastre and  intregace/geobus
 models/shared/interfaces
- il y a deux nouveaux répertoires. avec deux nouveaux fichiers
-     repo: geobus
-            i_geobus_parc.sql ; schema.yml
       repo: peastre
              i_peustr.sq; ; schema.yml

2.   modele transport
- repo: transport
          stg_parc_active_10y.sql

3.  feat : dbt_project.yml
-     transport:
-         +tags: [&#34;transport&#34;]
-         +materialized: table

4. README.md
![image.png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/253/attachments/image.png)

5.  Gabarite de un tableau de bord de base pour le transport scolaire
-repo: reporting
              transport_gabarit.pbit

Related work items: #1013, #1125 ([`277ad07`](https://github.com/Sciance-Inc/core.dashboards_store/commit/277ad07a2ea2c4ffabba54dc1b5eede52a1c4791))

* Merge branch &#39;feature/res_etape_db&#39; of ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/core.data.tbe into feature/res_etape_db ([`aa36f1c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/aa36f1c5dfd1d1fe29f995553f3c472ce4c0b23b))

* Merge branch &#39;develop&#39; into feature/res_etape_db ([`0da5861`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0da5861d7435c957e94baa40c5b69a9b4573accc))

* Merged PR 267: Add dim epreuve

- add rstps_dim_unique_subj_evaluation : with unique annee friendly_name key
- add id_friendly_name to reporting table to have a unique annee friendly_name key ([`bbdb35a`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bbdb35a2fca23a8b5c545ffa5e37280a8d111454))

* Merged PR 260: Adding data for res_etapes dashboard

# Objective
* The PR aims at adding the metrics table for a new dashboard : res_etapes dashboard.
* The dashboard will display metrics (aggregated either at a school or a CSS level) regarding the success rate to a set of predefined evaluations.
* A set of predefined evaluations, common across al CSS is defined through a seed.
* The PR allows the customization of the evaluations list, by the definition of another seed in the CSS&#39;s specific package. The procedure is described in the README.

# Tables
* `rstps_dim_subject_evaluation` implements the mechanism to look for and add a table of CSS&#39;s specific evaluations to the default ones.
* `rstps_fact_evaluations_grades` and `rstps_fact_evaluations_grades_from_dim` contains a few hooks to later add the data from biodistribution as well as the populations and some CSS&#39;s specific data.

# Commits
- feat: adding GPI&#39;s edo schema interfaces
- feat: adding a subject_evaluation dimensions table unioning a default and a custom CSV
- feat: adding metrics tables
- docs: adding documentation about the dashboard activation
- docs: adding a placeholder for the upcomming dashboard

# How to run and check the PR ?
1. Enable the dashboard in you CSS&#39;s specific dashboard :

```yaml
# cssXX/dbt_project.yml
models:
    tbe:
        res_etapes:
            +enabled: True
```
2. Load the seeds into the database. By default, only the default seed will be loaded. Refer to the README to add your CSS&#39;s specific seed file.

```bash
dbt seed --full-refresh
```

3. Run the dashboard
* As all related resources are tagged with `res_etapes`, you can limit the ETL execution to this dashboard resources by adding a select statement.

```bash
dbt run --select &#39;res_etapes&#39;
```

## VDC reviewers
* A PR with the same name introduces a custom seed table for VDC. ([`f67f346`](https://github.com/Sciance-Inc/core.dashboards_store/commit/f67f3468bdea4d7a1864a9831587c62447d2f9b2))

* Merged PR 263: Ajustement de la macro qui valide la résolution des différentes requêtes

![image.png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/263/attachments/image.png)

l&#39;argument `combination_of_columns` liste l&#39;ensemble des éléments a prendre en compte pour tester l&#39;unicité. Ceux-ci sont décris dans le schema lié au TdB

ex:

![image (2).png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/263/attachments/image%20%282%29.png)

Résultante :

![image (4).png](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/263/attachments/image%20%284%29.png) ([`3446808`](https://github.com/Sciance-Inc/core.dashboards_store/commit/3446808a788ae7e40b5192c61437d006ea4a6dde))

* Merged PR 259: Déterminer le nombre d&#39;élèves total en FP / FGA des 10 dernières années

- feat: add a &#39;vars&#39; field for the jade data source
- feat: make the Jade tables e_ele, e_freq, t_prog accessible
- feat: added interface i_t_service_enseign (WL_Descr + filter)
- feat: add fact_freq_fp
- feat: add fact_freq_fga
- chore: update the schema file
- feat: added tables that count the number of fp fga students by year / school
- chore: update the READMME file

Related work items: #1175 ([`53563fc`](https://github.com/Sciance-Inc/core.dashboards_store/commit/53563fc5155e813f9724fb9ce572f08adee1e99d))

* Merged PR 254: correction de la branche employé en congé

- refacto: modify_emp_conge_position_in_models_list
- feat : modify_schema.yml_emplacement
- fix: correcti models_name
- fix: add_model_prefix
- Merge branch &#39;develop&#39; into feature/emp_cong_correction ([`c3f0c73`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c3f0c739d454f64d36b11df865e7bad92508a41e))

* Merge branch &#39;develop&#39; into feature/emp_cong_correction ([`bbddb40`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bbddb4025edb4ee6054bbfab58fd5ab96bc2d320))

* feat : modify_schema.yml_emplacement ([`d5cd0cf`](https://github.com/Sciance-Inc/core.dashboards_store/commit/d5cd0cf04eac2c392060486d070db6d156f5a880))

* refacto: modify_emp_conge_position_in_models_list ([`1783129`](https://github.com/Sciance-Inc/core.dashboards_store/commit/178312997f65ce4279944238f2854a9ae2fc3b85))

* Merged PR 251: Comptabiliser le nombre d&#39;eleves inscrits en FGJ

- feat: make tables gpm_e_dan and gpm_t_eco accessible
- feat: update adapt source file
- feat: add a query to group all students registered in FGJ
- feat: add a spine table
- feat: added a query to count the number of students per year, school population
- feat: add a test to make sure that the tables on GPI are resolved by fiche / id_eco
- feat: add tests to ensure the resolution of the population table and base spine table ([`e2ee146`](https://github.com/Sciance-Inc/core.dashboards_store/commit/e2ee146f614c84d0aab454e43b07b1b8d2669cec))

* Merged PR 246: Création du TDB employés en congé

- feat: add adapt macro
- feat: add stg_populations
- feat: add base_spine table
- chore: change keyword pevr by tbe
- Merged PR 225: Mise à jour du répertoire pour enlever la FP/FGA + répondre au besoin de la User Story 910
- refactor: test if an error message is sent when dbt test fails
- refactor: fix the bug introduced earlier
- chore: add schema file for bridges folder
- chore: change the name of the source database
- chore: update of the source file which indicates the adapters
- chore: update the sources file
- feat: add a fact table that tracks the number of part-time employees in the last 10 years
- Merged PR 238: Cleanage du repertoire core.data.tbe
- Merge branch &#39;develop&#39; into feature/partial_work
- feat: adapt macro test
- chore: update the packages
- chore: put the tests in the macro adapt in comments
- feat: connection of databases: geobus and piastreto obtain data for analyzing school transport  efficiency
- fix: updated comments
- chore: change the project structure (store structure)
- feat: change in the dbt_project to manually activate the dashboards of interest on the css repo (enable option)
- Merge branch &#39;feature/partial_work&#39; into feature/emp_conge
- add request for the employes in holiday and macro for calculate the current year
- Power BI emp_conge added
- Emp_conge - Schema.yml modified
- feat: modify_db
- Merge branch &#39;feature/emp_conge&#39; of ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/core.data.tbe into feature/emp_conge
- Merged PR 242: changement structure projet + ajout du projet prospectif_cdp
- Merge branch &#39;develop&#39; into feature/emp_conge
- fix: delet_conflict_message
- feat: move_interface_table_cssrepo_to_core_modify_schema.yml
- Chore: move_filter_from_interface_table_to_fact_table
- feat: add_new_model_emp_cong_to_dbtproject
- fix: modify version_from_0_to_2
- fix: add_prefix_to test_name_to_resolve_ambiguity ([`3e0a241`](https://github.com/Sciance-Inc/core.dashboards_store/commit/3e0a24185f77678c42494e07b0247939eba4b529))

* fix : modify_cod_syntax ([`ee5459b`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ee5459bcf2a15c6ad039f516bbf1c1083ddeb748))

* fix : delet_models_duplicat ([`1addb27`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1addb270e0d16732c68b163b483e6380afafd1dc))

* Merged PR 252: solving the between-schemas-tables-names-conflicting

# Commits
- refactor: adding missing schema to increase between tables segregations
- doc: adding documentation about the between-schema-tables-names-conflict
- fix: the schema is now written in full letters

# Objective
## Primary
* The PR aims a documenting a way to solve the `between-schemas-tables-names-conflicting` issue.
* This issue occurs when two tables, in two different projects, share the same name as illustrated by the `fact_absence` in the following files tree

```
.
└── core.store/
    ├── reporting/
    │   └── employees_absences.pbit
    └── models/
        ├── employees_absences/
        │   └── fact_absences.sql
        └── dummy/
            └── fact_absences.sql
```

## Secondary
* The PR updates the `dbt project` to namespacing the dashboards through the use of schemas.
* The PR also adds a bunch of minor typos corrections (ongoing work) in the readme
* The PR adds a new table in the `README` to identify the owner of the various dashboards.
* The PR writes down some new conventions to be reviewed

# Solution
* The PR updates the `README` with the addition of a new section gathering common DBT issues we might encounter and the corresponding patterns to solve these issues.

# How to run it
* The PR *does not* introduce new code.

# Side effects
* The PR has no side effect that need to be reflected in the css-specific packages ([`5303444`](https://github.com/Sciance-Inc/core.dashboards_store/commit/530344450d609ddfe944701dcad8896d21c3a6d3))

* Merge branch &#39;feature/emp_conge&#39; of ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/core.data.tbe into feature/emp_conge ([`5e873a0`](https://github.com/Sciance-Inc/core.dashboards_store/commit/5e873a0679dceba7aecfb4472b9ef4c2a6f85e58))

* Chore: move_filter_from_interface_table_to_fact_table ([`cd0bb40`](https://github.com/Sciance-Inc/core.dashboards_store/commit/cd0bb4033987daec2ede8009337fe4c6e3d046b3))

* Merged PR 242: changement structure projet + ajout du projet prospectif_cdp

- feat: add adapt macro
- feat: add stg_populations
- feat: add base_spine table
- chore: change keyword pevr by tbe
- Merged PR 225: Mise à jour du répertoire pour enlever la FP/FGA + répondre au besoin de la User Story 910
- refactor: test if an error message is sent when dbt test fails
- refactor: fix the bug introduced earlier
- chore: add schema file for bridges folder
- chore: change the name of the source database
- chore: update of the source file which indicates the adapters
- chore: update the sources file
- feat: add a fact table that tracks the number of part-time employees in the last 10 years
- Merged PR 238: Cleanage du repertoire core.data.tbe
- Merge branch &#39;develop&#39; into feature/partial_work
- feat: adapt macro test
- chore: update the packages
- chore: put the tests in the macro adapt in comments
- chore: change the project structure (store structure)
- feat: change in the dbt_project to manually activate the dashboards of interest on the css repo (enable option) ([`8b250d6`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8b250d6550b3b8bd2bb945d67ba2247a3d7cedf7))

* Emp_conge - Schema.yml modified ([`b4a3c1e`](https://github.com/Sciance-Inc/core.dashboards_store/commit/b4a3c1e25127807c49264c449104d3b622e888b8))

* Power BI emp_conge added ([`589c1a1`](https://github.com/Sciance-Inc/core.dashboards_store/commit/589c1a1aa4155441d776426228e4d87cf3c495d2))

* add request for the employes in holiday and macro for calculate the current year ([`90b1564`](https://github.com/Sciance-Inc/core.dashboards_store/commit/90b1564cbc217de071cff9fbc607a428b5db72b2))

* Merged PR 238: Cleanage du repertoire core.data.tbe

- chore: move PBIX files outside the models folder
- chore: modify the sources database in the dbt_project
- chore: update the schema file for the adapters
- chore: add a schema file for the interfaces
- chore: add a schema file for the bridges folder
- chore: add a schema file for the spines folder ([`c6711a1`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c6711a103dd90f6edc916781c314ebb3e92c55ec))

* Chore: move_filter_from_interface_table_to_fact_table ([`bd32a52`](https://github.com/Sciance-Inc/core.dashboards_store/commit/bd32a521b0fca6ecd368b71a7e07f0eeecb96341))

* Merge branch &#39;develop&#39; into feature/emp_conge ([`73c0bc7`](https://github.com/Sciance-Inc/core.dashboards_store/commit/73c0bc75790f4ab02803378c70fbbdd5e910fce8))

* Merged PR 242: changement structure projet + ajout du projet prospectif_cdp

- feat: add adapt macro
- feat: add stg_populations
- feat: add base_spine table
- chore: change keyword pevr by tbe
- Merged PR 225: Mise à jour du répertoire pour enlever la FP/FGA + répondre au besoin de la User Story 910
- refactor: test if an error message is sent when dbt test fails
- refactor: fix the bug introduced earlier
- chore: add schema file for bridges folder
- chore: change the name of the source database
- chore: update of the source file which indicates the adapters
- chore: update the sources file
- feat: add a fact table that tracks the number of part-time employees in the last 10 years
- Merged PR 238: Cleanage du repertoire core.data.tbe
- Merge branch &#39;develop&#39; into feature/partial_work
- feat: adapt macro test
- chore: update the packages
- chore: put the tests in the macro adapt in comments
- chore: change the project structure (store structure)
- feat: change in the dbt_project to manually activate the dashboards of interest on the css repo (enable option) ([`ab5fb58`](https://github.com/Sciance-Inc/core.dashboards_store/commit/ab5fb58f8b216c286e83c86b37dd1e20f7539060))

* Emp_conge - Schema.yml modified ([`458f71d`](https://github.com/Sciance-Inc/core.dashboards_store/commit/458f71da1ea7bc27d829cee6de14de1e8a28149e))

* Power BI emp_conge added ([`c312321`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c312321affae2b99f9a90debc6568b5b939cbca2))

* add request for the employes in holiday and macro for calculate the current year ([`dfe314c`](https://github.com/Sciance-Inc/core.dashboards_store/commit/dfe314c82052e117cbc5ac38660cc0582529166c))

* Merge branch &#39;feature/partial_work&#39; into feature/emp_conge ([`0e86a62`](https://github.com/Sciance-Inc/core.dashboards_store/commit/0e86a62bcb0da1c4620b28c94137a1f20e7e16d4))

* Merge branch &#39;develop&#39; into feature/partial_work ([`1efb8c4`](https://github.com/Sciance-Inc/core.dashboards_store/commit/1efb8c4a94d0986f95e77375d449fd2feb62506c))

* Merged PR 238: Cleanage du repertoire core.data.tbe

- chore: move PBIX files outside the models folder
- chore: modify the sources database in the dbt_project
- chore: update the schema file for the adapters
- chore: add a schema file for the interfaces
- chore: add a schema file for the bridges folder
- chore: add a schema file for the spines folder ([`7357543`](https://github.com/Sciance-Inc/core.dashboards_store/commit/73575437f971ba1518e9b273cce16d63a2a8d670))

* Merged PR 225: Mise à jour du répertoire pour enlever la FP/FGA + répondre au besoin de la User Story 910

- feat: creat_tables_and_DB_for_US910
- feat : delete files unused
- refactor: delete old scripts
- feat: update the resolution tests
- feat: update base_spine
- feat: add schema to describe feature tables and test the resolution
- change &#39;pevr&#39; by &#39;tbe&#39;
- refactor: modify the base_spine to use to build the fact_eleve table
- refactor: change pevr suffix byt tbe suffix
- Merge branch &#39;feature/user_story_910&#39; of ssh.dev.azure.com:v3/Centre-Expertise-IA/COTRA-CE/core.data.tbe into feature/user_story_910
- refactor: change profile name ([`c2f8634`](https://github.com/Sciance-Inc/core.dashboards_store/commit/c2f863417c2bb3de5b13238257dfe1059e70844e))

* Initial commit ([`8c06729`](https://github.com/Sciance-Inc/core.dashboards_store/commit/8c067291f34e3e343a5f69ab0adad73400be7ff2))

* Added README.md ([`7bff872`](https://github.com/Sciance-Inc/core.dashboards_store/commit/7bff872c23024681d4eb67fb731e7b67e09f66d5))
