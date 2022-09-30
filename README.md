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








