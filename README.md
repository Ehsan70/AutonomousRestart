# AutonomousRestart
The repository consists of solutions to restart a python script after being shutdown. It will be used in EECE 411 project.   

# Note
Note that the scripting required a lot of testing and therefore most of the files in this repo is for testing. However, the only files needed for EECE 411 projects are: 
- ```./ShellScript/Processhandle.sh```
  - This file detects if the process is running or not. if it is running do nothing, otherwise, start the process.
- ```./ShellScript/CronJobSetup.sh```
  - This file sets up the cronjob, and after that it starts the crond service.

Essentially, these two files should be deployed along with the other files. 
