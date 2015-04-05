__author__ = 'Ehsan'


import time
import os
import inspect
import sys
from threading import Timer

def main ():
    print ("For testing purposes: Setting up a fake process")
    # Sets the process name to kvStore
    set_proc_name("kvStore")
    # Getting the directory of the script
    dir = get_script_dir()
    print(dir)
    #set the environment variable to script directory
    set_env_variable(value=dir)

    print "env var is "+ str(get_env_variable())
    print (os.environ['PATH'])
    try:
        while True:
            # for every 5 second schedule the func() to be run in the next 5 sec.
            time.sleep(5)
            Timer(5, func, ()).start()
    except KeyboardInterrupt:
        print 'interrupted!'
        return

def func ():
    print ("Time : "+str(time.time()))

"""
Changes the name of the process to the one given to the function. This helps to identify the process.
Note that if the name is not set, the default name would be Python. This is a problem because there could be
    more than one process with python name
"""
def set_proc_name(new_name):
    from ctypes import cdll, byref, create_string_buffer
    libc = cdll.LoadLibrary('libc.so.6')
    buff = create_string_buffer(len(new_name)+1)
    buff.value = new_name
    libc.prctl(15, byref(buff), 0, 0, 0)



"""
gets the current directory of your python code.
"""
def get_path():
    #source: http://stackoverflow.com/questions/3718657/how-to-properly-determine-current-script-directory-in-python
    print os.path.dirname(os.path.abspath(__file__))

"""
gets the current directory of your python code.
"""
def get_script_dir(follow_symlinks=True):
    #source: http://stackoverflow.com/questions/3718657/how-to-properly-determine-current-script-directory-in-python
    if getattr(sys, 'frozen', False): # py2exe, PyInstaller, cx_Freeze
        path = os.path.abspath(sys.executable)
    else:
        path = inspect.getabsfile(get_script_dir)
    if follow_symlinks:
        path = os.path.realpath(path)
    return os.path.dirname(path)

"""
Sets the environment variable of the target node.
The environment variable 'kvStoreDir' will hold the directory where the our python code exists
"""
def set_env_variable(value):
    #source: http://stackoverflow.com/questions/5971312/how-to-set-environment-variables-in-python
    #os.putenv('kvStoreDir', 'Ehsan')
    os.environ['kvStoreDir']='Ehsan'
"""
Gets the environment variable of the target node.
The environment variable 'kvStoreDir' will hold the directory where the our python code exists
"""
def get_env_variable():
    #v = os.getenv('kvStoreDir')
    v = os.environ['kvStoreDir']
    return v


if __name__ == "__main__":

    main()


