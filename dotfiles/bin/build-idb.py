import os
import sys
import subprocess
import shutil
import getpass
import logging



def main():
    ida = "C:\\Program Files (x86)\\IDA 6.9\\idaq.exe"
    ida = '/c/Program Files (x86)/IDA 6.9/idaq.exe'

    script = """import _idaapi,time
    print "~"*132
    _ = time.time()
    print "build-idb.sh:waiting for ida's auto-analysis to finish (%s)"% (time.asctime(time.localtime()))
    _idaapi.autoWait()
    print "build-idb.sh:finished in %.3f seconds (%s)"% (time.time()-_, time.asctime(time.localtime()))
    print "~"*132
    _idaapi.save_database(_idaapi.cvar.database_idb, 0)
    _idaapi.qexit(0)
    """

    scriptname = '/tmp/script.py'
    with open(scriptname, 'wb') as f:
        f.write(script)

    logfile = '{}.log'.format(sys.argv[1])
    idb = '{}.idb'.format(sys.argv[1])

    cmd = ['"{}"'.format(ida),
        '-B', 
        '-A', 
        '-S"{}"'.format(scriptname),
        '-c', 
        '-P+', 
        '-L{}'.format(logfile),
        '-o{}'.format(idb), 
        sys.argv[1]]

    print("Building: {}".format(idb))

# Start and wait for build to finish
    proc = subprocess.Popen(' '.join(cmd), shell=True)
    proc.wait()

def save_idadir():
    # IDA doesn't like to build with idascripts. Move it out of the way for now
    username = getpass.getuser()
    idadir = "/c/Users/{}/AppData/Roaming/Hex-Rays/IDA Pro".format(username)
    logging.info("Moving IDA Pro dir for building. Building with idascripts is blah..")
    shutil.move(idadir, idadir+'-buildidb')
    
def restore_idadir():
    # Restore idascripts back
    shutil.rmtree(idadir)
    shutil.move(idadir+'-buildidb', idadir)

if __name__ == '__main__':
    save_idadir()

    try:
        main()
    except KeyboardInterrupt:
        restore_idadir()

    restore_idadir()


