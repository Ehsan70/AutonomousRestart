#!/bin/bash

#this holds where the python script is stored
DIR="PL/Cogs/all/kvstore"
# I used this just to test 
DIR_TEST="../FakeProcess.py"

check_python (){
	P_CHECK=`python -V 2>&1`
	if [ ! -z  "$P_CHECK" ]; then 	
		#The python version installed is $P_CHECK
		echo 1	
	else 
		#There is no python installed
		echo 0	
	fi 
}

main (){
	# checking if the first argument contains process name
	if [ ! -z  "$1" ]; then 
		PNAME=$1
		echo "[BASH] The process name is set to  $PNAME"
	else 
		PNAME="kvStore"
		echo "[BASH] The defualt process name '$PNAME' will be used."
	fi

	#Entering the name of process manually 
	#echo -n "Enter the name of process: "
	#read PNAME 


	echo "[BASH] Checking if process $PNAME is alive..."

	PID=`pgrep $PNAME`

	if [ ! -z  "$PID" ]; then 
		echo "[BASH] The pid for specified process $PNAME is $PID  "
		#do nothing
	else 
		echo "[BASH] There is no alive process with the name $PNAME."
		# figure out where the code is placed -> this is not needed anymore
		P_STATUS=$(check_python)

		if [ $P_STATUS == 0 ]; then 
			echo "[BASH] Python is not installed on this machine."
		elif [ $P_STATUS == 1 ]; then
			echo "[BASH] Python is installed on this machine."
			# now that we check if python is installed, run the service
			# the below directory need to be changed to $DIR 
			python $DIR_TEST
		else 
			echo "[BASH] There is somethong wrong with python chekcer function. "	
		fi

	fi

	#echo "[BASH] Press Enter to exit shell."
	#read
}


export -f main

#watch bash -n1 -c check_python
while :; 
do
  echo "$(main)"
  sleep 2; 
done



