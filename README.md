
# Core.store
> Helping students, one dashboard at a time.

## README's readme : read-it before anythinge else

* The `Configurations guidelines` are mandatory to contribute to the Dashboards store.
* Please read the `Contributing guidelines` to ... contribute to the Dashboards store.

**Disclaimer** 
This `README` is not an exhaustive documentation of the various techs underlying the store. The `README` aims at providing general information and assumes the reader has already some common knowledge about computers, computer science and business intelligence. Stuffs like environement variables, terminals, parsing, YAML, SQL, execution plans, indexes, syntax, KPI, relational-algebra, copy-pasting-from-stack overflow (the hallmark of great programmers) are out of this readme scope and assumed to be already known. A list of usefull-ish documentation links is provided as a reference in the next section to help the reader getting started. The reader is encourage to google-up the things he doesn't get a good grasp of, and add them to the documentation \o/.


## Table Of Contents

* [How to find informations in the Readme ?](#finding-missing-informations-from-the-readme)
* [Configuring my computer and repos](#configuration-guidelines)
* [How to DEPLOY an existing dashboard ?](#integrator-guidelines)
* [Which dashboard are available ?](#available-dashboards)
* [How to CREATE a new dashboard ?](#conventions-and-developement-guidelines)


## Finding missing informations from the README
> The store uses a lot of technologies such as DBT, SQL, YAML and the likes. As it would be quite cumberstome to document EVERYTHING about ANYTHING, the reader schould first look for missing information in the following links, each one being a technlogy used as a building block of the store.

* __DBT__ [a tool to run and orchestrate data transformations](https://docs.getdbt.com/docs/introduction)
* __GIT__ [because even if not everyone is building a kernel, a version-manager always comes in handy](https://git-scm.com/)
* __Ubuntu__ [Some good stuffs might come for free ;) ](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview)
* __yaml__ [A human-readable data-serialization language. Like JSON but worst.](https://circleci.com/blog/what-is-yaml-a-beginner-s-guide/?psafe_param=1&utm_source=google&utm_medium=sem&utm_campaign=sem-google-dg--uscan-en-dsa-tROAS-auth-brand&utm_term=g_-_c__dsa_&utm_content=&gclid=CjwKCAjwrpOiBhBVEiwA_473dK-ujEm1G7ONji2IsFzoHdn8liN3nCBMiTl9oL1qPxf759sXoEqdWRoCe-sQAvD_BwE)
* __SQL__ [Structured Query Language. The language used to query the database.](https://www.sqlservertutorial.net/)
* __Python__ [DBT is built in Python, you might want to have a look at it.](https://docs.python.org/3.10/)
* __Poetry__ [but let's face the truth... PIP is garbage. So we ditched it for Poetry](https://python-poetry.org/)

## How to find informations missing from both the README AND the links above ?

* [Desperate times call for desperates measures (but be carefull it's a dangerous place out there).](https://www.google.com/)
  
How to google-up stuff ?
* Ask questions in human language
* Use word like `how to`, `what is`, `why`, `when`, `where` to start your question with :
  * "How to solve a git conflict in VSCODE and Azure DevOps ?" 
  * "Where to store the `dbt_project.yml` file ?"
  * "What is Google used for ?"
* Ask for differences and comparisons : 
  * "How are related `dbt's seeds` to `dbt's models`"
  * "What is the difference between a `dbt_project.yml` and a `profiles.yml`"
* Use the `site:` syntax to restrict your search to a specific website.
  * "What is dbt cloud site:https://stackoverflow.com/"
* Quote the words / sentences "<my keyword or error message>" to look for the exact match. 
  * It's really usefull to search for error messages.

Be brave, try, fail and repeat ! The answer is waiting for you, somewhere out there. May the All-Mighty First-Page-Of-Google always be in your favor !

## How to navigate through the README
The `readme` is organized as follow :
* A first section is to be read by everyone, integrators and contributors, thoose of us crazy enough to want to RUN the ETLs or work-on it !
* A second section is intended for the **integrators** : thoose who deploy the store in their own CSS.
* A third section is targeting the **contributors** : thoose who want to create new dashboards and fight thoose pesky bugs we all stumble on sometimes. That's the heavy stuff ! Sit tight if you go there.
* Finally a FAQ is available at the end of the document.

> Shall we spin that wheel ? : 
> * [No one will ear me scream. Let's configure my machine anyway.](#configuration-guidelines)
> * [I'm an integrator, let's deploy stuff !](#integrator-guidelines)
> * [I'm a developper, "This entire code must be purged !"](#developer-guidelines)
# Configuration guidelines
> AKA : "The heck is a profiles.yml ? "

## A tale of two repos

> Once upon a time, in the CdeP, a little `core.data.store` repo was born. The repo tried very hard to provide ETLs for all the CSS belonging to the CdeP. But the CSS were many and the SQL capabilites to retrofit itself to the CSS's context were few. So the `core.data.store` repo decided to split itself into many little repos, one for each CSS.And the `cssXX.data.store` repo was born. And the `cssXX.data.store` repo was granted the power to override anything from `core.data.store`. And the `core.data.store` repo was happy. And the `cssXX.data.store` repo was happy. And the CdeP was happy. And they all merged develop into master happily ever after. 

The moral of the story is that the `core.data.store` repo is the parent repo of all the `cssXX.data.store` repos. The `core.data.store` repo contains all the ETLs that are common to all the CSS. The `cssXX.data.store` repo contains all the ETLs' code that are specific to the CSS XX. I you have already been exposed to some Object-Oriented Programing, the `core.data.store` repo is the parent class and the `cssXX.data.store` repo is the child class. Yes, that's that simple.

Hence every CSS will end WITH TWO REPOS : 
* `core.data.store` : the parent repo providing sensitive default for all CSS
* `cssXX.data.store` : the child repo containing the ETLs specifics to the CSS XX
  * `XX` schould be replaced with the friendly name of your CSS (ex: cssdgs.data.store for Des-Grandes-Seigneuries)

Thoose two repos are to be cloned in the same directory, the `<working directory>` of your choice. It's actually not mandatory but the `README` expects you to do so, so it might be a good idea to do it if your working with the store for the first time.

## I have cloned `core.data.repo`. It's cute but it's feeling alone : it doen't have any `cssXX.data.store` repo to play with. What schould I do ?

`core.data.repo` is, indeed, a party-animal and strive for company. If you are a **"greenfield"** CSS, you might want to create a new `cssXX.data.store` repo. If you are a **"brownfield"** CSS, you might want to clone an existing `cssXX.data.store` repo. 

__Obviously, if you are a brownfield CSS, I trust you to find the CSSXX.data.store repo and clone it !__

### I'm a greenfield CSS, I want to create a new `cssXX.data.store` repo

We have got you covered, there is `cookiecutter` template ready for you to use.


1. Create a templated repo from the core's template

```bash
# Assuming you are in the <working_directory>, containing the `core.data.store` cloned repo
cd core.data.store
poetry shell & poetry install
cd ../
cookiecutter core.data.store/template/
```

2. Git-init the repo you have just created 

```bash
cd <working_directory>/cssXX.data.store
git init
git remote add origin <your remote's url>
git add .
git commit -m "feat: one commit to initiate them all, one commit to rule them all, one commit to bring them all and in the gitness bind them, in the land of Github where the bugs lie."
git push -u origin master
```

3. Go read the cssXX.data.store/readme to learn more about the post-configurations steps required to have everything owrking

## What you must have already configured by now 
>By convention : 
> * `<foobar>` defines a a placeholder to be replaced. `foobar` is usually pretty self  explanatory and defines the concept to replace the palceholder with.
> * `<working_directory>` is a placeholder to be replaced with the name of the directory containing your two repos.


We assume the reader as already set-up :
* A working computer from the last decade (or a Potato (a Minitel won't work) connected to internet with a screen and a keyboard)
* A working environement with `Python`, `Pyodbc`, `Poetry`, `wsl2` as per the wiki
* The two repositories `core.data.store` and `cssXX.data.store` cloned on his computer in the `<working directory>` of his choice. 
  * The *Tale of two repos* explains why you need two repos : the core is common, the child is specific to your CSS. If you haven't read it yet, do-it ! It's a nice bedtime story.


## Python environement
> All the ETLs are written with **DBT** and within a **Python Poetry** environement.

* Activate an configure the _Poetry_ environement with the following snippet and install the required dependencies

```bash
cd <working_directory>/core.data.store
poetry shell
poetry install
```
## Configuring DBT
* You must have a valid dbt profile WITH THE SAME NAME AS THE ONE USED IN your `<cssXX.data.store>dbt_project.yml` file.

Here is a snippet of a profile to use (all placeholders schould be replaced).

```yaml
cssxx_store:
  target: dev
  outputs:
    dev:
      type: sqlserver
      driver: 'ODBC Driver 17 for SQL Server'
      server: <your server's IP >
      port: <your server's port>
      database: <the database to store the ETLs results into> # Schould be store_dev
      schema: <your name> # Lowercase, not spaces of any sort
      user: <The username to use to connect to the DB>
      password: <The password associated to the user you are connecting to>
      trust_cert: True
```

* Feel free to smoketest your connection with the awsome `dbt debug`

## Executing the ETLs
> Never-ever execute an ETL from the core. That won't work and you will be sad.
> The ETLs schould be executed **from** your **css** package/project. 

**Why schould ETLs being executed from your CSS repo ?**
Remember the *Tale of Two Repos* and how little `cssXX.data.store` was granted the right to override everything ? Well that's it ! Since you are executing the ETLs from `cssXX.data.store` what you are overriding in your CSS WILL HAVE PRIORITY OVER what is defined in `core.data.store` **Including what you are defining in `<working_directory>/cssXX.data.store/dbt_project.yml`**. That's the magic of the `dbt_project.yml` file.

Let's get wild and run the ETL, with the following snippet :

```bash
cd <working_directory>/cssXX.data.store
dbt build --full-refresh
```

*Feel free to read more about the various DBT commands from the DBT website*

# Integrator guidelines
> How to `install` a new dashboard in my CSS ?

## How to enable a dahsboard ?

### `cssXX.data.store/project.yml`
> It's mandatory.

* To enable the ETL for a dahsboard, the integrator schould MINIMALY update it's `cssXX.data.store/project.yml` to trigger the computation of the tables underlying the dashboard the integrator wants to ... integrate.
* To enable a dashboard, the integrator schould set the `enabled` flag to `true` in the `dashboards` section of the `cssXX.data.store/project.yml` file.

```yaml
# cssXX.data.store/project.yml
models:
  store:
    <name of the dashboard to deploy>:
      +enabled: True
```

### Interfaces
> Every time you use a NEW datasource, interfaces schould be configured.
* An ETL transforms crude data into... more data.
* The dashboard might need NEW raw data to be transformed.
* ETLs won't run well if there is no data for them to transform.
* In the `store`, raw datas are accessed through `interfaces`.
* By default, interfaces expects data to be exposed through *linked server*. If your CSS doesn't expose it's data through linked server, you will have to override the interfaces, in your `cssXX.data.store` repo.
* Interfaces are implemented in the `core.data.store` as a basic `SELECT * FROM my_table`.
* Interfaces have for sole purpose to be overrided to fit the way your CSS exposes it's data.


If you are lucky enough to work for a CSS that uses link server, you will just have to toogle the `enabled` flag to `true` in the `interfaces` section of your `cssXX.data.store/project.yml` file.

**How to enable an interface if you are on the lucky side**
Just toogle the `+enabled: True` flag in your `cssXX.data.store/project.yml` file.

```yaml
# cssXX.data.store/project.yml
models:
  store:
    interfaces:  # Active the geobus source
        <name of your interface>:
          +enabled: True
```

**How to enable an interface if you are a black cat !**
If you are short on luck, and work for a CSS that doesn't use linked server, you will have to override the interfaces in your `cssXX.data.store` repo to implement the connection logic to your data sources. But every cloud has a silver lining (yes, even Azure's Cloud) : if you are working on Azure, rest and breathe, we already have the heavy lifting done for you. You will just have to configure the interfaces to use the `Azure SQL external materialization` macro.

Otherwise, you might relay on tools like `Airbyte` to move the data arounds. Keep me posted, I'm curious !

## So we are just throwing around a bunch of `+enabled: True` ? Really ?
> "This is the way !" - The Mandatalorian.

The following snippet schould be enough to enable a dashboard and it's interfaces.
The placeholder `<dashboard name>` schould be replaced by the name of the dashboard you want to enable and the placeholder `<dashboard source name>` schould be replaced by the name of the data source the dashboard depends on.

```yaml
# cssXX.data.store/project.yml
models:
  store:
    dashboards:
      <dashboard name>
        +enabled: True
    interfaces:
      <dashboard data source name>
        +enabled: True
```

### "One does not simply enable a dashboard"
Some dashboards might need extra configuration to be provided through `seeds`. It's a frightening concept, but keep in mind that a `seed` is JUST a `.csv` file you can populate with `Excel` and save into `cssXX.data.store/seeds/<dashboard name>`.

*Please refer to the awsome and always up-to-date dbt documentation to learn about the `Seeds`.*

## Available dashboards
> Show me the money ! Which dashboards are available ?

> This section provides a quick overvierw of each ones of the dashboards available in the store. Please, refers to the next section for more details about the dashboard you are interested in. 

**Click on a dashboard's name to go to it's section.**

| Dashboard 	| Description 	| Owner 	|
|-----------	|-------------	|-------	|
| [prospectif_cdep](#prospectif_cdep)  |  High-level metrics to be looked at by the c-levels	| Mohamed Sadqi (CSSVDC)	| 
| [transport](#transport)  |  Operational dashboard. To track the financial metrics of the school board transportation system	| Maryna Zhuravlova (CSSHR)	|
| [emp_conge](#emp_conge) | Monitor employees absences and leaves 	| Gabriel Thiffault (CSSVT), Frédéryk Busque (CSSVT) |
| [res_epreuves](#res_epreuves) | Track the percentage of success for each one of the mandatory and optional evaluations of the schoold board | Hugo Juhel (ext), Mohamed Sadqi (CSSVDC)	|
| [suivi_resultats](#suivi_resultats) | Track the results of the students with a failed course | Mohamed Sadqi (CSSVDC), Hugo Juhel (ext) |
| [emp_actif](#empl_actif) | List all employees currently enroled in the CSS | (CSSSDGS) Nicolas Pham |
| [effectif_css](#effectif_css) | Track the population count in each school in the CSS | (CSSVT) Frédéryk Busque , Mohamed Sadqi (CSSVDC)
| [retirement](#retirement) | Tracks the number of retired employees by job categories and workplace. Forecast, for up to five years, the number of retiring employees | (Sciance) Hugo Juhel
| [chronic_absenteeism](#chronic_absenteeism) | Display general metrics abunt the student's absenteeism assessed through the number of days with at least one absence for every students. | (Sciance) Hugo Juhel


> The following section describe the specific for each dashboard. Bear with me, we are gonna drill down into the specifics of each dashboard ! Stay focused ! In each of the following section, you will learn how to tame a specific dashboard.

### Transport
> Get operational data about the Transport system of the school board. KPI include the number of circuits per parcours, etc..

| Interfaces  | Marts 	| Marts seeds | Dashboard seeds | Additional config |
|-----------	|-------------	|-------	|-------	| -------	|
| geobus   |  No | No 	| No 	| No 	|

> A `source` must be implemented in your cssXX.data.store repo for the dashboard to work.

#### Populating the `source`
> This dashboard requiers the specification of the source file in your `cssXX.data.store` project.

The source's code must be populated in `cssXX.data.store/models/dashboards/transport/staging/trnsprt_stg_sectors.sql` and as per the definition of the `core.data.store/models/dashboards/transport/adapters.yml` file. Your file must be aliased to `stg_sectors`. Please, add the following config cartouche at the top of your file.

```sql
{{ config(alias='stg_sectors') }}
```

Please refer to the `core.data.store/models/dashboards/transport/adapters.yml`file to get the concrete implementation of the file. Make sure your implementation matches the one described in the file, including for the columns data types. 

#### Dbt project specification
> Update your `cssxx_store/dbt_project.yml` file with the following snippet.

```yaml
models:
  store:
    dashboards:
      transport: # Activate the dashboard
          +enabled: True
    interfaces:  # Active the geobus source
        geobus:
          +enabled: True
```

### Prospectif_cdep

| Interfaces  | Marts 	| Marts seeds | Dashboard seeds | Additional config |
|-----------	|-------------	|-------	|-------	| -------	|
| gpi paie  jade  |  Yes| Yes 	| No 	| No 	|
         

* **Indicateurs** :
  * Pour l'objectif "Attirer et retenir du personnel qualifié et engagé"(C6), l'ICP équivaut au: 
    * Nb d'employés actifs sur un poste régulier dont la date actuelle - date d'entrée en poste > 2 ans / Nb employés actifs  à l'emploi régulier (toute ancienneté confondue). Employé = qui relève des services du centre administratif (hors service à l'élève direct)(ex. : TL : gens qui relèvent du 130) 
  * Pour l'objectif "Planifier la main-d'oeuvre de façon intégrée"(PI7), l'ICP équivaut au: 
    * Ratio du Nb de personnes en âge de départ (55 ans et plus) à la retraite pour les postes permanents / Nb total employés permanents
  * Pour l'objectif "Développer des stratégies de fidélisation innovantes"(AI6), l'ICP équivaut au:
    * 100% - Nb de départ volontaire à partir du 1 juillet à la fin juin (ayant été actif à au moins un moment dans l'année) / Nb d'employés régulier global
  * Pour l'objectif "Diminuer l'impact financier du roulement du personnel"(F7), l'ICP équivaut au: 
    * Nb de dossier ouvert (poste existant)  * Coûts spécifiques à la dotation /  Masse salariale de l'année dernièreNo

* **Calcul des indicateurs** :
  * Pour l'objectif "Attirer et retenir du personnel qualifié et engagé"(C6), le calcul de l'ancienneté a été calculer en additionnant le nombre de jour par période pour chaque employé. Periode = Passage de l'employé de l'état actif à inactif.
    * TODO: Filtrer seulement les employés du centre administratif
  * Pour l'objectif "Développer des stratégies de fidélisation innovantes"(AI6), le calcul de la fidélité prend en compte le nombre d'employé qui quitte volontairement entre le 1er juillet au 30 juin la CSS.
  * Pour l'objectif "Diminuer l'impact financier du roulement du personnel"(F7), l'ICP équivaut au: 
    * Nb d'employés qui ne travaillent plus au CSS par corp d'emploi  * le salaire moyen par corp d'emploi /  Masse salariale de l'année dernière
#### Data dependencies
* **Databases** :
  * paie
  * gpi
  * jade
* **Sources** :
  * *populations* : The dashboard requiers some population tables to be defined in you css-specific repository. Please, refers to `core.store/models/prospectif_cdep/adapters/sources.yml` to get the implementation details.
  * *employees_status* : The dashboard requiers some employees status tables to be defined in you css-specific repository. Please, refers to `core.store/models/prospectif_cdep/adapters/sources.yml` to get the implementation details.
* **Dashboards**  

#### Dbt project specification
> Update your `cssxx_store/dbt_project.yml` file with the following snippet.

```yaml

models:
  store: # Enable the models from the core repo

    marts:
      human_resources:
        +enabled: True
      educ_serv:
        +enabled: True     
    dashboards: 
      prospectif_cdp: # Enable the prospectif_cdep
          +enabled: True
    interfaces: # Both the paie and gpi databases are needed for this dashboard
      paie:
        +enabled: True
      gpi:
        +enabled: True
      jade:
        +enabled: True
```
#### Configuring the population


#### configuration of CSSXX stat_eng.sql seed file 
 >  You must add a CSV named  'stat_eng.csv' file to define the permanent employees selection criterion,  with your CSS 'custom' values. 
```yaml
sources:
  - name: stat_eng
    description: >
      Indicators of the current state of  employee's files. using to determine retirement(empl_retraite)
      etat_stat-  etat_st- filterong for general status groups, where 1 -  on service , 2 - on vacance, 3 - inacif, finished the service.
      For mor ditals read sources.yml in the core models
    config:
      column_types:
        stat_eng: varchar(5)
        stat_dscr: varchar(50)
        is_perm: int
```

### res_epreuves
> Donne un aperçu rapide des résultats des évaluations uniques, obligatoires et locales par le conseil scolaire.

| Interfaces  | Marts 	| Marts seeds | Dashboard seeds | Additional config |
|-----------	|-------------	|-------	|-------	| -------	|
| gpi, jade |  No | No 	| Yes 	| Yes 	|

# Déploiement
:badge[tag:res_epreuves]{type="success"}
:badge[new in v0.7.0]

## Bases de données

Les base de données `gpi` et `jade` doivent être liées au projet. Veuillez consulter  la section [linking a database](/using/configuration/linking) pour plus d’informations sur la façon de lier une base de données.
## Spécification du projet DBT
> Mettez à jour votre fichier `cssXX.dashboards_store/dbt_project.yml` avec l’extrait suivant.

1. Activer les modèles.
```yaml
# cssXX.dashboards_store/dbt_project.yml
models:
  store: # Enable the models from the core repo
    marts:
        educ_serv:
            +enabled: True        
    res_epreuves:
      +enabled: True
    shared:
        interfaces: 
            gpi:
                +enabled: True
            jade:
                +enabled: True                
```  
2. Définir un `cod_css` personnalisé
::alert{type=warning}
cod_css sera utilisé pour filtrer la table de Jade par le code d’organisation afin d’exclure les élèves appartenant à d’autres CSS. Cette variable DOIT être définie pour que le tableau de bord fonctionne correctement. 
::

```yaml
#cssXX.data.dbe/dbt_project.yml
vars:
    # res_epreuves's dashboard variables:
    res_epreuves:
        cod_css: ###% --Les trois premiers chiffres de votre code d’organisation 
```

# configuration 

## Personnalisation des épreuves locales
::alert{type=warning}
La configuration est facultative. Si vous ne fournissez pas de configuration, le tableau de bord utilisera la configuration par défaut
::

> Cette table a besoin de quelques graines :). Assurez-vous d’exécuter `dbt seed --full-refresh` pour peupler les seeds.

* Pour ajouter une liste d'épreuves locales à suivre dans le tableau de bord :
  1. Ajoutez un fichier `.csv` dans votre dossier `cssXX.dashboards_store/seeds/res_epreuves`. Le fichier doit être nommé `rstep_epreuves_personnalisees`. Le fichier doit être rempli avec les colonnes décrites dans `core.dashboards_store/seeds/dashboards/res_epreuves/schema.yml` (qui fait référence à la seed `rstep_epreuves_personnalisees`). 

  2. Déclenchez un rafraîchissement de vos seeds 

```bash
dbt seed --full-refresh
```

::alert{type=info}
Veuillez consulter la section [seeds](/using/marts/seeds) pour plus d’informations sur la manière d’utiliser et de peupler les graines
::
## Ajout des données ministérielles 
::alert{type=warning}
Cette configuration est obligatoire. Si vous ne fournissez les données de charlemagne , la partie des épreuves uniques du tableau de bord n'affichera pas de données.
::
> Cette table a besoin de quelques graines :). Assurez-vous d’exécuter `dbt seed --full-refresh` pour peupler les seeds.

* Pour ajouter les données des épreuves uniques au niveau régional et provincial au  tableau de bord :

  1. Vous avez besoin d'exécuter les rapports Charlemagne `CHS040509R - Statistiques provisoires des résultats d'épreuves uniques` de toutes les sessions pour toutes les années que vous voulez suivre dans le tableau de bord.
  2. Vous devez ensuite les enregistrer dans un seul dossier où il y aurait seulement ces fichiers `XML`.   
  3. Utilisez le fichier `fichier_traitement.xlsm`, qui se trouve dans le dossier (/analyses/dashboards/res_epreuves) afin de consolider les différents fichiers `XML` des différentes sessions en un seul fichier `.csv`.
  4. Enregistrez le fichier consolidé dans le dossier `cssXX.dashboards_store/seeds/res_epreuves` sous le nom `fichier_consolide_epreuves_ministerielles`.
  5. Déclenchez un rafraîchissement de vos seeds.
  6. refaire les étapes pour ajouter les données à chaque session. 

```bash
dbt seed --full-refresh
```

### empl_actif
> This dashboard list the active employees of the CSS. It is used to compute the number of employees in the CSS.
  
| Interfaces  | Marts 	| Marts seeds | Dashboard seeds | Additional config |
|-----------	|-------------	|-------	|-------	| -------	|
| paie |  No | human_resources 	| Yes 	| No 	|

> This dashboard requiers the specification of a seed.

##### Populating the marts seed
> This dashboard requiers the specification of the seeds in the `human_resources` mart.  

The seed must be populated in `cssXX.data.store/seeds/marts/human_resources/` and as per the definition of the `core.data.store/seeds/marts/human_resources/schema.yml` mart. 

Please refer to the `core.data.store/seeds/marts/human_resources/schema.yml` mart documentation to get the concrete implementation.

Do not forget to refresh your seeds with the `dbt seeds --select tag:human_resources --full-refresh` command.

#### Dbt project specification
> Update your `cssxx_store/dbt_project.yml` file with the following snippet.

```yaml
# cssXX/dbt_project.yml
models:
  store: #
    dashboards:
      emp_actif:
        +enabled: True #  Enable the models from the core repo
      interfaces: # Enable the paie interface
          paie:
              +enabled: True
```

##### Using the Report builder: empl_actif.rdl
> An SSRS report is available to export the list of active employees of the CSS. The `emp_actif.rdl` can be found in a `core.data.store/reporting/emp_actif/emp_actif.rdl`

### suivi_resultats
> Monitor the grades of students (s1 to s3) in maths and french . The dashboard displays, for each students currently enrolled in s1 to s3, the history of it's grades for all courses belonging to the same group of courses (maths or french). The dashboard conditionally renders the student status. Only the last grade for a given course code is taken into considerations.

| Interfaces  | Marts 	| Marts seeds | Dashboard seeds | Additional config |
|-----------	|-------------	|-------	|-------	| -------	|
| gpi |  No | No 	| No 	| Yes 	|

#### Dbt project specification
> Update your `cssxx_store/dbt_project.yml` file with the following snippet and add the `cod_css` variable.

1. Enabling the models
```yaml
#cssXX.data.dbe/dbt_project.yml
models: 
  store:
    dashboards: 
      suivi_resultats:
        +enabled: True
    interfaces:
      gpi:
        +enabled: True
```

2. Setting a custom `cod_css`
> cod_css will be used to filter Jade table by the organisation code to exclude student belonging to other CSS. This variable MUST be set for the dashboard to work.

```yaml
#cssXX.data.dbe/dbt_project.yml
vars:
    # res_epreuves's dashboard variables:
    res_epreuves:
        cod_css: ###% --the first 3 digits of your organization code
```

#### Additional configuration
> These steps are optional. 

##### Overriding the default list of tracked courses
> By default, the dashboard will only monitor the courses listed in `core.data.store/seeds/dashboard/suivi_resultats/tracked_courses.csv`

You can provide your own implementation of `tracked_courses`. To do so :
1. Write a CSV file named `tracked_courses` in the `cssXX.data.dbe/seeds/dashboards/suivi_resultats` folder populated as per the `core.data.store/seeds/dashboards/suivi_resultats/schema.yml`'s definition.
2. Disable the default seed by using the the following snippet in your `dbt_project.yml` file : 

```yaml
#cssXX.data.dbe/dbt_project.yml
seeds:
  store:
    dashboards:
      suivi_resultats:
        tracked_courses:
          +enabled: False
```

__When overriding the tracked courses, you might want to override the tracked level as well.__

##### Overriding the default list of tracked levels
> This step is optional. By default, the dashboard will only monitor the students currently enrolled in the livels listed in `core.data.store/seeds/dashboards/suivi_resultats/tracked_level.csv`

You can provide you own list of `tracked_levels`. If, for instance, you add a new tracked course in sec 4, you will want to add the level 4 to the list of tracked levels. To do so, just write a CSV file named `tracked_levels` in the `cssXX/seeds/dashboards/suivi_resultats` folder and disable the default one by adding the following line in your `dbt_project.yml` file.

```yaml
seeds:
  store:
    dashboards:
      suivi_resultats:
        tracked_levels:
          +enabled: False
```

### Emp_conge
> Monitor the leaves of each employee for each related state during a specified timeline. The dashboard display the total amount of each state in each workplace, the total amount of a specific state overall and a historic of each state. 

| Interfaces  | Marts 	| Marts seeds | Dashboard seeds | Additional config |
|-----------	|-------------	|-------	|-------	| -------	|
| paie |  No | human_resources 	| No 	| No 	|

> This dashboard requiers the specification of a seed.

##### Populating the marts seed
> This dashboard requiers the specification of the seeds in the `human_resources` mart.  

The seed must be populated in `cssXX.data.store/seeds/marts/human_resources/` and as per the definition of the `core.data.store/seeds/marts/human_resources/schema.yml` mart. 

Please refer to the `core.data.store/seeds/marts/human_resources/schema.yml` mart documentation to get the concrete implementation.

Do not forget to refresh your seeds with the `dbt seeds --select tag:human_resources --full-refresh` command.

#### Dbt project specification
> Update your `cssxx_store/dbt_project.yml` file with the following snippet

```yaml
# cssXX.data.store/dbt_project.yml
models: 
  store:
    dashboards:
      emp_conge:
        +enabled: true
    interfaces:
      paie:
        +enabled: true
```

### Effectif_css
> Tracks a defined population within a school service centre. The dashboard shows the number of total students in each school

| Interfaces  | Marts 	| Marts seeds     | Dashboard seeds | Additional config |
|-------------|---------|-----------------|-----------------| ------------------|
| gpi         |educ_serv|NO             	| No              | No 	              |

##### Populating the marts
> This dashboard requiers the definition of a specicied population in the `educ_serv` mart.

The marts must be populated in `cssXX.data.store/models/marts/educ_serv/populations/` and as per the definition of the `core.data.store/marts/educ_serv/adapters.yml`.

In order to build your population, you must define for each population the business rules for the previous years, including the current year, and for the forecast year. 

It must be taken into account that the 'Groupe-Repere' data cannot be used for the forecast year as it's not available until the end of the current year. You need to analyze which data you can use to ensure the veracity of the data. We recommend using the 'distribution' data, if possible, for the forecast year.

#### Dbt project specification
> Update your `cssxx_store/dbt_project.yml` file with the following snippet

```yaml
# cssXX.data.store/dbt_project.yml
models: 
  store:
    dashboards:
        effectif_css:
            +enabled: true
    interfaces:
      gpi:
        +enabled: true
```

### Retirement 
> Monitor the number of retired employes for the past 10 years and provide some forecast for the upcoming five years.

| Interfaces  | Marts 	| Marts seeds | Dashboard seeds | Additional config |
|-----------	|-------------	|-------	|-------	| -------	|
| paie |  human_resources | human_resources 	| No 	| No 	|

#### Dbt project specification
> Update your `cssxx_store/dbt_project.yml` file with the following snippet and add the `cod_css` variable.

1. Enabling the models
```yaml
#cssXX.data.dbe/dbt_project.yml
models: 
  store:
    dashboards: 
      retirement:
        +enabled: True
    interfaces:
      paie:
        +enabled: True
```

> This dashboard requiers the specification of the `human_resources` seeds.
### Chronic_absenteeism
> Display general metrics about the student's absenteeism assessed through the number of days with at least one absence for every students. | (Sciance) Hugo Juhel

| Interfaces  | Marts 	| Marts seeds     | Dashboard seeds | Additional config |
|-------------|---------|-----------------|-----------------| ------------------|
| gpi         |educ_serv|NO             	| No              | Yes 	              |

##### Populating the marts
> This dashboard requiers the definition of the specicied population in the `educ_serv` mart. 

The marts must be populated in `cssXX.data.tbe/models/marts/educ_serv/populations/` and as per the definition of the `core.data.tbe/marts/educ_serv/adapters.yml`.

#### Dbt project specification
> Update your `cssxx_tbe/dbt_project.yml` file with the following snippet

```yaml
# cssXX.data.tbe/dbt_project.yml
models:
    tbe:
        marts:
            educ_serv:
                +enabled: True                  
        dashboards:                                   
            chronic_absenteeism:
                +enabled: True
        interfaces:
            gpi:
                +enabled: True
```

#### Additional configuration
> These steps are optional. 

##### Overriding the default list of tracked courses
> By default, the dashboard will group up absences using the brackets from `core.data.tbe/seeds/dashboard/chronic_absenteeism/repartition_brackets.csv`

To get a custom bracketing strategy, you can provide your own implementation of `repartition_brackets`. To do so :
1. Write a CSV file named `repartition_brackets` in the `cssXX.data.dbe/seeds/dashboards/chronic_absenteeism` folder populated as per the `core.data.tbe/seeds/dashboards/chronic_absenteis,/schema.yml`'s definition.
2. Disable the default seed by using the the following snippet in your `dbt_project.yml` file : 

```yaml
#cssXX.data.dbe/dbt_project.yml
seeds:
  tbe:
    dashboards:
      chronic_absenteeism:
        repartition_brackets:
          +enabled: False
```

__When overriding the repartition bracket, you will need to manualy update the `lorenz` measures from the Dahsboard's concentration page.__

# Developer guidelines

## Environment setup
* Use your own schema for developmment, configured through the `profiles.yml` file, so that we won't conflict with each other while working on the same database.
* To ease collaboration, please, use `git flow` to manage your branch and create your features. Try to rebase your branch onto `develop`.

## Installing the `.pre-commit-hooks`
> Pre-commit hooks will help you to keep your code clean and tidy. It will also help you to avoid some common mistakes.

```
cd core.data.store
poetry shell
poetry install 
pre-commit install
```

## Conventions and developement guidelines

### Committing

#### sqlfmt
> We use `sqlfmt` as an SQL formatter. Wheither we love it or not, we have to use it, so everybody code will look the same, making collaboration easier. Some linting rules might be controversial, but at least they are consistent and explicit.

Before committing, make sure to run the following command

```bash
sqlfmt .
```

... You might wan't to rerun a `dbt build` after formatting everything. `sqlfmt` schould'nt break anything, but we are better safe than sorry.

#### Commit message
> Commit messages use the Commitizen convention.

Please, make sure all of your commit messages start with a type. The following types are available :
* `feat` : A new feature
* `fix` : A bug fix
* `docs` : Documentation only changes
* `style` : Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
* `refactor` : A code change that neither fixes a bug nor adds a feature
* `perf` : A code change that improves performance
* `test` : Adding missing or correcting existing tests
* `chore` : Changes to the build process or auxiliary tools and libraries such as documentation generation
* `revert` : Reverts a previous commit

### Folders structure and convention

* All the SQL / Python code live in the `models` folder.
* All dashboards and reports live in the `reporting` folder.

**About the `models` folder**

The `models` folder is organized as follow :

```
.
└── models/
    ├── interfaces/
    │   └── database_spame/
    │       └── mart_foobar 
    ├── marts/
    │   └── mart_foobar 
    └── dashboards/
        ├── spam/
        │   ├── features/
        │   │   └── fact_absences.sql
        │   └── pbi_tables/
        │      └── fact_absences.sql
        └── egg/
            ...
```
Where :
* `dashboards` Each subfolder of `models/dashboards` should be named after the corresponding dashboard it's belongs to (**one dashboard, one folder containing it's SQL code**).
* `interfaces` contains mapping to the interfaces tables. Each interface table can be overrided to add custom connection logic to the undelrying database..
* `marts` contains the ... marts. A `mart` is a collection of tables reused/shared accross between dashboards.

### Integration test and the nightly build
> The nightly build is an automated check on the repo happening at the end (the night ^^) of each day

When introducting a new **NON-OPTIONAL** seed in the `core.data.store` repo, you must add it into `core.data.store/nightly/dbt/seeds` folder, so the next Nightly build won't fail because of a missing seed. The seed must be populated with data from CSSVDC, as the CSSVDC is used as a target database for the integration tests.
You can also run the integration suit locally. Please, refer to the `core.data.store/nightly/README.md` file for more details.

### Marts

#### `educ_serv`
> This mart gather all the data related to the education service.

##### Populations
`Populations` are sets of students used as a filter by various dashboards. __you can refer to analyses/marts/educ_serv/staging/population folder and use the population template to build/define your populations__.

The following populations are mandatory (cf `adatpers`) and schould be defined : 
* `stg_ele_prescolaire`
* `stg_ele_primaire_reg`
* `stg_ele_primaire_adapt`
* `stg_ele_secondaire_reg`
* `stg_ele_secondaire_adapt`

The integrator can add new populations by overrding the `custom_fgj_populations.sql` model. To do so : 
1. Create a new file in `cssXX.data.store/models/marts/educ_serv/staging/populations` named `custom_fgj_populations.sql` 
2. Your `custom_fgj_populations` model schould be implemeted as a union of your own custom populations. 
3. Disable the core's placeholder in the `cssXX.data.store`:

```yaml
# cssXX.data.store/dbt_project.yml

models: 
  store:
    marts:
      educ_serv:
        staging:
          populations:
            custom_fgj_populations:
              +enabled: false
```

__Developers : when creating a new dashboard using the population mechanism, you must register it's tag in the `marts/educ_serv/adapters.yml` file, for it trigger the population computation.__
  
### human resources
> This mart gather all the data related to the human resources departement
> 
##### Populating the marts seed
> This dashboard requiers the specification of the seeds in the `human_resources` mart.  

The seed must be populated in `cssXX.data.store/seeds/marts/human_resources/` and as per the definition of the `core.data.store/seeds/marts/human_resources/schema.yml` mart. 

Please refer to the `core.data.store/seeds/marts/human_resources/schema.yml` mart documentation to get the concrete implementation.

Do not forget to refresh your seeds with the `dbt seeds --select tag:human_resources --full-refresh` command.

### Exposing the freshness of the data into the dashboard
> The `core` provide a mechanism to expose the freshness of the data into the dashboard. This mechanism is call `the stamper` and can be enabled and used through macros.

#### Enabling the `stamper`
> Must be done ONCE in your `cssXX.data.store/dbt_project.yaml`.

The stamper is a table collecting metadata about your ETL's run. To enable the data collection, you first enable it in your `dbt_project.yml` by adding the two following hooks : 

```yaml
# cssXX.data.store/dbt_project.yml
# Hooks
on-run-start:
    - "{{ store.init_metadata_table() }}"
on-run-end:
    - "{{ store.purge_metadata_table() }}"
```

#### `stamping` my new dashboard
> A good practice is to only stamp the reporting tables.

__Only successfull run will be stamped. Meaning that taking the `MIN(run_ended_at)` will give you the last time  your ETL run has been sucessfull. This is the worstcase scenario freshness__

To add a stamp to your dashboard you can either :

* Add the following `post_hook` into your model :
```sql
# model.sql
{{ config(
    post_hook='{{ store.stamp_model("my_dashboard") }}',
) }}
```

* Stamp multiples models at once by adding the hook directrly into the `core/dbt_project`
```yaml
models:
  store:
    dashboards:
      my_dashboard:
        +tags: ["my_dashboard"]
        +schema: dashboard_my_dashboard
        pbi_tables:
          +post_hook: ["{{ store.stamp_model('my_dashboard') }}"]
```

__The second option is to be prefered if all of your report models are under a common folder__

#### Using the `stamper` in your dashboard

In PowerBi, you can easily fetch the last run of your ETL by filtering on the argument provided to the `stamp_model` macro. 


#### Variable conventions
* Don't use spaces in your variables names
* Please, stick to a _snake_case_ naming convention
  * Use the interface tables to set the right names for the variables.
* Reserved keywords schould be written in caps.

#### dbt_project.yaml conventions
> The `dbt_project.yaml` has to be updated every time a new dashboard is added to the store.

* Each dashboard (ie, each subfolder of the `models` folder) schould be given a *tag* and a *schema*. The following exemple shows the minimal lines to add to the `dbt_project.yaml` file to add `dummy_dashboard` to the store. The rational behind this convention is to ease filtering information in either the database or the documentation.


```yaml
models: # Already here, for reference only
  store: # Already here, for reference only
    +enabled: False # Already here, for reference only
    dummy: 
      +tags: ['dummy']
      +schema: 'dummy'
```
### Naming conventions
* use _snake_case_ to names your variables.

#### Table conventions
* Use _snake_case_ naming conventions.
* Use a **prefix** to indicates the high-level objective of the table. The following table prefixing conventions schould be used.

| Table type | Description                                                                                                                                                                                                                                                                                                         | Prefix  | Exemple              |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------------------- |
| fact       | Contains tables of facts                                                                                                                                                                                                                                                                                            | fact_   | fact_eleve           |
| dimension  | A map between an arbitrary ID and a friendly name                                                                                                                                                                                                                                                                   | dim_    | dim_subject_category |
| bridge     | A mapping of between-systems-primarish-key                                                                                                                                                                                                                                                                          | bridge_ | NA                   |
| base       | A base table is a skeleton table used to build fact tables                                                                                                                                                                                                                                                          | base_   | NA                   |
| staging    | A staging table is a by product of the construction of fact table. <br>The table kind of acts as a fact table, but is not be queried by itself.<br>Staging tables are generally combined together or joined on a base table to create a fact table                                                                  | stg_    | stg_droppers_raw     |
| interface  | The all mighty. Interfaces are tables mapping to the raw data from the operational system. It's basically a select clause followed by a list of the fields used in the downstream tasks. Those tables can be overriden in the inherited package to map the CSS requirements. Please, only add the columns you need. | target_ | target_perseverance  |
| reporting  | Reporting tabel. Used as an eaye-catcher to easily detect the tables we need to plug the dashboard on.                                                                                                                                                                                                              | rprt_   | rprt_emp65_ann_bdgt  |
# How to 

## Between projects conflicting tables names
> Some tables names are quite generic (spine, dim_school) and can be used in various contexts without refering to the same underlying table. To avoid confusion, please, use the following pattern to disambiguate the tables.


##### Exemple
Let's consider the following two dashboards : `employees_absences` and `dummy`.
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


```yaml
models:
  +employees_absences:
    +schema: 'employees_absences'
    +tags: ['employees_absences']
  +dummy:
    +schema: 'dummy'
    +tags: ['dummy']    
```

The two dashboards are using a table named `fact_absences` but the SQL code is not the same, so I do need thoose two tables. Unfortunetely, DBT will raise an error as each name has to be unique.

An easy fix is to rename one of the `fact_absences` tables. Let's say we rename `modesl/dummy/fact_absences` to `dummy_fact_absences`. DBT will now be able to compile the code and any downstream task of the dummy project could refers to the table using `{{ ref('dummy_fact_absence') }}`

This issue with this fix is that DBT will output a `dummy_fact_absences` table in the `dummy` schema. This is redundant, as the conflict happens *between* schemas, and not *within* the `dummy` schema. Fortunately, we can override the outputed name in the SQL code by adding the following line into `dummy_fact_absences.sql`.

```sql
{{ config(alias='fact_absences') }}
```

#### DBT error message
In such case, DBT would output an error message similar to the following one.


```
Compilation Error
  dbt found two models with the name "<foobar>".
  
  Since these resources have the same name, dbt will be unable to find the correct resource
  when looking for ref("foobar").
  
  To fix this, change the name of one of these resources:
  - model.store.removeme (models/prospectif_cdp/features/foobar.sql)
  - model.store.removeme (models/emp_conge/feature/foobar.sql)
```

##### Pattern
> The generic pattern to solve the between-project-conflicting-tables-names issue is the following :

1. Prefix your table with the (unique) friendly name of your dashboard.
   * The friendly name schould be short. Maybe 3-to-10 letters. `dummy` could become `dmy`
2. Add a DBT directive into your table code to output the table under it's original name by setting the alias property
