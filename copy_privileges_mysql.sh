#!/bin/bash
(
 mysql --batch --skip-column-names -e "SELECT user, host FROM user WHERE host = 'localhost'" mysql
) | while read user host
do
  echo "# $user @ $host"
  mysql --batch --skip-column-names -e"SHOW GRANTS FOR '$user'@'$host'" | sed -e 's/localhost/185.142.53.105/g' | while read grants
  do
    mysql --batch --skip-column-names -e"$grants"
  done
done