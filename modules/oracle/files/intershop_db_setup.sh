#!/bin/bash
$?=1
while [ $? -ne 0 ]
do
  /bin/sleep 3
  $ORACLE_HOME/bin/tnsping localhost
done
$ORACLE_HOME/bin/sqlplus system/intershop <<EOF
create user intershop identified by intershop;
grant all privileges to intershop;
create tablespace is_users datafile '/u01/app/oracle/oradata/XE/is_users.dbf' size 1G autoextend on;
create tablespace is_temp datafile '/u01/app/oracle/oradata/XE/is_temp' size 10m autoextend on;
create tablespace is_indx datafile '/u01/app/oracle/oradata/XE/is_indx.dbf' size 10m autoextend on;
create tablespace is_indx_ctx datafile '/u01/app/oracle/oradata/XE/is_indx_ctx.dbf' size 10m autoextend on;
EOF
