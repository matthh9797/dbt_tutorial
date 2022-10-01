# dbt_tutorial

Tutorial on setting up and developing a DBT (Data Build Tool) project

### Setting up dbt in the cloud shell

You will need to have authentication set up in Github to access the repository from cloud shell. To set up authentication there are two options:

- [Set up a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) 
- [Connect with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

The steps are as follows:

1. Install dbt by running:
```
    pip3 install --user --upgrade dbt-bigquery
```
If you receive a warning message that DBT has not been added to PATH additionally run `export PATH=$PATH:<path in warning message>   # This adds dbt to PATH`
2. Check DBT has installed properly: `dbt --version`
2. Open cloud shell and clone the new repository: `git clone <GITHUB_URL>`
3. Change directory into the dbt tutorial repository: `cd dbt_tutorial`

## Start a new DBT project

To create a new dbt project run the following:

```
dbt init dbt_tutorial
```

DBT will help you interactively fill out the profile.yml for this project which tells DBT how to configure your project. Most of this is self explanotory, note however, the project location will need to be in the US to use the BigQuery public datasets. The final profiles.yml is shown below.

```
dbt_tutorial:
  outputs:
    dev:
      dataset: dbt_tutorial
      job_execution_timeout_seconds: 300
      job_retries: 1
      location: US
      method: oauth
      priority: interactive
      project: <NAME_OF_YOUR_PROJECT>
      threads: 4
      type: bigquery
  target: dev
```

This file is located in a hidden folder `user/.dbt/profiles.yml`. 

## DBT project layout

Note in this section I am using ideas from this great article how to layout DBT projects: [How to structure DBT projects](https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview). I would recommend reading this after this tutorial.

To get started with DBT you can start to build up your models in the `models/` directory. Create 3 new models with a schema.yml file in each:
 - staging: For tidying up datasources (e.g. renaming, simple transformations, filtering)
 - intermediate: For complex transformations (e.g. joins, aggregations)
 - marts: For final tables

Now update the dbt_project.yml. Under models add the default materialization in each section. This tells DBT how SQL scripts in each section will be materialized.

```
models:
  dbt_tutorial:
    staging:
      +materialized: view
    intermediate:
      +materialized: ephemeral
    marts:
      +materialized: table
```

## Staging

Staging is for cleaning up the data sources into a consistent format. You should group logic within here by source (e.g. keep all noaa_tsunami tables in here).



To take a look at the dbt docs run:

```
dbt docs generate
dbt docs serve
```


