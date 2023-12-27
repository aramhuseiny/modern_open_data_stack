# #!/bin/bash
docker exec -it AdventureWorks2022 /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P 'Apadanadev@1' \
   -Q 'RESTORE DATABASE AdventureWorks2022 FROM DISK = "/mnt/AdventureWorks2022.bak" WITH MOVE "AdventureWorks2022" \
    TO "/var/opt/mssql/data/AdventureWorks2022.mdf", MOVE "AdventureWorks2022_log" \
    TO "/var/opt/mssql/data/AdventureWorks2022_log.ldf"'