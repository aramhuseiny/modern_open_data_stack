from airflow.utils.dates import days_ago
from airflow.sensors.external_task_sensor import ExternalTaskSensor
from datetime import datetime
from datetime import timedelta
from airflow import DAG
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator
from airflow.providers.airbyte.sensors.airbyte import AirbyteJobSensor
from airflow_dbt.operators.dbt_operator import DbtRunOperator

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "retries": 1,
    "dir": "/opt/airflow/dbt/test_project",
    "retry_delay": timedelta(minutes=1),
    "start_date": days_ago(1),
    "schedule_interval": "*/5 * * * *",
}

with DAG(
    dag_id="cartelis-test",
    default_args=default_args,
) as dag:

    sync_source_destination = AirbyteTriggerSyncOperator(
        task_id="airflow-airbyte-sync",
        airbyte_conn_id="airflow-airbyte",
        connection_id="ab36289a-adf9-4626-a611-4e395931da38",
    )

    dbt_run = DbtRunOperator(
        task_id="dbt_run",
    )
    sync_source_destination >> dbt_run
