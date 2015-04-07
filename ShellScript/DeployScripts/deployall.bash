#!/bin/bash


filename="./100hosts.txt"
red='\033[0;31m'
NC='\033[0m' # No Color
#-r     Do not treat a backslash character in any special way. Consider each backslash to be part of the input line. It does not matter in our case
while read line
do
	PL_NODE=$line
	sleep 5
	echo -e "${red}SSHing to $PL_NODE ${NC}"
	#sudo ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no ubc_eece411_3@$PL_NODE "wget https://www.dropbox.com/s/70xebocqw2z7vzc/downloader.bash?dl=0 -O downloader.bash ; chmod +x downloader.bash ; sudo ./downloader.bash hosts.txt"
sshpass -p "eA442366024" ssh -n -l  ubc_eece411_3 -i ~/.ssh/id_rsa  $PL_NODE "wget https://www.dropbox.com/s/70xebocqw2z7vzc/downloader.bash?dl=0 -O downloader.bash ; chmod +x downloader.bash ; sudo ./downloader.bash hosts.txt "
		

done < "$filename"

