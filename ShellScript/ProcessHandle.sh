#!/bin/bash
# This script is ran by the cronjob

# This holds where the python script is stored
DIR="PL/Cogs/all/kvstore"
# I used this just to test 
#DIR_TEST=`readlink -f ../FakeProcess.py`
DIR_TEST="/home/user/Documents/PyCharm/ProcessChecker/FakeProcess.py"
# This is the name of process which we will have an eye on.
PNAME="kvStore"

# ID of the process with the above name 
PID=`pgrep $PNAME`


echo "Script is running"

if [ ! -z  "$PID" ]; then 
	echo "[BASH] The pid for specified process $PNAME is $PID  "
	#do nothing
else 
	echo "[BASH] There is no alive process with the name $PNAME."
	python $DIR_TEST
fi
