#!/bin/bash
# adapted from (http://www.pyrosoft.co.uk/blog/2006/10/18/show-grants-for-all-users-on-mysql/)
mkdir -p mysqlalldump
(
 mysql --batch --skip-column-names -e "SHOW DATABASES;" mysql
) | while read Database
do
  echo "# Dumping $Database to mysqlalldump"
  mysqldump -u root --databases $Database > ./mysqlalldump/$Database.sql
done
