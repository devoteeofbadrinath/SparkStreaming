CREATE SCHEMA IF NOT EXISTS ${prefix}ods;

CREATE TABLE IF NOT EXISTS ${prefix}ods.STATS_MANAGER (
    AIRFLOW_WORKFLOW_NAME VARCHAR(255) NOT NULL,
    AIRFLOW_TASK_NAME VARCHAR(255),
    CONTROLM_WORKFLOW_NAME VARCHAR(255),
    CONTROLM_PROCESSED_DATE DATE,
    SPARK_CDE_RUN_ID VARCHAR(255),
    TOPIC_NAME VARCHAR(255),
    JSON_DATA VARCHAR(255),
    LOGGED_TIMESTAMP TIMESTAMP NOT NULL,
    CONSTRAINT PK PRIMARY KEY(AIRFLOW_TASK_NAME, LOGGED_TIMESTAMP)
);

CREATE TABLE IF NOT EXISTS ods.STATS_MANAGER (
    AIRFLOW_WORKFLOW_NAME VARCHAR(255) NOT NULL,
    AIRFLOW_TASK_NAME VARCHAR(255),
    CONTROLM_WORKFLOW_NAME VARCHAR(255),
    CONTROLM_PROCESSED_DATE DATE,
    SPARK_CDE_RUN_ID VARCHAR(255),
    TOPIC_NAME VARCHAR(255),
    JSON_DATA VARCHAR(255),
    LOGGED_TIMESTAMP TIMESTAMP NOT NULL,
    CONSTRAINT PK PRIMARY KEY(AIRFLOW_TASK_NAME, LOGGED_TIMESTAMP)
);