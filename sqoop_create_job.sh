#!/bin/bash

# create sqoop job for oracle table cdr import to hive

sqoop job --create oracle_cdr_import \
--import \
--connect jdbc:oracle:thin:@db.bite.lt:1521:cdr \
--username root \
--table cdr \
--num-mappers 32 \
--target-dir /hadoop/hdfs/oracle
--hive-import \
--create-hive-table \
--hive-table oracle.cdr \
--incremental append \
--check-column "INSERT_TIME"
--last-value "2018-12-10 00:00:00"