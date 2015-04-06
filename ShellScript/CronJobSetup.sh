#!/bin/bash

# This will get the absolut adress of Processhandle script
PH_DIR=`readlink -f ./ProcessHandle.sh`

# This will run every 2 mins
CRON_CMD="*/2 * * * * $PH_DIR >> /DHTlog.txt 2>&1"

# Add the command to a cron file 
echo "$CRON_CMD" > CronJobs.txt

# Load the CronJobs.txt file into the crontab
sudo crontab CronJobs.txt



