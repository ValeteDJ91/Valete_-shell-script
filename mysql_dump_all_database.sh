#!/bin/bash
mkdir -p mysqlalldump
(
 mysql --batch --skip-column-names -e "SHOW DATABASES;" mysql
) | while read Database
do
  echo "# Dumping $Database to mysqlalldump"
  mysqldump -u root --databases $Database > ./mysqlalldump/$Database.sql
done
