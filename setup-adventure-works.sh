# #!/bin/bash
cd docker/mssql
if [ ! -f AdventureWorks2022.bak ]
then
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak
else
    echo "AdventureWorks2022 DB file existes"
fi