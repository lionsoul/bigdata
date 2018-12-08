#!/bin/bash

# schedule sqoop job on daily at 0:00  using crontab
# run this script only once to install scheduler

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "00 00 * * * sqoop job --exec oracle_cdr_import" >> mycron
#install new cron file
crontab mycron
rm mycron
