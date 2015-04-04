__author__ = 'Ehsan'

import time
import subprocess
from subprocess import check_output


def findProcess( processId ):
    ps= subprocess.Popen("ps -ef | grep "+processId, shell=True, stdout=subprocess.PIPE)
    output = ps.stdout.read()
    ps.stdout.close()
    ps.wait()
    return output
def isProcessRunning( processId):
    output = findProcess( processId )
    #if re.search(processId, output) is None:
     #   return true
    #else:
     #   return False

def get_pidd(name):
    ps= subprocess.Popen("pgrep -l "+name, shell=True)
    output = ps.stdout.read()
    print "output  "+output
    ps.stdout.close()
    ps.wait()
    return output

def get_pid(name):
    return map(int,check_output(["pidof",name]).split())

def main ():
    while True:
        try:
            time.sleep(1)
            pID = get_pidd(name="FakProcess")
            #print pID
        except Exception ,e:
            print e.message
            print("The process was not found ")




if __name__ == "__main__":
    main()