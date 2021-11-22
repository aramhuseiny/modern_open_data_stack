# Cartelis
Cartelis is an operational data & CRM consulting firm. We improve marketing ROI and streamline the customer's digital journey. We work with our clients to first design and implement martech solutions and then help them capitalize on their data to prioritize impactful marketing actions.

# Integration tool based on open-source data management frameworks
Designed to be self-sufficient in a local or remote machine ( limited to Ubuntu 18.04 as of 30/06/2021), this project brings together best-of-breed open-source frameworks in order to provide automated data migration, hosting, and transformation features in a single consolidated and fully customizable tool. Specifically, it currently puts to use:
- Airflow: to orchestrate and automate the entire data pipeline
- Airbyte: to integrate data, relying on a growing set of connectors
- DBT: to transform data hosted in a data warehouse with models based on largely on SQL syntax
- Postgresql: to host and transform data

## Requirements
An objective of this project is to avoid version conflicts due to the rapidly evolving nature of these open-source frameworks, so the tool is designed to rely on specific versions of each software package:
- Airflow:2.1.0
- Airbyte:0.26.4
- DBT:0.19.0
- PostgreSQL:13

## Setup
- Clone the repository
- Enter the repository: `cd data-integration`
- Run `./setup.sh`
Once the build has terminated:
- List the docker containers running: `sudo docker ps`
- Find the container named airflow-worker and run: `sudo docker exec -it <container ID> /bin/bash`
Inside the docker container:
- Check if dbt is installed (not fully working as of 28/07/2021): `dbt --version`
- If an error is returned, run: `pip install dbt==0.19.0`

## Connections
* Airflow webserver UI: localhost:8080
* Airbyte webserver UI: localhost:8000
* Postgresql server: localhost:5400
* Postgresql server: localhost:5399

## Accessing Postgresql from the host machine
- docker exec -it <Postgresql-docker-image-id> psql -U airflow
- Useful commands:
  * `\l` : list databases
  * `\c` <database>: enter database
  * `\dt`: view database relations
  * `TABLE <table_name>`: view table data
  * `SELECT * FROM <table_name>`: view table data


## Manipulating the installation
- Stop and remove containers : `docker-compose down -v` in the docker folder
- Stop containers : `docker-compose stop` in the docker folder
- Run containers : `docker-compose run` in the docker folder
- Stop and delete containers : `docker-compose down --volumes --rmi all`
## Setting up dbt in the container (manually)
- access docker: `sudo docker exec -it <airflow worker> /bin/bash`
- install vim: `apt-get up date` and `apt-get install vim`
- Check which version is installed: `dbt --version`
- Check which dbt python packages are installed: `pip list`, if only is present, install more packages: `pip install dbt`
In the docker folder:
- Create a local dbt project in the dbt folder: `dbt init <project_name>`
- Enter into the dbt project : `cd <project_name>`
- Edit dbt_project.yml file : `vim dbt_project.yml`
- Replace "my_new_project","default", and my_new_project in models by `<project_name>`
- Navigate to `.dbt` folder (`/root/.dbt`) and edit file for a Postgresql connection (host is the host machine IP address, and the port number is 5400)

Ref: https://docs.getdbt.com/reference/warehouse-profiles/postgres-profile

## DAGS
Airflow's purpose in this implementation is to orchestrate Airbyte, DBT, and Postgresql task in order to provide as close to full automation as possible in this data pipeline.

### Airbyte DAGs
DAGS written to run integration tasks between external sources and the local Postgresql server will make use of existing Airbyte operators made available by downloading the `apache-airflow-providers-airbyte` python package.

Airbyte-Airflow connection: set-up in Airflow admin connections with connector as HTTP

The Airbyte task needs to contain the Airbyte connector ID contained in the connector URL.

### Airflow-Airbyte
Connect Airflow to airbyte with a new connectio

### DBT DAGs
While it may be easier to run all DBT models with a single task in a DAG (Directed Acyclic Graph) file, this method runs the risk of performing excessive computational tasks despite a potential lack of updated data and is inflexible when performing debugging operations.

A better way is to create a DAG file capable of parsing the `manifest.json` file and creating individual tasks based on identified nodes which are then run or tested while taking into account potential dependencies.

Ref: https://www.astronomer.io/blog/airflow-dbt-1.
