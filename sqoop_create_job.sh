#!/bin/bash

# create sqoop job for oracle table cdr import to hive

sqoop job --create oracle_cdr_import \
--import \
--connect jdbc:oracle:thin:@db.bite.lt:1521:cdr \
--username root \
--table cdr \
--num-mappers 32 \
--hive-import \
--create-hive-table \
--hive-table oracle.cdr