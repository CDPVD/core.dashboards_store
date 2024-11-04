# CHANGELOG



## v1.0.0+20241104 (2024-11-04)

### Breaking

* feat!: MaJ du readme.md et fermeture du répertoire ([`25103f1`](https://github.com/CDPVD/core.dashboards_store/commit/25103f12b5c938274ddeccf1f92e3dccba4b8cd1))

### Bug fixes

* fix(res_epreuves): correction des descriptions et de l'affichage de données dans le TDB (#24)

* fix: correction des descriptions et de l'affichage de données, et ajout  de champ à l'affichage

* fix: correcrtion nom de champs

---------

Co-authored-by: sadqim <sadqim@csvdc.qc.ca> ([`8f14a61`](https://github.com/CDPVD/core.dashboards_store/commit/8f14a61c4b15fd1ec5dffd58e27e746a94526a4e))


## v0.11.0+20241002 (2024-10-02)

### Bug fixes

* fix: naming incorrect dans la table suivi_diplomation (#20) ([`f2ffb98`](https://github.com/CDPVD/core.dashboards_store/commit/f2ffb98f2357529bcedd55038a723de5b674d6dc))

* fix: corriger_nom_colonne_moderatin_regional_provincial (#17)

Co-authored-by: sadqim <sadqim@csvdc.qc.ca> ([`b2dd6d3`](https://github.com/CDPVD/core.dashboards_store/commit/b2dd6d324a75f30f10aad34b15f80b358c21b7b5))

* fix: error in table dip_report_suivi_diplomation (#14)

* fix: error in table dip_report_suivi_diplomation

* Correction des unités acquises en secondaire 4 et 5

* sqlfmt pour le fichier dip_report_suivi_diplomation.sql

* fix: Correction des unités prévisionnel

---------

Co-authored-by: sadqim <146247957+sadqim@users.noreply.github.com> ([`593d91f`](https://github.com/CDPVD/core.dashboards_store/commit/593d91f2e87e171f612c0d9a8a1393283c09c183))

* fix: improved is_doubleur SQL query (#12)

* fix: improved is_doubleur SQL query

* fix: Application de sqlfmt ([`a832659`](https://github.com/CDPVD/core.dashboards_store/commit/a83265948731407a2eedd50da8ba15682c6341b8))

* fix: correct column en cours (#11)

Co-authored-by: sadqim <sadqim@csvdc.qc.ca> ([`5773e82`](https://github.com/CDPVD/core.dashboards_store/commit/5773e8254e7bec7e4969862460a14ebcda0e73c2))

### Features

* feat: Ajout d'un nouveau tableau de bord PEVR (#18)

* feat: ajout de l'indicateur 1.1.1.1.1 ->taux de qualification FMS

* feat: ajout de l'indicateur 1.1.1.1.2 -> FPT

* chore: modifier le perimetre fpt.

* chore: correction erreur de syntaxe

* feat: ajout du schema

* chore: maj du tdb

* chore: fix missing licence

* chore: exclusion de l'année prévisionnelle

* fix: erreur de duplicat dans pevr_indicateur_des

* feat: ajout de commentaire et separation de ri_mentions

* fix: correction d'un bug avec la date

* feat: ajout du schema pour stg_ri_mentions

* chore: correction des duplicats et ajout de filtre.

* chore: modification de stg_ri_mentions à fact.

* feat : add alias

* fix: régler le licence_checker

* chore : changed some filter + sqlfmt

* chore: ajout de date_exec_sanct pour utilisation future

* Chore: ajout de case pour eviter d'avoir des resultats null

* feat: ajout de distribution

* feat: ajout de distribution au filtre

* chore: maj des noms et pbix

* fix: incohérence entre ri_mentions et t_prog

* chore: sqlfmt

* chore: modification d'un problème du run de sqlfmt

* chore: ajout de row_number dans les indicateurs

* chore: modification du row_number pour prendre l'année la plus récente.

* chore: suppression de code inutile.

* chore: maj du schema et modification des noms.

---------

Co-authored-by: sadqim <sadqim@csvdc.qc.ca> ([`94a220d`](https://github.com/CDPVD/core.dashboards_store/commit/94a220d9fbedbe0f78c537caff96017b97cca442))

* feat: nouvelle version du tableau de bord des épreuves uniques, obligatoires et locales (#15)

* feat : mise à jour du model res_epreuves

* feat: add_column_to_interface

* feat : cration des nouvelles tables du nouveau tbd des épreuves

* feat : ajout pbit

* feat : ajout pbit

* feat: mise à jour de la doc

* feat: modifier le schema, doc and script

* feat: ajouter la seed au nightly

* fix: gerer les resultats non numerique

* fix : modification suite au commentaire de la PR

* fix : suite des modifications suite au commentaire de la PR

* fix :ajout de parametre dans le pbit

* mend

---------

Co-authored-by: sadqim <sadqim@csvdc.qc.ca>
Co-authored-by: Gabriel Girouard <gabriel.girouard@csssh.gouv.qc.ca> ([`cf03674`](https://github.com/CDPVD/core.dashboards_store/commit/cf0367471a78fa851da80a6fb6e183bf5bed2fb2))

* feat: ajout d'une table de staging pour le mapping des adresses au 30/09 et la plus récente pour chaque année (#13)

* chore(suivi_effectif): adding geospatial skeleton

* jade interface added to get student address history

* feat: staging table storing students address history

* feat: get additional fields in the e_adr interface

* feat: staging table to identify student addresses

* fix: adjust rule to identify home address

* feat: code adjustment to generate a postal code per fiche/year

* chore: update yaml schema to test uniqueness of my staging table

* feat: consider all addresses when there is only one type of address on the student's plan

* feat: field added to staging_adresses table to correct inconsistencies

* feat: distinguish between the latest addresses and those at september 30

* chore: modifiy licence

* chore: modify the schema describing the stg_adresses_eleves table

---------
Co-authored-by: alluardj <alluardj@csvdc.qc.ca> ([`3de681e`](https://github.com/CDPVD/core.dashboards_store/commit/3de681edddb80ec4e2f1141694764174fef0c755))

* feat: Add new dashboard "Employees active" (#6)

* chore: Query and dashboard updated | Employes active

* refactor: uniformize code

* doc: readme updated | Employes active

* feat: correction apportés

* fix: licence missed

* fix: remove duplicates and add missed variable

* feat: tdb Report builder

* fix: corrections PR v0

* fix: pr version 3

* fix: report builder | En-tête et format d'impression

* fix: request edited for getting current employees and adding searchbar for  report builder

* Fix: schema corrected ([`1fc6650`](https://github.com/CDPVD/core.dashboards_store/commit/1fc6650791eef7743adf909a1cfd7e44311d09de))

### Refactoring

* refactor: renaming and add columns to interface  (#8)

* feat: added regrp_ehdaa in i_gpm_e_dan for pops

* fix: delete_vdc_specific_table (#1)

Co-authored-by: sadqim <sadqim@csvdc.qc.ca>

* hotfix: fixe sur les warning par rapport au schema.yml de plusieurs tableau

* feat: added regrp_ehdaa in i_gpm_e_dan for pops

* bugfix: Correction des warning des schema + MaJ des champs utilisés

---------

Co-authored-by: busquef <busquef@cssvt.gouv.qc.ca>
Co-authored-by: sadqim <sadqim@csvdc.qc.ca>
Co-authored-by: Frederyk Busque <147734849+busquef@users.noreply.github.com> ([`0e7f487`](https://github.com/CDPVD/core.dashboards_store/commit/0e7f4879c139f465a58e30d40879aeec9460ec92))


## v0.10.0+20240320 (2024-03-20)

### Chores

* chore: renaming and add columns to interface (#7)

* feat: added regrp_ehdaa in i_gpm_e_dan for pops

* fix: delete_vdc_specific_table (#1)

Co-authored-by: sadqim <sadqim@csvdc.qc.ca>

* hotfix: fixe sur les warning par rapport au schema.yml de plusieurs tableau

* feat: added regrp_ehdaa in i_gpm_e_dan for pops

* bugfix: Correction des warning des schema + MaJ des champs utilisés

---------

Co-authored-by: busquef <busquef@cssvt.gouv.qc.ca>
Co-authored-by: sadqim <sadqim@csvdc.qc.ca>
Co-authored-by: Frederyk Busque <147734849+busquef@users.noreply.github.com> ([`fd0d2af`](https://github.com/CDPVD/core.dashboards_store/commit/fd0d2af3f6c9bacd71e97b519b12614eaca008ce))


## v0.10.0+20240228 (2024-02-28)

### Bug fixes

* fix(template): removing a useless s in the profile ([`7caf858`](https://github.com/CDPVD/core.dashboards_store/commit/7caf8582daa12abefacba174917235208e646ae7))

### Chores

* chore: updating default version in template ([`a09ae99`](https://github.com/CDPVD/core.dashboards_store/commit/a09ae9993f199ee97c65ecfaa723f5a1cf83e68a))

* chore: improving landing page ([`970a085`](https://github.com/CDPVD/core.dashboards_store/commit/970a0859217619a686b78f9eda91cec0905d8073))

* chore: adding a .gitignore ([`22f3111`](https://github.com/CDPVD/core.dashboards_store/commit/22f311147b6eaf9baea405c5afd2527616841f26))

### Features

* feat: v0.10.0 (#41) ([`cad05b2`](https://github.com/CDPVD/core.dashboards_store/commit/cad05b2e99c108a24ca5dd93afc511c106250082))


## v0.9.3+20240111 (2024-01-11)

### Bug fixes

* fix(cookiecutter): stg_sectors does not cause a rendering error anymore ([`69534b5`](https://github.com/CDPVD/core.dashboards_store/commit/69534b5099c662e480b015e5a33634ecf1323409))

* fix: swtich back compentency ID (#29)

Co-authored-by: sadqim <sadqim@csvdc.qc.ca> ([`2131f6e`](https://github.com/CDPVD/core.dashboards_store/commit/2131f6ea1ba355029bdcfd811225e4181a7cb577))

* fix: corrections d'orthographe (#28) ([`c5fe336`](https://github.com/CDPVD/core.dashboards_store/commit/c5fe336f59fd40ea16dd22ac3ba3a6c600a821f3))

* fix(suivi_resultats): remove css specific table (#39) ([`a6b4506`](https://github.com/CDPVD/core.dashboards_store/commit/a6b450675768d70ef8811d0fdedc9ffba95fb76c))

* fix(res_scolaire): fixed error on legend and fixed missing title (#34) ([`db69a96`](https://github.com/CDPVD/core.dashboards_store/commit/db69a963341f1907f8c5bfa40ea9eaa720a10c5f))

* fix(tracking): the requests json attribute has been replaced with a data attributes ([`1e1cc84`](https://github.com/CDPVD/core.dashboards_store/commit/1e1cc84427f2188ea6d27cb8716265647bdb5ff8))

* fix(cookiecutter): stg_sectors does not cause a rendering error anymore ([`d381d53`](https://github.com/CDPVD/core.dashboards_store/commit/d381d530c016f9e0c64b7d515318732ea06783c0))

* fix: swtich back compentency ID (#29)

Co-authored-by: sadqim <sadqim@csvdc.qc.ca> ([`6d20da7`](https://github.com/CDPVD/core.dashboards_store/commit/6d20da7e4adad682a0f5e05b1ae1a952ba0a878c))

* fix: corrections d'orthographe (#28) ([`9a3ed3e`](https://github.com/CDPVD/core.dashboards_store/commit/9a3ed3ed4b6fbac8e8ad282524abc9cbbc2ac20b))

### Chores

* chore(nighlty): installing the core through the branch ([`e8fee16`](https://github.com/CDPVD/core.dashboards_store/commit/e8fee165f18fea69b9b6a631d9e0ffb0a78953ba))

* chore: adjusting the number of reviewers ([`c82793a`](https://github.com/CDPVD/core.dashboards_store/commit/c82793a803f6bad8d115ffaf97d91fd09cf1fa27))

* chore: disabling cssvdc push ([`24e3f39`](https://github.com/CDPVD/core.dashboards_store/commit/24e3f39765b110174ff6d7dc15768a287bdc445f))

* chore: removing unused template ([`7e3a1ad`](https://github.com/CDPVD/core.dashboards_store/commit/7e3a1adbf634327eb3570fe7cf0f963e9aa10314))

* chore(depechecode): the dbt profiles-dir is now configured through an environement variable ([`648f56c`](https://github.com/CDPVD/core.dashboards_store/commit/648f56c4f6aa2ee08da17c4caf46bf756c39fb28))

* chore: gitgnoring .python-version for pyenv interopability ([`7f1e7f7`](https://github.com/CDPVD/core.dashboards_store/commit/7f1e7f7f65646f0b31317ae5779f94264418f0bb))

* chore(template): improving the template with better project naming and pre-populated population tables. (#31) ([`ab74c68`](https://github.com/CDPVD/core.dashboards_store/commit/ab74c68f2ed144231ff11dd8bccd50f2df6df404))

* chore: removing chore and style from commit ([`4a8ca7e`](https://github.com/CDPVD/core.dashboards_store/commit/4a8ca7ed2acaee5a689842bcf63345e032233f50))

* chore(nighlty): installing the core through the branch ([`443902d`](https://github.com/CDPVD/core.dashboards_store/commit/443902d70004baa5c96e44bc5af24e80af7d1b2e))

### Code style

* style(template): applying sqlfmt ([`990cc45`](https://github.com/CDPVD/core.dashboards_store/commit/990cc451612b230a048df8e07cb584be83ed2e84))

* style: applying sqlfmt ([`a6374f2`](https://github.com/CDPVD/core.dashboards_store/commit/a6374f214e7772325f3a4002aacd8f263232db75))

* style(template): applying sqlfmt ([`eb84d5d`](https://github.com/CDPVD/core.dashboards_store/commit/eb84d5dbd8dab859323db2527939b09baf6249f0))

* style: applying sqlfmt ([`e8ca422`](https://github.com/CDPVD/core.dashboards_store/commit/e8ca4227caa02a57a504d9c60ad65340283fd7fc))

### Documentation

* docs: removing CDVDP specific documentation ([`758d1fa`](https://github.com/CDPVD/core.dashboards_store/commit/758d1fa736cd066dbe962dadf2c166742d75dc86))

* docs: addressing docs issues identified by core.dashboards_store/issues/38 ([`8894275`](https://github.com/CDPVD/core.dashboards_store/commit/88942751dd8af9c90de595fda249fc893a388e5a))

* docs: fixing a typo in the overriding link ([`dee9b18`](https://github.com/CDPVD/core.dashboards_store/commit/dee9b187fae0cb91b7895274e680082ae030cc9f))

* docs: fixing various legacy typo in the docs ([`541b85a`](https://github.com/CDPVD/core.dashboards_store/commit/541b85a5a373dc9373c3b35661139d3b375b49a6))

### Features

* feat(pevr): creation d'un mvp pour le tdb pevr (#36)

Co-authored-by: sadqim <sadqim@csvdc.qc.ca> ([`ba62f93`](https://github.com/CDPVD/core.dashboards_store/commit/ba62f9304dbc38dc5d29d384d62b277733b13ae1))

* feat(suivi_resultats): adding a per student portrait (#33) ([`578d1b4`](https://github.com/CDPVD/core.dashboards_store/commit/578d1b493d2770e3090b9493a6123b4ad193faf7))

* feat(res_scolaire): adding a visual ranking difference between a school success score, and the schoolboard's one. (#32) ([`9658074`](https://github.com/CDPVD/core.dashboards_store/commit/96580745a967b8d2e12aacdd5cf90456c5f2e52d))


## v0.9.2+20231210 (2023-12-10)

### Bug fixes

* fix(tests): propagating columns renaming in the tests ([`59cfc94`](https://github.com/CDPVD/core.dashboards_store/commit/59cfc948b55656240dff3fd63f483a3b6fdd3a0b))

### Chores

* chore(nightly): the nightly build will now run using the branch instead of the tag ([`9f2db4c`](https://github.com/CDPVD/core.dashboards_store/commit/9f2db4c61a10074c2f4550b09ee3ab1a9004d37e))


## v0.9.1+20231208 (2023-12-08)

### Bug fixes

* fix(emp_conge): the table now uses the yearly dim_employment mapper, thus avoiding duplicates. ([`6c40936`](https://github.com/CDPVD/core.dashboards_store/commit/6c409366003e5fc0feaec61febdb1ae4e4c6cda7))

* fix(emp_actif): the table now use the yearly dim_employment mapper, thus avoiding duplicates. ([`77da183`](https://github.com/CDPVD/core.dashboards_store/commit/77da183c4c548d7614dbae67b7ef6e020714f360))

### Chores

* chore: removing unknown commit from changelog ([`dd18341`](https://github.com/CDPVD/core.dashboards_store/commit/dd1834182ce2f0f49ed28312353a94b1cfe460b6))

* chore: disabling dev-* chagelog rendering ([`3559aa3`](https://github.com/CDPVD/core.dashboards_store/commit/3559aa32ba697d9c1b89836ca129f08e57fe60c2))

* chore: adding changelog template ([`b2cb311`](https://github.com/CDPVD/core.dashboards_store/commit/b2cb311558b36e073c78d9f1037c4607f224aedc))


## v0.9.0+20231208 (2023-12-08)

### Bug fixes

* fix(template): the template is now using the Fabric adapter ([`c8a0a61`](https://github.com/CDPVD/core.dashboards_store/commit/c8a0a61d4a0795f62deb1e9d6329c5c78de3975e))

### Chores

* chore: disabling tagging of dev version ([`5886bac`](https://github.com/CDPVD/core.dashboards_store/commit/5886bac9faf0e8f1ba7b9f9958c793c5474dd75f))

### Features

* feat: Ajout des résultats étapes au tdb Analyse des résultats scolaires (#22)

Co-authored-by: sadqim <sadqim@csvdc.qc.ca>
Co-authored-by: Hugo Juhel <22279443+hugoJuhel@users.noreply.github.com> ([`8e0ddab`](https://github.com/CDPVD/core.dashboards_store/commit/8e0ddab1c865fb463d1d92a13a7483e393f021c6))


## v0.8.2+20231206 (2023-12-06)

### Bug fixes

* fix(adapter): swtich the adapter from dbt-sqlserver to fabric (#26)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`9b507f5`](https://github.com/CDPVD/core.dashboards_store/commit/9b507f5a367ac7600f2027c656435982dc9c3399))

* fix(predictive_view_aggregated): typo in variable selection ([`519ad45`](https://github.com/CDPVD/core.dashboards_store/commit/519ad452cf24767ed2f27eabb869752514b9b611))

### Chores

* chore(fix): setting profile dir through env_var instead of hardcoding it ([`9c5c2c4`](https://github.com/CDPVD/core.dashboards_store/commit/9c5c2c42047ecfe623f45cb7a4e93f0deda95305))

* chore(fix): directctly calling poetry to run dbt during the docker build ([`7fbf267`](https://github.com/CDPVD/core.dashboards_store/commit/7fbf267211ba0bdfea34d630f852e62daa3c2c43))

### Features

* feat: adding new feature profiles (#25) ([`56463cb`](https://github.com/CDPVD/core.dashboards_store/commit/56463cb58f8fccd2a0a26d4f7c9196f9f3dff59e))

* feat(predictive_view_aggregated): adding demo mode ([`a68ed57`](https://github.com/CDPVD/core.dashboards_store/commit/a68ed57ca5cabd562c936e6c66de217e2a49da8c))

* feat: propagating switch to the fabric adapter ([`14bf027`](https://github.com/CDPVD/core.dashboards_store/commit/14bf027861bf6b59af08ae2f282359ef4d53e9db))

### Refactoring

* refactor: swtich the adapter from dbt-sqlserver to fabric (#24)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`e249828`](https://github.com/CDPVD/core.dashboards_store/commit/e24982828a7c275f468100c3ab0ecc561f7ec240))


## v0.8.1+20231114 (2023-11-14)

### Bug fixes

* fix(typo): various dashboards typo adjustements (#23)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com>
Co-authored-by: Gabriel Thiffault <147753578+gabrielThiffault@users.noreply.github.com> ([`48ee40c`](https://github.com/CDPVD/core.dashboards_store/commit/48ee40cf32ebdd4ebd1b3cb6189e7e00a52d6492))


## v0.8.0+20231102 (2023-11-02)

### Features

* feat: releasing news changes of v0.8.0 (#16)

Co-authored-by: juhel hugo <juhel.hugo@stratemia.com>
Co-authored-by: github-actions <github-actions@github.com>
Co-authored-by: Mohamed Sadqi <sadqim@csvdc.qc.ca>
Co-authored-by: sadqim <146247957+sadqim@users.noreply.github.com>
Co-authored-by: ZhuravlovaMaryna <147752681+ZhuravlovaMaryna@users.noreply.github.com>
Co-authored-by: semantic-release <semantic-release> ([`ad2b5d3`](https://github.com/CDPVD/core.dashboards_store/commit/ad2b5d3d620b2d274ffbabe7729c0e0a2b22f43d))


## v0.7.0+20231020 (2023-10-20)

### Documentation

* docs: adding doc website ([`5274842`](https://github.com/CDPVD/core.dashboards_store/commit/527484220ce31305fab121a9d8155bc05be2d66e))


## v0.7.0+20230926 (2023-09-26)

### Bug fixes

* fix: removing duplicates from the transport details (#15)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`105eeba`](https://github.com/CDPVD/core.dashboards_store/commit/105eeba21eac22f8a6e3528f00adc76502608ab0))

* fix: minor maintenance on the cicd pipeline o prepare for code freeze (#14)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`aabb1a4`](https://github.com/CDPVD/core.dashboards_store/commit/aabb1a43be918ad7d00f59de5b37dec4dc5af617))

* fix: renaming transport staging adapter table to match it's alias (#13)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`3bc7a78`](https://github.com/CDPVD/core.dashboards_store/commit/3bc7a78e54c89f5cfbdaf858664c71db69c7cb13))

* fix: filter_non_null_obj_number (#9)

Co-authored-by: sadqim <sadqim@csvdc.qc.ca>
Co-authored-by: Hugo Juhel <22279443+hugoJuhel@users.noreply.github.com>
Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`3c120b2`](https://github.com/CDPVD/core.dashboards_store/commit/3c120b2c73b75329906ed3225eaa3aa657614927))

* fix(spine): removing students with duplicated code perm ([`b0464e1`](https://github.com/CDPVD/core.dashboards_store/commit/b0464e1595b41efd3ae2ff5a06cf727f9067fe51))

* fix: properly injecting the name of the db when not using a linked server ([`ff6fbf5`](https://github.com/CDPVD/core.dashboards_store/commit/ff6fbf5b98ecfb8ec0aad69c679ec8b3624869c3))

* fix: disembiguate duplicates resulting from multiple fetchs from the Jade database

Done with Fred and Mohamed :

* Remove duplicates introduced by fetching the Jade database multples times.
* Only the most recent upserted grade is now used., Previous results are removed. ([`b66b53e`](https://github.com/CDPVD/core.dashboards_store/commit/b66b53ec6f377ee072240be60bc1dd46f4f6a098))

* fix: removing dead code ([`1f64fe2`](https://github.com/CDPVD/core.dashboards_store/commit/1f64fe242dccb0152887c66a3da87710c4fddb12))

### Chores

* chore: forcing push to the CSSVDC repo ([`47ae4cc`](https://github.com/CDPVD/core.dashboards_store/commit/47ae4cc055b1742487c9dc0203d79d1f2f92010e))

* chore: adding the stamper to the gabarit (#12)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`92ed003`](https://github.com/CDPVD/core.dashboards_store/commit/92ed0034bfa9849ad051e1fcad2e8fcd1e335873))

* chore: the nightly build can now be manually triggered ([`5b7f227`](https://github.com/CDPVD/core.dashboards_store/commit/5b7f2274514e58f91cb62a60b9401abda7929f10))

* chore: increasing verbosity of the release pipeline ([`537283d`](https://github.com/CDPVD/core.dashboards_store/commit/537283d1f0578eb5a4c49f7bba7f742f57fde0a2))

* chore: sqlfmt is now run in check mode and will raise an error if something is left to be formatted ([`8de5860`](https://github.com/CDPVD/core.dashboards_store/commit/8de5860234cd5eced3d9c5f49ff0840d10cb5865))

* chore(cicd): running the fmt on all files ([`4d20729`](https://github.com/CDPVD/core.dashboards_store/commit/4d20729a7b899afe98790035c4f911253db8ade1))

* chore(cicd): disabling the sqlfmt checks on template ([`2207449`](https://github.com/CDPVD/core.dashboards_store/commit/22074499d21a050c8bc49e8e05b0017d0766b9f8))

* chore(licence-check): warning won t be treated as error anymore ([`c161e9e`](https://github.com/CDPVD/core.dashboards_store/commit/c161e9e62a791eceae175b60ffa64c34b13f2515))

* chore(fix): fixing badly resolved conflict in the template s dbt_project ([`89dc589`](https://github.com/CDPVD/core.dashboards_store/commit/89dc58970ed194b3f55b85c6d80ac845dd3067d0))

* chore: excluding template from formatting ([`8cf9428`](https://github.com/CDPVD/core.dashboards_store/commit/8cf94285fc8304e463cdbd936e5540a8d305fefb))

* chore: mobing the template folder into the tooling folder ([`0a0bd2f`](https://github.com/CDPVD/core.dashboards_store/commit/0a0bd2f78defbe96dc7488bdf905a068f446f117))

* chore: adding missing licence ([`fa498a6`](https://github.com/CDPVD/core.dashboards_store/commit/fa498a60d189c8c369a790cb185a616bd9962346))

* chore: fixing path in licence checker ([`c1f5523`](https://github.com/CDPVD/core.dashboards_store/commit/c1f552383289cf5bd914f253f431ead156f2a653))

* chore: adding assignee item ([`e9d123d`](https://github.com/CDPVD/core.dashboards_store/commit/e9d123dbb22d440811e9f6f53e80dcf7496ff4df))

* chore: adding licence checker ([`468e4a0`](https://github.com/CDPVD/core.dashboards_store/commit/468e4a08ff9672b849217a3c37e035b72054070e))

* chore: updating actions to not triggers on PR if not needed ([`5b68894`](https://github.com/CDPVD/core.dashboards_store/commit/5b68894fa4a7425dabf85d67b6320b679cc7703e))

* chore: adding sqlfmt guidelines and check ([`9623bae`](https://github.com/CDPVD/core.dashboards_store/commit/9623baed2cacb68dac60b83cc53232c98e2d5b63))

* chore: adding question template ([`81b9cf7`](https://github.com/CDPVD/core.dashboards_store/commit/81b9cf72e7517e48d495995de0fde152cd405579))

* chore: updating feature request template ([`6ac3de5`](https://github.com/CDPVD/core.dashboards_store/commit/6ac3de52da533f6db26e9f14048958a6213e96fd))

* chore: adding PR, bug, and feature templates ([`a14021f`](https://github.com/CDPVD/core.dashboards_store/commit/a14021fdca6d65ec53889f52587b56d9e0de6c50))

* chore: moving the nightly build to the tooling subfolder ([`1d82aec`](https://github.com/CDPVD/core.dashboards_store/commit/1d82aecd7e159e4d2c472a04a67ad16381a68c54))

* chore(fix): setting the build context to the root of the folder as pyproject is required ([`36b7a8f`](https://github.com/CDPVD/core.dashboards_store/commit/36b7a8fdf190188d3ee6818ac9e34ce1accad10a))

* chore: moving depeche code to the tooling folder ([`a928669`](https://github.com/CDPVD/core.dashboards_store/commit/a9286696bbb76b3454f66eaa8de7a8fc3265a8f4))

* chore: disabling fail-fast so all the matrix runs will be tried each day ([`8a00df3`](https://github.com/CDPVD/core.dashboards_store/commit/8a00df3c8a123663674eae98b06a314741a92160))

* chore: renaming gabarait to gabarit ([`34d409c`](https://github.com/CDPVD/core.dashboards_store/commit/34d409c6c608bf1962cf3552f47bca10ef7edcaa))

* chore: gitignoring the pbix ([`cb92a3d`](https://github.com/CDPVD/core.dashboards_store/commit/cb92a3d35c6f6417ab7ad36642e23d8bd7ed6d28))

### Code style

* style: applying sqlfmt ([`a6c4b99`](https://github.com/CDPVD/core.dashboards_store/commit/a6c4b9971d3b2b0764bfc32fb4d4fc484bb8cfd3))

### Documentation

* docs: adding docs about overriding populations ([`13b1118`](https://github.com/CDPVD/core.dashboards_store/commit/13b11180491d64036230832bac61f59db1625128))

* docs: fixing a typo in the overriding section ([`95c6bef`](https://github.com/CDPVD/core.dashboards_store/commit/95c6befa8378838aed9041994555aa0fc04b6b11))

* docs: reflecting changes of template new location ([`0b089f4`](https://github.com/CDPVD/core.dashboards_store/commit/0b089f44b08d3db1c8146cdd3fc5bdff01f55750))

* docs: migrating docs notification ([`f4a2739`](https://github.com/CDPVD/core.dashboards_store/commit/f4a2739176e28dc88e7b8b6d0f2e22b30b7a88d4))

* docs: adding doc website ([`37f63ee`](https://github.com/CDPVD/core.dashboards_store/commit/37f63eee7bbcc646ccace0bb7c1ef0b4d845d748))

* docs: improving profiles documentation ([`148f0fd`](https://github.com/CDPVD/core.dashboards_store/commit/148f0fd7bcb57d3089af84de23410a239c395da5))

### Features

* feat: adding the predictive_view_aggregated dashboard (#11)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`d1c252b`](https://github.com/CDPVD/core.dashboards_store/commit/d1c252b071dacae2060c8e2a223e175995879ec4))

* feat(chronic_absenteeism): splitting between lateness and absences (#10)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`eb5ba61`](https://github.com/CDPVD/core.dashboards_store/commit/eb5ba61db01148f5eca7e5b1a3dfdc356d529c6d))

* feat(chronic_absenteeism): adding support for customizable list of absences and lateness (#8)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`4d2b29e`](https://github.com/CDPVD/core.dashboards_store/commit/4d2b29eee58242dd62835d91d68b4146ddba38d1))

* feat: add new res_scolaire dashboard

> Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
cette PR introduit un nouveau TDB qui agrège les résultats au bilan des compétences et matières choisies
> Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?
dans une prochaine PR nous allons ajouter les résultats au Étapes pour les compétence et les matières choisies
> Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout feature/res_scolaire
git pull
cd ../cssvdc.data.store
git checkout feature/res_scolaire
git pull
dbt build --select +tag:res_scolaires
```

> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

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
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added o... ([`e2ea271`](https://github.com/CDPVD/core.dashboards_store/commit/e2ea27179170e04d9cff68fab0a75b6c1914589e))

* feat: adding dashboards ([`7ab3ec2`](https://github.com/CDPVD/core.dashboards_store/commit/7ab3ec2bb1249e10fe2aa94943176841cf9b2280))

### Refactoring

* refactor: added new version of the rapport/transport (#2)

Co-authored-by: hugo juhel <juhel.hugo@stratemia.com> ([`608d260`](https://github.com/CDPVD/core.dashboards_store/commit/608d2604d34beaade44a54b85542912be2f4327c))

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
poetry shell && poetry install
git pull
cd ../cssvt.data.store
git checkout feature/rh_dim_empl
git pull
dbt run-operation drop_schema
dbt build --select +tag:human_resources --full-refresh
``` ([`d88a4e5`](https://github.com/CDPVD/core.dashboards_store/commit/d88a4e50d5a7e872ee4a6180efb40c507e3784ae))

* refactor: renaming profiles with profiles-sample and remove password to avoid giting it by accident ([`017f960`](https://github.com/CDPVD/core.dashboards_store/commit/017f9600bf07bc7797d46960d68ce907d2effb9c))


## v0.6.2+20230913 (2023-09-13)

### Documentation

* docs(fix): updatating the stamp_model's macro name ([`404c505`](https://github.com/CDPVD/core.dashboards_store/commit/404c50554330cb1b2767230c7c56a6f45fad19b9))

### Features

* feat: adding licence ([`25994ad`](https://github.com/CDPVD/core.dashboards_store/commit/25994ad9cf1c11b9291d5cba5cece37ede4caa1f))

* feat: adding dim_employees ([`99ee1db`](https://github.com/CDPVD/core.dashboards_store/commit/99ee1dbdd030547a78233cc872e567a32935fc5b))


## v0.6.2+20230831 (2023-08-31)

### Bug fixes

* fix(cicd): adding job scope to group name ([`508f8de`](https://github.com/CDPVD/core.dashboards_store/commit/508f8de800f145202bf23de0419053f61e1baa3c))

### Chores

* chore(cicd): adding concurrency piority ([`dbff52c`](https://github.com/CDPVD/core.dashboards_store/commit/dbff52c6c90b055510733b4b00811304c1bcc58f))


## v0.6.1+20230831 (2023-08-31)

### Bug fixes

* fix(cicd): fixing the stable pattern ([`f00b560`](https://github.com/CDPVD/core.dashboards_store/commit/f00b560efb13bac0264b3fd48868cc43901ec25c))


## v0.6.0+20230831 (2023-08-31)

### Bug fixes

* fix(cicd): fixing the stable pattern ([`9a2959c`](https://github.com/CDPVD/core.dashboards_store/commit/9a2959cd8d4e1a8d553db2310b788855207b5cdb))

### Chores

* chore(test): adding the stable version to the nightly build ([`ad7fc6c`](https://github.com/CDPVD/core.dashboards_store/commit/ad7fc6c7c4e0aef4c338049830a0a19c306ed460))

* chore(cicd): fixing maximal matrix concurrency to 1 to avoid burning the database ([`e22153a`](https://github.com/CDPVD/core.dashboards_store/commit/e22153a163345ae009ce9524a3507a8673deab28))

* chore(fix): logging to the github registry before pushing the docker ([`493e726`](https://github.com/CDPVD/core.dashboards_store/commit/493e726ffd8395aa2ab3f46c6e1e4eff7d470fc2))

* chore(cicd): adding the command to run the integration tests suite ([`da003f3`](https://github.com/CDPVD/core.dashboards_store/commit/da003f39d1925e5c50575d1c438ae98c3df187d2))

* chore: trigger the nightly on master ([`5e34159`](https://github.com/CDPVD/core.dashboards_store/commit/5e34159c32fcd697667b1abdda44bfcae95134f6))

### Code style

* style: applying sqlfmt ([`b822989`](https://github.com/CDPVD/core.dashboards_store/commit/b82298934ab59740fe2ece0097eb2f44d63d579b))

### Testing

* test(fix): fixing the test populations ([`6be75a0`](https://github.com/CDPVD/core.dashboards_store/commit/6be75a085ab0d9fd5e5e6065b4f75fd2e9e9bebd))


## v0.5.3 (2023-08-31)

### Bug fixes

* fix: adding dummy id_eco to custom_fgj_population so the table is now working when not overrided ([`4cb464c`](https://github.com/CDPVD/core.dashboards_store/commit/4cb464c115a88a3ba9bb8c639ddcbac0684eba0c))

* fix: the default empty custom population now properly support the id_eco ([`17e25e9`](https://github.com/CDPVD/core.dashboards_store/commit/17e25e9a0f4336fb868272ecd52f08f472998604))

### Chores

* chore: adding CICD pipeline for nightly release ([`1fc829f`](https://github.com/CDPVD/core.dashboards_store/commit/1fc829ffe2b1e1f82f94fea1790bb8ff5d82492a))

* chore(test): adding the dockerfile and the required files to run the integration tests ([`c99333d`](https://github.com/CDPVD/core.dashboards_store/commit/c99333dfbd03f8296d0fe61724fbc7a829884019))

### Documentation

* docs: updating both the readme and the PR template to help developers populating seeds in the nightly project ([`2a1b15f`](https://github.com/CDPVD/core.dashboards_store/commit/2a1b15fff10c8c765eeab5f4676753f83fc4ec5f))

* docs(test): adding an how-to about the way to run the integration test on your local computer ([`dc05178`](https://github.com/CDPVD/core.dashboards_store/commit/dc05178f21798eeaecbed9ca34b305e401af57a3))

### Testing

* test: adding a simple /default dbt project to be run as an integration test ([`46bc620`](https://github.com/CDPVD/core.dashboards_store/commit/46bc6200e358b343779523da179bdfe4ff856c12))


## v0.5.2 (2023-08-30)

### Bug fixes

* fix: adding the missing is_context_core variable to the cookiecutter

commit 541e66cd7e66564c2c16c99e27da30538469c3b8
Author: hugo juhel <juhel.hugo@stratemia.com>
Date:   Wed Aug 30 12:58:33 2023 -0400

    fix: adding the missing is_context_core variable to the cookiecutter ([`3e57cf2`](https://github.com/CDPVD/core.dashboards_store/commit/3e57cf26677ca94b5a52a4594049efbf7401975b))

### Build system

* build(dag): disabling email on failure as I don t have any smtp server ([`e66f488`](https://github.com/CDPVD/core.dashboards_store/commit/e66f488f4e33b6bee7490eccbfeb38110cfebf75))

### Chores

* chore: adding the sqlfmt linter

# Objectives of the Pull Request ?
> Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?

* The PR introduces the `sqlfmt` formatter in the tools chain.
* `sqlfmt` parses the SQL code and produces a formatted version of it.
* The formatted version uses standard style guidelines, that are NOT developer-dependant, resulting in a more coherent developing experience.
* Formatting the SQL code will help developers review other developer's code

* The PR also adds a `git pre-commit-hook` that can be installed to automagically format the code prior to the commit.
* The pre-commit-hook can be install with the commands documented in the `README.md`

* A new item is added to the `pull-request-template` to remind developers of formatting their code.

# What is left out of the Pull Request ?
> Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

* The PR does not decide on whether or not, the particular style-guide of `sqlfmt` should be accepted as-is or tuned. For now, everything is set as default

# How to review the PR ?
* The commit `style: applying fmt` contains ALL newly-styled files.
* I advise you not to first select this commit, as doing so will impair your ability to review the other files.

# How to run the pull request ?
> Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

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

# Pull request's checklist
> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Template** :
  *  [X] I have updated the `core/template/{{ cookiecutter.project_slug }}/dbt_project.yml` file accordingly to my changes.
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request... ([`c80072e`](https://github.com/CDPVD/core.dashboards_store/commit/c80072e048897680152d38f83b71020afb28153a))


## v0.5.1 (2023-08-30)

### Bug fixes

* fix: dependencies will now be parsed as ref when source are used and is_context_core is set to false ([`8a97d08`](https://github.com/CDPVD/core.dashboards_store/commit/8a97d08db0615440925c82a7f236f6d412cc2a31))

* fix: dependencies will now be parsed as ref when source are used and is_context_core is set to false ([`a8316f7`](https://github.com/CDPVD/core.dashboards_store/commit/a8316f7346e4c62725eeea6f76eff77468cc2e6a))

* fix: the purge_metadata_macro will no be triggered in compile only mode ([`d038274`](https://github.com/CDPVD/core.dashboards_store/commit/d0382743b8cdd3984dd1ae7584fb929f9866c48d))

* fix: the drop_schema macro won<t try to remove the public schema dbo anymore ([`88e0414`](https://github.com/CDPVD/core.dashboards_store/commit/88e04149036bed97a4aa6aea27e6c3c8c473360f))

* fix: uniformizing the base version of dbt-sqlserver and dbt-core so raised errors are now hidden behin RuntimeExeception anymore ([`e9deef0`](https://github.com/CDPVD/core.dashboards_store/commit/e9deef0f0a56475f3c5f76c493186af60828d799))

* fix(build): fixing the azure target ([`ce6bad3`](https://github.com/CDPVD/core.dashboards_store/commit/ce6bad3304167af68e94141296b691fb8d5e34f2))

### Build system

* build(fix): addinthe token as an header ([`434a6fd`](https://github.com/CDPVD/core.dashboards_store/commit/434a6fdd2f2cf6f5702886241e5e589525e22888))

* build(fix): addinthe token as an header ([`9b8678d`](https://github.com/CDPVD/core.dashboards_store/commit/9b8678d13641048c88d7f8ef4f5874747238f298))

* build(azure): removing azure build ([`4627ecc`](https://github.com/CDPVD/core.dashboards_store/commit/4627ecce83461c192b0d24461d55fc98beafee15))

* build(release): updating the release process ([`c323552`](https://github.com/CDPVD/core.dashboards_store/commit/c3235522cbe90b3c7de921ced9f25f41f6502207))

* build(azure): swithcing to deep fetch ([`2646d79`](https://github.com/CDPVD/core.dashboards_store/commit/2646d79c5cad6f42544aacf53b5aee73218f48a6))

* build: update azure-pipelines.yml for Azure Pipelines ([`c2923c3`](https://github.com/CDPVD/core.dashboards_store/commit/c2923c36387deab9d142cf9b549265ee86970139))

* build: committing on VDC will now push to the sciance repo where tagging happens ;) ([`222b64c`](https://github.com/CDPVD/core.dashboards_store/commit/222b64c139540cd3db59aa771cee5ea5c09d0562))

* build(release): updating the release process ([`8f4c64e`](https://github.com/CDPVD/core.dashboards_store/commit/8f4c64ef12e7a38e392f2a713cd2965463e49eee))

### Chores

* chore: removing dead code ([`6f4b768`](https://github.com/CDPVD/core.dashboards_store/commit/6f4b76829df260c4a774dc8e235dc782518c5535))


## v0.5.0 (2023-08-28)

### Bug fixes

* fix: change_dbt_project_name_to_store

> Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
- le seul but de cette PR est de corriger le nom du dbt_project du core de "TBE" à "STORE"

> Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

> Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout bugfix/rename_dbt_project
git pull
cd ../cssvdc.data.store
git checkout develop
git pull
dbt build compile
```

> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

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
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [ ]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [ ]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in the taskboard.

fix :change_dbt_project_name_to_store ([`30a4bdb`](https://github.com/CDPVD/core.dashboards_store/commit/30a4bdb81169e0edff0de351c88bc5abcc894502))

### Build system

* build: pining sr version ([`7f2f78a`](https://github.com/CDPVD/core.dashboards_store/commit/7f2f78a55d96de77265b5341cc86357d150b9d55))

### Features

* feat: add id_eco to population table and add population template

> Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
- ajout du id eco au population et la spine
- ajout de modèles de population dans le dossier analyse

> Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

> Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout feature/modif_spine
git pull
cd ../cssvdc.data.store
git checkout feature/modif_spine
git pull
dbt build
```

> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

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
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [x]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard.

Related work items: #2323 ([`665583b`](https://github.com/CDPVD/core.dashboards_store/commit/665583b7f26b218ff0a4d559b408a2dd21b04635))

* feat: update effectif_css dashboard

# Objectives of the Pull Request ?
> Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
cette à pour but de mettre à jou le tdb d'effectif avec les norme du template qui a été adopter.
# What is left out of the Pull Request ?
> Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

# How to run the pull request ?
> Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store and the <cssXX>.data.store folder.
# Update the code
cd core.data.store
git checkout feature/maj_tplt_effectf
git pull
# Might be required if you update either the poetry file or the lock file
# poetry shell && poetry lock && poetry install
cd ../cssvdc.data.store
git checkout develop
git pull
# Might be required if you add a new DBT dependency
#dbt deps
# Run dbt
dbt build --select tag:effectif_css
```

# Pull request's checklist
> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

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
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [x]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard.

Related work items: #2291 ([`088007f`](https://github.com/CDPVD/core.dashboards_store/commit/088007fb4dcf1ca2217b5b8ee9aa9f2c37766e65))

* feat: add id_eco to population table and add population template

> Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
- ajout du id eco au population et la spine
- ajout de modèles de population dans le dossier analyse

> Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

> Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout feature/modif_spine
git pull
cd ../cssvdc.data.store
git checkout feature/modif_spine
git pull
dbt build
```

> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

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
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [x]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard.

Related work items: #2323 ([`1d982da`](https://github.com/CDPVD/core.dashboards_store/commit/1d982dabfa76d990ec33a0d9c905ed347e8f809d))

### Refactoring

* refactor: update effectif_css dashboard to match the template

> Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?
cette à pour but de mettre à jou le tdb d'effectif avec les norme du template qui a été adopter.
> Describe what is not included in the pull request. Why did you not include it in the PR. What are the next steps ?

> Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.store
git checkout feature/maj_tplt_effectf
git pull
cd ../cssvdc.data.store
git checkout develop
git pull
dbt build --select tag:effectif_css
```

> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

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
  * [x]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [x]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My work item has been moved to `review` in the taskboard.

Related work items: #2291 ([`91de6a4`](https://github.com/CDPVD/core.dashboards_store/commit/91de6a4fa5131b5aa6dd390d724048a7c6e38cac))


## v0.3.2 (2023-06-26)

### Bug fixes

* fix: casting the timeout as integer to allow for string like definition in the inherited dags ([`987b90a`](https://github.com/CDPVD/core.dashboards_store/commit/987b90afa242e9a3d346edfd848b385ad635596a))


## v0.3.1 (2023-06-08)

### Bug fixes

* fix: typo in doc ([`512903f`](https://github.com/CDPVD/core.dashboards_store/commit/512903f1d4b24b8771e26f051cf88efd6c885dbb))

* fix: the macro no properly delete the schema and the views ([`71ec6a1`](https://github.com/CDPVD/core.dashboards_store/commit/71ec6a187a03e374c2e31d4a3bdc9d8b8b67f9b8))

* fix(suivi_resultat): correcting seeds' friendly name and mandatory courses

> describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
cette PR a pour but de corriger le nom des épreuves et de les rendre compréhensibles

> Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/subj_name
git pull
cd ../cssvdc.data.tbe
git checkout develop
git pull
dbt build --select tag:res_epreuves
```

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

* **Code** :
  * [x] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [ ]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`
  * [x]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [x]  I have added my CSS lead as a reviewer.
  * [x]  My pull request is documented.
  * [x]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [x] My work item is linked to the pull request.
  * [x] My workw item has been moved to `review` in the taskboard.

Related work items: #2219 ([`aa80750`](https://github.com/CDPVD/core.dashboards_store/commit/aa807507cdbf878b5bc16fb51a7e0107c2b2701d))

* fix: remove blank results and correct subject evaluation code

> describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
Cette PR a pour objectif de régler le problème des doublons qui proviennent de la table des résultats ministérielles de Jade. elle corrige aussi des typos dans les codes des matières des épreuves

> Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout bugfix/doublons_res_epr
git pull
cd ../cssvdc.data.tbe
git checkout develop
git pull
dbt build --select tag:res_epreuves
```

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

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

Related work items: #2014 ([`de87bc1`](https://github.com/CDPVD/core.dashboards_store/commit/de87bc13bb3b79917d77760f0249b9362358b24d))

### Build system

* build: casting the timeout as integer to allow for string like definition in the inherited dags ([`2f99f7f`](https://github.com/CDPVD/core.dashboards_store/commit/2f99f7f88374032484b746d86750dcd7fd8b49c7))

* build: updating version REGEX ([`e48cb4a`](https://github.com/CDPVD/core.dashboards_store/commit/e48cb4ae32652cf67c03cf82b27e8b17cf95b00d))

* build: dumping json to keep header properly setted ([`bad9a83`](https://github.com/CDPVD/core.dashboards_store/commit/bad9a83ed2dfc4551e493f2acb27347556cf5bf3))

* build: payalod is now a dictionary to be serialized ([`86806d7`](https://github.com/CDPVD/core.dashboards_store/commit/86806d7be75d8747a531e9418f4f7c87ab6f664c))

* build: adding etl_profile ([`0318e2f`](https://github.com/CDPVD/core.dashboards_store/commit/0318e2f8ddbc63386862631d9c2641ec3af73f75))

* build: forcing the use of the etl_profile to make the etl profile invariant ([`6970c3a`](https://github.com/CDPVD/core.dashboards_store/commit/6970c3a3e543386aa866e374275ace350f4471b5))

* build: adding notification to the DBT failure ([`a133b6c`](https://github.com/CDPVD/core.dashboards_store/commit/a133b6c4dffa84c3042febc18fd952ac1c5bc7d4))

* build: including the manifest in the dag folder ([`f88ecae`](https://github.com/CDPVD/core.dashboards_store/commit/f88ecaef65b82374959120a557eb15a7cabdce19))

* build: unesting deployment folder ([`5451735`](https://github.com/CDPVD/core.dashboards_store/commit/5451735fbb196e4b096f7fae2bd58ec55a8b0585))

* build: adding support for variable docker host ([`6ebbaa3`](https://github.com/CDPVD/core.dashboards_store/commit/6ebbaa33d3f6e15861d0730192b14daddcc382cd))

* build: reducing the exported files ([`38cf61b`](https://github.com/CDPVD/core.dashboards_store/commit/38cf61bcdf31d5c35230ac0278f1cf938f3814a7))

* build: add profiles and dag file to the image ([`561ef91`](https://github.com/CDPVD/core.dashboards_store/commit/561ef91313980b92d2bdcfd150082e0a259b5862))

### Chores

* chore: updating PR template ([`1abf722`](https://github.com/CDPVD/core.dashboards_store/commit/1abf722c9adc2b84a3e1f9f8acb638fd4201c6b8))

* chore: adding item to the pull request template ([`68b6eee`](https://github.com/CDPVD/core.dashboards_store/commit/68b6eeed603b2b66b0edd10616417d17820d7388))

### Documentation

* docs: fixing typo in the gpi's database name ([`02ae6f7`](https://github.com/CDPVD/core.dashboards_store/commit/02ae6f75b3c1898d316e8745c40012eeb06496dc))

### Features

* feat: adding a cookiecutter template to help greenfield CSS bootstraping the cssXX.data.store

# Objectives of the Pull Request ?
> Describe the high level purpose of your pull request. What are you trying to achieve ? How are you doing it ?

* The PR adds a cookie cutter template helping new CSS to scaffold the store.
* The template basically populate a folder with a pre-filled `dbt_project.yaml`, a `profiles.yml` file and a github pipelines already configured

# How to run the pull request ?
> Provide the code required to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
# Assuming you are in a folder containing both the core.data.store.
# Update the code
cd core.data.store
git checkout feature/cookiecutter
git pull

poetry shell && poetry lock && poetry install
cd ../

cookiecutter core.data.store/template/

# Enter some dummy vars when prompted for

cd ../

# Check if the you project as been properly scaffolded
ls -l
```

# Pull request's checklist
> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in the taskboard. ([`6d823bd`](https://github.com/CDPVD/core.dashboards_store/commit/6d823bd13476eb46c9bf6874bcce0f09f283d695))

* feat: adding the chronic_absenteeism dashboard

# Objectives of the Pull Request?
* This PR introduces a new dashboard to monitor the chronic absenteeism among students. Chronic absenteeism is defined as a pattern of absence of some sort. The dashboard helps SÉ department monitoring and assess the situation.
* The PR create a new table in the `mart` : `fact_absences_sequence` listing all the absences sequences for the students.
* The dashboard uses the new population mechanism.

# What is left out of the Pull Request ?
* As there was not prototyping phase for this dashboard, some cosmetic / filtering adjustments will have to be made once this dashboard is presented to the clients.

# How to run the pull request ?
You will need a repo with the population tables ... populated. A companion branch has been created on the CSSVDC repo to help you review this PR. The companion branch's name is `feature/absenteism`. (yes, with  a typo -_-)

```bash
# Assuming you are in a folder containing both the core.data.tbe and the <cssXX>.data.tbe folder, where <cssXX> being either CSSVDC or your own repo with a `feature/absenteism` population-enabled branch.

cd core.data.tbe
git checkout feature/absenteeism
git pull
cd ../<cssXX>.data.tbe
git checkout feature/absenteism
git pull
dbt run-operation drop_schema
dbt build --select +tag:chronic_absenteeism
```

# Pull request's checklist
> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in the taskboard. ([`cf8c809`](https://github.com/CDPVD/core.dashboards_store/commit/cf8c8092aa97f469dbf629a7d8ce0730a732fe54))

* feat: adding the stamping mechanism to expose the data freshness in the dashboards ([`27f1cb7`](https://github.com/CDPVD/core.dashboards_store/commit/27f1cb768ee8904cafe4ff56ba48f3b875cc6b80))

* feat: adding the stamper ([`7b01a24`](https://github.com/CDPVD/core.dashboards_store/commit/7b01a241e9fd15449cc3394b158ec3af913c7055))

* feat: adding the retirement dashboard. This dashboard monitors the number of retired employees in the past 10 years and provides forecasts for up to 5 years.

# Objectives of the pull request
* This PR adds a new dashboard monitoring the retirement situation.
* A `fact_retirement` and a `fact_active` tables, used as a backbone for the report are introduced in the `human_resources` mart.
* A `fact_retirement_forecasts` is added to the mart as it could be reused in a more strategical dashboard.
* A new seed, `int_sequence_0_to_1000` is introduced. This seed can be cause to generate integer sequences.

# What is left out of the pull request
* Due to the summer break, the human resources' product owner (@<melanie.ranger> ) hasn't review the dashboard yet. The wording of the dashboard, as well as some cosmetics adjustments following Mélanie's review will be done in an other pull request.

# How to run the pull request ?

You will need a working development branch with the `human resources` mart enabled and seeds populated as per the `core.develop` branch requirements.
For the **cssvt**, a companion branch (*feature/retirement*) has been created to run and review the pull request.

```bash
# Assuming you are in a folder containing both the core.data.tbe and the <cssXX>.data.tbe folder.
# Update the code
cd core.data.tbe
git checkout feature/retirement
git pull
cd ../cssvt.data.tbe
git checkout feature/retirement
git pull

dbt build --select +tag:retirement
```

# Pull request's checklist
> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My workw item has been moved to `review` in the taskboard. ([`34a32ca`](https://github.com/CDPVD/core.dashboards_store/commit/34a32ca26c5095f2b383c4fa761d0ff30845023e))

* feat: adding hooks for implementing custom populations

# Objectives of the pull request

This PR adds an overridable placeholder, acting as an entry point to add custom populations. The placeholders is designed to be overrided in the `cssXX.data.tbe`.

# How to run the pull request ?
> By default the custom populations are empty.

```bash
# Assuming you are in a folder containing both the core.data.tbe and the <cssXX>.data.tbe folder.
# Update the code
cd core.data.tbe
git checkout feature/customPopulations
git pull
cd ../<cssXX>.data.tbe
dbt build --select +custom_fgj_populations
```

# Pull request's checklist

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X} My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My workw item has been moved to `review` in the taskboard.

feat: adding hooks for implementing custom populations ([`966e55d`](https://github.com/CDPVD/core.dashboards_store/commit/966e55d5c5ab4d08dd199a498c339e67fb8d4a02))

* feat: adding fact_permanent_employe

> describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

Le but principal de cette requête est d'aller chercher l'état de permanence.

Dans cet PR nous considérons que pour avoir une permanence, il faut avoir travailler une période de deux ans, soit à partir de la date de début du poste actuel ou d'un poste dans le même groupe demploi et la date courante et ce sans cessation d'emploi.

Nous sommes conscients qu'il y a une pluralité de définitions sur qu'est-ce que la permanence.

Mais il s'agit d'une définition qui s'applique à tous les CSS

> Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout **feature/rh_permanence**
git pull
Add a CSV named rh_etat_empl here : cssXX/seeds/marts/human_resources/rh_etat_empl.csvcsv
with the content you can find here : https://dev.azure.com/Centre-Expertise-IA/COTRA-CE/_git/core.data.tbe?path=/seeds/marts/human_ressources/schema.yml&version=GBdevelop&_a=contents
cd ../<cssXX>.data.tbe
dbt build --select tag:rh_permanence
```

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [X] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes. **not applicable**
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [ ]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
![pr.jpg](https://dev.azure.com/Centre-Expertise-IA/c2f84ed8-4636-4689-a070-433ecb89a643/_apis/git/repositories/c515b32e-0393-45f8-a0f3-3c2ce78033d2/pullRequests/398/attachments/pr.jpg)
  * [X]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have careful... ([`e30fc89`](https://github.com/CDPVD/core.dashboards_store/commit/e30fc89f5e639934eb198c8782fff7fa8f29beea))

### Refactoring

* refactor: renaming TBE to store, uniformizing code accross dashboards and enforcing conventions

# Objectives of the Pull Request ?
* The previous name of the dbt project : `tbe` (_tableau de bord equilibre_) wasn't making sense. This PR renames the project to `store`.
* The PR cleans the existing code base and improves code consistency across dashboards.
* All dashboards have now their own schema, every single one being prefixed with `dashboard_`
* The `.pbit` files have been plugged into the new schemas
* The deprecated `is_context_core`, an unused varaible has been removed. As a consequence, the `adapt` macro has been removed and every call to this macro has been replaced with the dbt-ic command `{{ source }}`

# What is left out of the Pull Request ?
* The PR does not introduces any changes to the code semantic.

# How to run the pull request ?
__It is advised to rename the folder `core.data.tbe` to `core.data.store` and to update the `<cssXX>.data.tbe/packages.yml` to references `core.data.store`__

__a companion branch (named `uniformization`) has been created in `cssvdc.data.tbe`  to help you review the pull request__

```bash
# Assuming you are in a folder containing both the core.data.tbe and the <cssXX>.data.tbe folder.
# Update the code
cd core.data.tbe # OR core.data.store
git checkout feature/uniformization
git pull
cd ../<cssXX>.data.tbe # OR <cssXX>.data.store
git checkout feature/uniformization
git pull

dbt clean
dbt deps
dbt run-operation drop_schema
dbt build --full-refresh
```

# Pull request's checklist
> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ X I have added DBT tests to my models (at least a `non null` / `unique` per models).
* **Documentation** :
  * [X]  I have updated the documentation (README) accordingly to my changes.
  * [X]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My work item has been moved to `review` in the taskboard. ([`e4110f2`](https://github.com/CDPVD/core.dashboards_store/commit/e4110f2811c7ab4287dc9d7d7ec1ce0f7119b649))

* refactor: moving the prospective dashboards s facts to the prospective dashboard folder

# Objectives of the Pull Request ?
* The PR cleans up the educ_serv mart and move back the prospective related files into the prospective dashboard folders.
* As the `fact_freq_fga` and `fact_freq_fga` are only used by the prospective dashboard, it does not make sense to have those tables in the mart. In addition, and since the introduction of the new mechanism population, base population should be directly computed from the `pop*` table.

# What is left out of the Pull Request ?
* The PR does not refactor the prospective dashboard to use the new population tables. This change should be a part of a more profound refactor of the dashboard.

# How to run the pull request ?
> Running the pull request assumes you have the `prospective_tbe` dashboard enabled and configured as per the documentation.

**You must replace `<cssXX>` with the name of a (your ?) running CSS repo with the prospective dashboard enabled.

```bash
# Assuming you are in a folder containing both the core.data.tbe and the <cssXX>.data.tbe folder.
# Update the code
cd core.data.tbe
git checkout feature/movingToDashboard
git pull
cd ../<cssXX>.data.tbe
git checkout develop
git pull

dbt build --select +tag:prospectif_cdp
```

# Pull request's checklist
> Please, read carefully each item before checking it. Your PR's review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
* **Pull-request** :
  * [X]  I have set the `set-auto-complete` of the PR and **edited the merge commit message to remove the `Merged PR XXX :` so that my merge message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`**
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [X]  My pull request is documented. I have explained the needs for the PR and what was left out of the it.
  * [X]  I have carefully reviewd each changes made to a file and made sure the files included on the PR were actually added on purposes.

# Commits
refactor: moving the prospective dashboards s facts to the prospective dashboard folder ([`476c69b`](https://github.com/CDPVD/core.dashboards_store/commit/476c69b7b9abb63b4efdb5825b46f0456010f4c8))

* refactor: renaming ressources -> resources

* This PR correct a typo in the tags and in the models tree. `human resources`  was incorrectly labelled. The supernumerary `s` has been removed.
* This PR actually introduces a breaking change as all inherited dbt project will have to properly rewrite the path to the resources.

You must have a valid `cssXX.data.tbe/dbt_project.yml` configured to use `human_resources` instead of `human_resources`

```bash
cd core.data.tbe
git checkout feature/typoResources
git pull
cd ../<cssXX>.data.tbe
git checkout develop
git pull
dbt build
```

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

* **Code** :
  * [X] The code I m asking a review for is working. **I understand that my PR will be rejected as-is otherwise.**
  * [] My tables/variables naming follows the conventions described in the `readme.md`.
  * [ ] I have added DBT tests to my models (at least a `non null` / `unique` per model).
* **Documentation** :
  * [ ]  I have updated the documentation (README) accordingly to my changes.
  * [ ]  The models I have added are documented in a `schema.yml` file.
* **Pull-request** :
  * [X]  I have edited the merge commit message to remove the `Merged PR XXX :` so that my message is something like `<feat|fix|chore|doc|refactor|perf|style>: foo bar`
  * [X]  The code *provided to run the pull request* is working. **I understand that my PR will be rejected as-is otherwise.**
  * [ ]  I have added my CSS lead as a reviewer.
  * [X]  My pull request is documented.
  * [X]  I have carefully reviewd each change made to a file and made sure the files included on the PR has been actually changed on purposes.
* **Tasksboard** :
  * [ ] My work item is linked to the pull request.
  * [ ] My workw item has been moved to `review` in the taskboard.

refactor: renaming ressources -> resources ([`48381fe`](https://github.com/CDPVD/core.dashboards_store/commit/48381feeee5b03dac15d6d3f444b0926c4b9fcf4))

* refactor: defaulting docker URL on local socket ([`1f0cb0d`](https://github.com/CDPVD/core.dashboards_store/commit/1f0cb0d92677fb2189ac203cb361a4a5b08ae164))


## v0.3.0 (2023-05-30)

### Bug fixes

* fix: transports tests are now only executed if the transport is available ([`8231318`](https://github.com/CDPVD/core.dashboards_store/commit/8231318591708316e3df2d175ea9b6919a54820a))

* fix: transports tests are now only executed if the transport is available ([`e7c2157`](https://github.com/CDPVD/core.dashboards_store/commit/e7c21572225a214fe6702a7cf14217a15769d412))

* fix: propagating renaming ([`cc9de86`](https://github.com/CDPVD/core.dashboards_store/commit/cc9de86bdb61b77d02c955108f15b472da510a00))

* fix: updating the code-placeholder since the commands in the placeholders were out of order ([`659a75b`](https://github.com/CDPVD/core.dashboards_store/commit/659a75b37419e2ad6dfaaf2377b35d0e30105601))

* fix: correct_error_in_schema ([`831ecad`](https://github.com/CDPVD/core.dashboards_store/commit/831ecad6d37b20098516b9c316afb154b5ad383e))

* fix: adding missing weighting ([`9739c88`](https://github.com/CDPVD/core.dashboards_store/commit/9739c88884affee5006b9bc293163a6c8de5cdfa))

* fix: modification of the 'transport' dashboard schema ([`6984b85`](https://github.com/CDPVD/core.dashboards_store/commit/6984b857dfe97e4ad119050c9326f5c537ec38a8))

* fix: adding missing weighting ([`11bf79f`](https://github.com/CDPVD/core.dashboards_store/commit/11bf79f3cf625f8a00d28ee988812a33bdf777d7))

* fix: add_model_prefix ([`cdabb33`](https://github.com/CDPVD/core.dashboards_store/commit/cdabb33ff4bd9a95c2ae00a77e900e52e562f3df))

* fix: correcti models_name ([`83ca72b`](https://github.com/CDPVD/core.dashboards_store/commit/83ca72b3aff7976c3fb44347b9dc9f7c64a455e2))

* fix: modify_var_naming ([`bb2e1e5`](https://github.com/CDPVD/core.dashboards_store/commit/bb2e1e5cc2247b37fec9581b78313165038a2e6c))

* fix: fixing dbt project ([`5a6a4e6`](https://github.com/CDPVD/core.dashboards_store/commit/5a6a4e63f4bfaa1d9e8f24041dd67bf94f7ed532))

* fix: removing dead code ([`a16cc66`](https://github.com/CDPVD/core.dashboards_store/commit/a16cc660b3750ce603632f01517f1a6968515723))

* fix: add_prefix_to test_name_to_resolve_ambiguity ([`0338c88`](https://github.com/CDPVD/core.dashboards_store/commit/0338c88b01c9eb73cb7007080a469e191e72a75d))

* fix: modify version_from_0_to_2 ([`cc16df3`](https://github.com/CDPVD/core.dashboards_store/commit/cc16df3305e3dca0c29e39827e45bb0e21677ff1))

* fix: updated comments ([`178f319`](https://github.com/CDPVD/core.dashboards_store/commit/178f319bf9b2891e371e6ec9a6cf3485f9c4796e))

* fix: add_prefix_to test_name_to_resolve_ambiguity ([`d8dacaa`](https://github.com/CDPVD/core.dashboards_store/commit/d8dacaa4f4d3d9012ada872f77bcb97d2e9873c4))

* fix: modify version_from_0_to_2 ([`2a99c8e`](https://github.com/CDPVD/core.dashboards_store/commit/2a99c8ed44d896f663a6e56876380f80099cb544))

* fix: delet_conflict_message ([`7c7dc62`](https://github.com/CDPVD/core.dashboards_store/commit/7c7dc62482c64e1ce70ff675b59b9c10f1ad950e))

* fix: updated comments ([`13ce039`](https://github.com/CDPVD/core.dashboards_store/commit/13ce039e786a12ff6667aa65f5c89416fa8c6ccb))

### Build system

* build: adding CICD

build: adding missing workflows folder

build: adding notifcation of failures

build: renaming staging database to staging

build: adding building of master images

feat: adding semantic release

feat: disabling all release ([`51aa803`](https://github.com/CDPVD/core.dashboards_store/commit/51aa80389fe86f0f21c5287c8fb52ca5d355c24d))

* build: adding semantic release ([`5e6c24c`](https://github.com/CDPVD/core.dashboards_store/commit/5e6c24c5bd18f1bd9533db9f81e8963ce36aea59))

* build: adding CICD

build: adding missing workflows folder

build: adding notifcation of failures

build: renaming staging database to staging

build: adding building of master images

feat: adding semantic release

feat: disabling all release ([`d689069`](https://github.com/CDPVD/core.dashboards_store/commit/d689069fcb984a2f68551d9f7bd84d7004baa8c5))

* build: adding semantic release ([`8a80d88`](https://github.com/CDPVD/core.dashboards_store/commit/8a80d8833cbee0e1306447b51b0c2212d7814608))

### Chores

* chore: template typo correction ([`1466eef`](https://github.com/CDPVD/core.dashboards_store/commit/1466eef469bb630ad9d5a59f5482f297f7de7669))

* chore: template typo correction ([`fbc9541`](https://github.com/CDPVD/core.dashboards_store/commit/fbc9541f7e77026a69bcd87f8e2d0b4f6df08f0f))

* chore: adding a pull request template to the repo ([`c84fed3`](https://github.com/CDPVD/core.dashboards_store/commit/c84fed331269e24307f099babc6ec89892e81067))

* chore: empty commit to trigger a revierw from Julie and Nathalie ([`1d1a660`](https://github.com/CDPVD/core.dashboards_store/commit/1d1a660dd6db4ab95cf8441b7fa3316ce38ba951))

* chore: updating dependencies ([`6c1ca12`](https://github.com/CDPVD/core.dashboards_store/commit/6c1ca12227cc817a37455af9fa84251fa47ac23e))

* chore: adjustment of the schema that describes the emp_conge dashboard scripts ([`b8c3981`](https://github.com/CDPVD/core.dashboards_store/commit/b8c39812bd059d765417f8fa7c41c5482723beb1))

* chore: update README part 2 ([`243bca7`](https://github.com/CDPVD/core.dashboards_store/commit/243bca72396eb9c6ab4f4e0971b4224d3c6ad27c))

* chore: management of the centralized schema ([`718b7a4`](https://github.com/CDPVD/core.dashboards_store/commit/718b7a40881700c7144802bb8efd96ad3b813b3e))

* chore: update the README ([`1eb7208`](https://github.com/CDPVD/core.dashboards_store/commit/1eb720861fd881a43f2f5610f3da6d98095d6e8d))

* chore: change the table empcong_fact_emp_conge to fact_emp_conge ([`9952e66`](https://github.com/CDPVD/core.dashboards_store/commit/9952e66a5ba7047615d34f907972f85be865fc0f))

* chore: adjustment of the schema that describes the dashboard scripts prospective_cdp ([`8a5a316`](https://github.com/CDPVD/core.dashboards_store/commit/8a5a3162fa15788d788aaeaa0ee3341ada2bad51))

* chore: adjustment of the schema that describes the emp_conge dashboard scripts ([`0aaf111`](https://github.com/CDPVD/core.dashboards_store/commit/0aaf1112f7a29f86b581b024aced1513efe8c459))

* chore: rename the script stg_parc_activ_10y because it is not used to generate a staging table ([`ee0cf3f`](https://github.com/CDPVD/core.dashboards_store/commit/ee0cf3fc806313d9f74d80e660e8f62a29692f3c))

* chore: modification of the dbt_project so that it respects the conventions of the tbe project ([`ccc203e`](https://github.com/CDPVD/core.dashboards_store/commit/ccc203efb7d8ae6f1e59e759352ce095a0e910b9))

* chore: rename the script stg_parc_activ_10y because it is not used to generate a staging table ([`a7cbebf`](https://github.com/CDPVD/core.dashboards_store/commit/a7cbebfda9c62a02aa865ce8af2e91ec57e79664))

* chore: modif of the stg_parc_activ_10y script so that it respects the conventions of the project ([`97b0fd3`](https://github.com/CDPVD/core.dashboards_store/commit/97b0fd334a3d567a558754952ff1e71e1f7d2ce2))

* chore: adjustment of the schema that describes the interface tables of the geobus database ([`0f17bc9`](https://github.com/CDPVD/core.dashboards_store/commit/0f17bc9f7082b5d2dac4bf5e9570e5f2059ccdc4))

* chore: modification of the i_geobus_parc script so that it respects the conventions of the project (part2). ([`2bfc12d`](https://github.com/CDPVD/core.dashboards_store/commit/2bfc12d644dbdbc94c78a8bbc0ed5a12241e338a))

* chore: adjustment of the schema that describes the interface tables of the piastre database ([`863cccc`](https://github.com/CDPVD/core.dashboards_store/commit/863cccc3ce258c7bd2dc59e4348a232f7cabf74f))

* chore: modification of the i_geobus_parc script so that it respects the project conventions ([`eb0088c`](https://github.com/CDPVD/core.dashboards_store/commit/eb0088c485cacfa71b5e1789bb805c27334c4e6a))

* chore: move the schema of the 'transport' dashboard. 1 schema that centralizes all the information ([`81123d2`](https://github.com/CDPVD/core.dashboards_store/commit/81123d22b133b6139890862735f4ec0f85ee5b04))

* chore: change the project structure (store structure) ([`961bf8c`](https://github.com/CDPVD/core.dashboards_store/commit/961bf8c1f2c340f57f4172cb67ce490485a76f6f))

* chore: put the tests in the macro adapt in comments ([`66f790d`](https://github.com/CDPVD/core.dashboards_store/commit/66f790d004f90313daa492e88338a24d4767eafd))

* chore: update the packages ([`f9c77d5`](https://github.com/CDPVD/core.dashboards_store/commit/f9c77d5e222896f632406b5e892bae2fd53d2322))

* chore: update the sources file ([`4ba22f8`](https://github.com/CDPVD/core.dashboards_store/commit/4ba22f8a127c3f2e87ae6f86c3b9d74317deeabf))

* chore: change the project structure (store structure) ([`c1f2d90`](https://github.com/CDPVD/core.dashboards_store/commit/c1f2d9069f3c0a0764516176f8059f69c507639c))

* chore: put the tests in the macro adapt in comments ([`4f576fd`](https://github.com/CDPVD/core.dashboards_store/commit/4f576fd7767ee6fa7e284bcf744b08b1fc063a46))

* chore: update the packages ([`aa19145`](https://github.com/CDPVD/core.dashboards_store/commit/aa19145099f5c21ebb98c9608466a2cddfc378ee))

* chore: update the sources file ([`a8e09f9`](https://github.com/CDPVD/core.dashboards_store/commit/a8e09f919e85087d87643861fd41755eda231086))

* chore: update of the source file which indicates the adapters ([`140c98d`](https://github.com/CDPVD/core.dashboards_store/commit/140c98d1bd1ce282898b3ed2b0af79656f248c73))

* chore: change the name of the source database ([`8ef893a`](https://github.com/CDPVD/core.dashboards_store/commit/8ef893a92ebe9a3411c83d1c5441a30c90c432b9))

* chore: add schema file for bridges folder ([`bf0f765`](https://github.com/CDPVD/core.dashboards_store/commit/bf0f7659a1eaad9da71d99d12e0ecfca728708ac))

* chore: change keyword pevr by tbe ([`8ba436e`](https://github.com/CDPVD/core.dashboards_store/commit/8ba436e1c2458b46671f39cd24d09a0ebe6c523d))

### Documentation

* docs: fixing various typos in the docs and adding a placeholder for populations ([`27e8ee0`](https://github.com/CDPVD/core.dashboards_store/commit/27e8ee047b5d138343a263f279461b655d46cf0d))

* docs: fixing a typo in the prospectif_cdep interfaces ([`982ab5c`](https://github.com/CDPVD/core.dashboards_store/commit/982ab5cbf455fd496a82c23e19f92a2d5408224f))

### Features

* feat: adding the effectif_css dashboard

> describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

Le but de ce tdb est de faire le dénombrement de la population au sein d'un centre de service scolaire. La population étant séparé en 4 : Prescolaire, primaire régulier, primaire adapté, secondaire régulier et secondaire adapté.

Cette population est divisé selon le niveau scolaire de l'élève également. PRES4ANS, PRES5ANS, 1er année à la 6ème année, puis 1er secondaire au 5ème secondaire.

> Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/effectif_css
git pull
cd ../cssvt.data.tbe
git checkout feature/tdb_effectif
git pull
dbt build --select tag:effectif_css
```

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

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
  * [X] My workw item has been moved to `review` in the taskboard. ([`11f44d5`](https://github.com/CDPVD/core.dashboards_store/commit/11f44d5204857f2a4a21e98fe9d4aa25ef61fd73))

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

Related work items: #1935, #1938, #2003 ([`e3f7ff2`](https://github.com/CDPVD/core.dashboards_store/commit/e3f7ff243d83f2fec0366197b7132fb53bb77349))

* feat: adding the effectif_css dashboard

> describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*

Le but de ce tdb est de faire le dénombrement de la population au sein d'un centre de service scolaire. La population étant séparé en 4 : Prescolaire, primaire régulier, primaire adapté, secondaire régulier et secondaire adapté.

Cette population est divisé selon le niveau scolaire de l'élève également. PRES4ANS, PRES5ANS, 1er année à la 6ème année, puis 1er secondaire au 5ème secondaire.

> Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout feature/effectif_css
git pull
cd ../cssvt.data.tbe
git checkout feature/tdb_effectif
git pull
dbt build --select tag:effectif_css
```

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

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
  * [X] My workw item has been moved to `review` in the taskboard. ([`0f94a10`](https://github.com/CDPVD/core.dashboards_store/commit/0f94a102f887e50b17395787f0e767845b8d3022))

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

Related work items: #1935, #1938, #2003 ([`b69e865`](https://github.com/CDPVD/core.dashboards_store/commit/b69e865c2afab0d52ea7ee410f4815e480ca33ea))

* feat: improvind documentation of the PR template ([`c0c0841`](https://github.com/CDPVD/core.dashboards_store/commit/c0c084146462e3e86f2602a360c631aa478fe983))

* feat: adding drop schema macro ([`e7c30de`](https://github.com/CDPVD/core.dashboards_store/commit/e7c30de1e916150396ccae85554dfce8e9ca47a9))

* feat: adding missing seeds in core_dbt_project ([`3c5ecec`](https://github.com/CDPVD/core.dashboards_store/commit/3c5ecec4b1408884fed580ae6d9e5d2a555d87a2))

* feat: adding MatieresEleve  interfaces ([`b627acd`](https://github.com/CDPVD/core.dashboards_store/commit/b627acd5f881c42ce8d7c98300505c3fb8c17a0a))

* feat: add_masse_sal_to_this_table ([`64649b6`](https://github.com/CDPVD/core.dashboards_store/commit/64649b61681be40ee14b0b52d843b3c04fd61b8e))

* feat: move_table_to_sub_folder_cout_roulement ([`7856608`](https://github.com/CDPVD/core.dashboards_store/commit/7856608825b45c39c459e14a6f719171e31a6aed))

* feat: move_table_to_sub_folder_cout_roulement_and_modify_filter_and_annee_type ([`a7ffeaa`](https://github.com/CDPVD/core.dashboards_store/commit/a7ffeaa7c806bbe05d302e1a7b48ebbaf6f525a4))

* feat: add taux roulement personnel ([`ca56f85`](https://github.com/CDPVD/core.dashboards_store/commit/ca56f85f400867b71defa3bda7ae1d1e08ad2c10))

* feat: modify_filter ([`e13caf8`](https://github.com/CDPVD/core.dashboards_store/commit/e13caf8d7e08629cec44f63593e90c597380fdc7))

* feat: addtable_empl_quitter ([`d97b1b1`](https://github.com/CDPVD/core.dashboards_store/commit/d97b1b1b9df848a9f4483f4ada209dc7d2de1683))

* feat: delet_shema ([`bd9d293`](https://github.com/CDPVD/core.dashboards_store/commit/bd9d293b3f53fc1e2bb7c0cb152ca8fdf97c7847))

* feat: add_schema_to_staging_res_etapes_table ([`6c9f7c5`](https://github.com/CDPVD/core.dashboards_store/commit/6c9f7c5673282817dfa72b78c4e6df392579c9c9))

* feat:  detele_non_used_table ([`2911998`](https://github.com/CDPVD/core.dashboards_store/commit/29119981c5df10a6824d65128fc009703f82c4e2))

* feat: freezing dbt-core and dbt-sql-server to ensure across CSS dependencies consistency ([`dc4e7da`](https://github.com/CDPVD/core.dashboards_store/commit/dc4e7da0c932f0688fcdfe6e74406c6cb8d04ed2))

* feat: add_new_fields_i_e_ri_resultats ([`c577b84`](https://github.com/CDPVD/core.dashboards_store/commit/c577b84757925330fca70f9176b04b234add7de1))

* feat: add_new_vars_to_dbt_project ([`11bdb39`](https://github.com/CDPVD/core.dashboards_store/commit/11bdb39fd2c850f9d550685e2d0faea08b7f8980))

* feat: update_README_with_new_info_for_model_res_etapes ([`3cd96d1`](https://github.com/CDPVD/core.dashboards_store/commit/3cd96d172a31ef7457e4bcb7fbdd5066536a4916))

* feat: add_diff_to_school_table ([`31f943e`](https://github.com/CDPVD/core.dashboards_store/commit/31f943e0750cd0d4633f5c6b609ed8500645f487))

* feat: add_new_table_to _schema ([`c34fad2`](https://github.com/CDPVD/core.dashboards_store/commit/c34fad28abaa803cdaac3534bc1c3b81723060d3))

* feat: add_gouv_evaluation_name _to_seed_table ([`445813d`](https://github.com/CDPVD/core.dashboards_store/commit/445813d3fee3faa4c6c9c77e7a67cbd632b2e41b))

* feat: add_new_interface_table_to_schema ([`fbf0149`](https://github.com/CDPVD/core.dashboards_store/commit/fbf01498ac5decd3240f3235d5da0d99764fae12))

* feat: extract_gouv_rslt_from_interface_table ([`89ae487`](https://github.com/CDPVD/core.dashboards_store/commit/89ae4873d7115429c78bf5909216cd36238e9a32))

* feat: add_dbt_utils_package ([`2338780`](https://github.com/CDPVD/core.dashboards_store/commit/23387805c5af3ae5cd23994ff82091b55d57fd70))

* feat: add_id_friendly_name ([`a7eea47`](https://github.com/CDPVD/core.dashboards_store/commit/a7eea476ea403228bdb3fba25b9fa884f6c8874f))

* feat: add_new_model_emp_cong_to_dbtproject ([`ff11e76`](https://github.com/CDPVD/core.dashboards_store/commit/ff11e76db48b1163e6cba67ad8fac474a1b261fc))

* feat: move_interface_table_cssrepo_to_core_modify_schema.yml ([`84bf8c8`](https://github.com/CDPVD/core.dashboards_store/commit/84bf8c80b822723005b9e5dc59bfa368c796a4f0))

* feat: change in the dbt_project to manually activate the dashboards of interest on the css repo (enable option) ([`9ee5048`](https://github.com/CDPVD/core.dashboards_store/commit/9ee5048b96c2fc0ea17e3e1ac324d2a10396af6a))

* feat: adapt macro test ([`c97cb31`](https://github.com/CDPVD/core.dashboards_store/commit/c97cb31433cd1acd53f8a00224f3eed4019aacd0))

* feat: add a fact table that tracks the number of part-time employees in the last 10 years ([`c0df3ae`](https://github.com/CDPVD/core.dashboards_store/commit/c0df3ae02ec2a266606a789aa68dbaa2ce9c45e7))

* feat: connection of databases: geobus and piastreto obtain data for analyzing school transport  efficiency ([`cb197de`](https://github.com/CDPVD/core.dashboards_store/commit/cb197dec0ebf67c67ca7526ea08577c44c2e3daa))

* feat: add_new_model_emp_cong_to_dbtproject ([`baa58eb`](https://github.com/CDPVD/core.dashboards_store/commit/baa58eb89cc34ca0859480106572050294528944))

* feat: move_interface_table_cssrepo_to_core_modify_schema.yml ([`6edb881`](https://github.com/CDPVD/core.dashboards_store/commit/6edb881d56c8495643e87f2470a1e91953832a08))

* feat: change in the dbt_project to manually activate the dashboards of interest on the css repo (enable option) ([`f8dd5ab`](https://github.com/CDPVD/core.dashboards_store/commit/f8dd5abcfef0573f20632d5fbd2c1086c15b4b99))

* feat: adapt macro test ([`c70431b`](https://github.com/CDPVD/core.dashboards_store/commit/c70431bb84fcbbf2b775b63ddc23c1967f0f672b))

* feat: add a fact table that tracks the number of part-time employees in the last 10 years ([`87c16e2`](https://github.com/CDPVD/core.dashboards_store/commit/87c16e2c05ac4869efc1c08e93925ccf3594d995))

* feat: connection of databases: geobus and piastreto obtain data for analyzing school transport  efficiency ([`4c21bd8`](https://github.com/CDPVD/core.dashboards_store/commit/4c21bd8c6cc509400b1f5ac11eb3b218ac91e218))

* feat: add base_spine table ([`819cf5a`](https://github.com/CDPVD/core.dashboards_store/commit/819cf5ad3ce05b628d5522e363fc874b05a6d608))

* feat: add stg_populations ([`512146d`](https://github.com/CDPVD/core.dashboards_store/commit/512146d40003a8151877c098b9af7ec48097ce05))

* feat: add adapt macro ([`de7b290`](https://github.com/CDPVD/core.dashboards_store/commit/de7b290b3f442025d2823017a738c87096871e2f))

* feat: adding test  in the core repo ([`a4acb2a`](https://github.com/CDPVD/core.dashboards_store/commit/a4acb2a9ab9e16155f780c4caf00b1692918495b))

### Refactoring

* refactor: renaming the prspctf_nb_el_fgj table

> describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
cette PR a pour but de  :
   - changer le nom de la table emp_retraite dans les connection de base de donner dans le PBIT du tdb preospectif
   - modifier le code de la table nb_el_fgj pour matcher le changement de la spine
   - modifier un typo dans le template des PR

> Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

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

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

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

> describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
cette PR a pour but de  :
   - changer le nom de la table emp_retraite dans les connection de base de donner dans le PBIT du tdb preospectif
   - modifier le code de la table nb_el_fgj pour matcher le changement de la spine
   - modifier un typo dans le template des PR

> Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

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

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

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

Related work items: #1889 ([`7cce3bb`](https://github.com/CDPVD/core.dashboards_store/commit/7cce3bb1dc3102d0e887c85140181bf1568c3c2a))

* refactor: prospectif_cdp is now using the rh seed from the RH mart

> describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
- remove prefix from seed name
- delete sources.yml
- add stat_eng to the schema.yml
- modification stat_eng name in fact tables

> Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout bugfix/correct_bug
git pull
cd ../<cssvdc>.data.tbe
git checkout develop
git pull
dbt build --select tag:prospectif_cdp
```

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

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
  * [x] My work item has been moved to `review` in the taskboard. ([`4b3c755`](https://github.com/CDPVD/core.dashboards_store/commit/4b3c755e2d57c4d57a163ae61990277636718a08))

* refactor: prospectif_cdp is now using the rh seed from the RH mart

> describe the high level purposes of your pull request. What are you trying to achieve ? How are you doing it ?*
- remove prefix from seed name
- delete sources.yml
- add stat_eng to the schema.yml
- modification stat_eng name in fact tables

> Provide the code requiered to run the pull request. This is the code that will be used to review your pull request. **The provided code must work as-is. If a DBT error is raised while running the code, the PR will be rejected. The following code / placeholder is only provided as documentation / helper to get you started and you will need to adjust it.**

```bash
cd core.data.tbe
git checkout bugfix/correct_bug
git pull
cd ../<cssvdc>.data.tbe
git checkout develop
git pull
dbt build --select tag:prospectif_cdp
```

> Please, read carefully each item before checking it. You PR's review might be delayed otherwise.

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
  * [x] My work item has been moved to `review` in the taskboard. ([`1416a75`](https://github.com/CDPVD/core.dashboards_store/commit/1416a75459e13f257b61dada9db51d0a390e1bb6))

* refactor: fix the bug introduced earlier ([`5a1b94e`](https://github.com/CDPVD/core.dashboards_store/commit/5a1b94e9cf8cc5544ca7ffc2fb570330b03d2881))

* refactor: test if an error message is sent when dbt test fails ([`b9bd671`](https://github.com/CDPVD/core.dashboards_store/commit/b9bd671a7be4ec9b0444d4b7972ac73558c44783))
