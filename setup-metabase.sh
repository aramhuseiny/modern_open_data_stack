#!/bin/bash
docker run -d -p 3000:3000 \
  -e "MB_DB_TYPE=postgres" \
  -e "MB_DB_DBNAME=staging" \
  -e "MB_DB_PORT=45432" \
  -e "MB_DB_USER=staging" \
  -e "MB_DB_PASS=Apadanadev@1" \
  -e "MB_DB_HOST=10.5.0.1" \
  --name metabase metabase/metabase
