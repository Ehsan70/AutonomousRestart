#!/bin/bash

# -y would ignore all the prompts 
# Source: http://unix.stackexchange.com/questions/84310/how-do-i-force-yum-to-install-without-prompting-the-user-using-bash 
yum -y install git
#[TODO] Need to make it smartter so that in can detect if the folder already exists 
mkdir /home/ubc_eece411_3/cronjob

cd /home/ubc_eece411_3/cronjob

git clone git://github.com/Ehsan70/AutonomousRestart.git

cd /home/ubc_eece411_3/cronjob/AutonomousRestart/ShellScript/

echo $1 > /home/ubc_eece411_3/cronjob/AutonomousRestart/ShellScript/hostfile.txt

/home/ubc_eece411_3/cronjob/AutonomousRestart/ShellScript/CronJobSetup.sh
