#!/bin/bash

sqoop eval --connect jdbc:oracle:thin:@db.bite.lt:1521:cdr \
--username root \
--query "SELECT * FROM cdr FETCH FIRST 10 ROWS ONLY"
