#!/bin/bash
if [ -d mysqlalldump ]
then
  (
   ls
  ) | while read File
  do
    echo "# Restoring $File"
  done
else
    echo "No mysqlalldump folder detected"
fi
