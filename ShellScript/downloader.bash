#!/bin/bash

yum install git

mkdir /home/ubc_eece411_3/cronjob

cd /home/ubc_eece411_3/cronjob

git clone git://github.com/Ehsan70/AutonomousRestart.git

cd /home/ubc_eece411_3/cronjob/AutonomousRestart/ShellScript/

echo $1 > /home/ubc_eece411_3/cronjob/AutonomousRestart/ShellScript/hostfile.txt

/home/ubc_eece411_3/cronjob/AutonomousRestart/ShellScript/CronJobSetup.sh
