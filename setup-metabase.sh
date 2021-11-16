#!/bin/bash
docker run -d -p 3000:3000 \
  -e "MB_DB_TYPE=postgres" \
  -e "MB_DB_DBNAME=airflow" \
  -e "MB_DB_PORT=5400" \
  -e "MB_DB_USER=airflow" \
  -e "MB_DB_PASS=airflow" \
  -e "MB_DB_HOST=164.90.173.70" \
  --name metabase metabase/metabase
