#!/usr/local/bin/python3

import os

homeDir = os.getenv('HOME')
pwd = os.path.dirname(os.path.realpath(__file__))

print('apply emacs config...')

if(os.path.exists(homeDir+'/.emacs')):
    print('delete exist file -> ~/.emacs')
    os.remove(homeDir+'/.emacs')    

if(os.path.exists(homeDir+'/.emacs')):
    print('delete exist dir -> ~/.emacs.d')
    os.remove(homeDir+'/.emasc.d')

if(os.path.exists(homeDir+'/emacs.d')):
    print('delete exist dir -> ~/emacs.d')
    os.remove(homeDir+'/emasc.d')

if(not os.path.exists(pwd+'/dotemacs')):
    print('file:'+(pwd+'/dotemacs')+' not exist')
    exit(-1)

    



