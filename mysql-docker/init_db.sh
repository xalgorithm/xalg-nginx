#!/bin/bash
/usr/bin/mysqld_safe &
sleep 5
shopt -s nullglob
array=(./*.sql)
for i in "${array[@]}"
do
    filename="${i%.*}"
    mysql -u root -e "CREATE DATABASE filename"
    mysql -u root $filename < /tmp/$i
    filename=""
done
