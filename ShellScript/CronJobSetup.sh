#!/bin/bash

# This will get the absolut adress of Processhandle script
PH_DIR=`readlink -f ./ProcessHandle.sh`

# This will run every 2 mins
CRON_CMD="*/2 * * * * $PH_DIR >> /home/ubc_eece411_3/cronjob/AutonomousRestart/ShellScript/DHTlog.txt 2>&1"

#set the environment variable prior to the cron job running.
#source: http://unix.stackexchange.com/questions/94456/how-to-change-cron-shell-sh-to-bash 
echo "SHELL=/bin/bash" > CronJobs.txt

# Add the command to a cron file 
echo "$CRON_CMD" >> CronJobs.txt

# Load the CronJobs.txt file into the crontab
sudo crontab CronJobs.txt

# start the crond service
sudo /sbin/service crond start

