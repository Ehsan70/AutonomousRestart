#!/bin/bash
# This script is ran by the cronjob

#getting the user home directory
HOME_DIR=$( getent passwd "$USER" | cut -d: -f6 )
# HOME_DIR=`eval echo ~$USER`

# This holds where the python script is stored
DIR=/home/ubc_eece411_3/PL/Cogs/all/kvstore/App.py

# I used this just to test 
#DIR_TEST=`readlink -f ../FakeProcess.py`
DIR_TEST="/home/user/Documents/PyCharm/ProcessChecker/FakeProcess.py"
# This is the name of process which we will have an eye on.
#PNAME="kvStore"
PNAME="python"

# ID of the process with the above name 
PID=`pgrep $PNAME`


echo "[BASH] Script is running"

if [ ! -z  "$PID" ]; then 
	echo "[BASH] The pid for specified process $PNAME is $PID  "
	#do nothing
else 
	echo "[BASH] There is no alive process with the name $PNAME."
	python $DIR
fi
