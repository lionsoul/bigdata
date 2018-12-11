#!/bin/bash

# create sqoop job for oracle table cdr import to hive
# addressing Oracle specific issues
# Problem: import jobs that are non-incremental are accepted 
# by Data Connector for Oracle and Hadoop

sqoop job \
-Doracle.sessionTimeZone=Europe/Vilnius \
-Doraoop.import.consistent.read=true \
--create oracle_cdr_import \
--import \
--direct \
--connect jdbc:oracle:thin:@//db.bite.lt:1521:cdrSID \
--username root \
-P \
--table cdr \
--num-mappers 32 \
--target-dir /hadoop/hdfs/oracle
--hive-import \
--create-hive-table \
--hive-table oracle.cdr \
--incremental append \
--check-column "INSERT_TIME"
--last-value "2018-12-10 00:00:00"