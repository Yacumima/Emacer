#!/usr/bin/python

import os
import shutil

homeDir = os.getenv('HOME')
pwd = os.path.dirname(os.path.realpath(__file__))
dotEmacs = pwd + '/profiles/dotEmacs'

if(not os.path.exists(dotEmacs)):
    print('file:'+dotEmacs+' not exist')
    exit(-1)

if(os.path.exists(homeDir+'/.emacs')):
    print('delete exist file -> ~/.emacs')
    os.remove(homeDir+'/.emacs')    

if(os.path.exists(homeDir+'/.emacs.d')):
    print('delete exist dir -> ~/.emacs.d')
    shutil.rmtree(homeDir+'/.emacs.d')

if(os.path.exists(homeDir+'/emacs.d')):
    print('delete exist dir -> ~/emacs.d')
    shutil.rmtree(homeDir+'/emacs.d')

os.makedirs(homeDir+"/.emacs.d")
if os.system('cp -r ./themes/*  '+homeDir+'/.emacs.d') :
    print('copy theme files failed!')
    exit(-1)

dotFile = open(dotEmacs,'r')

dotContent = ''
try:
    dotContent = dotFile.read()
except IOError:
    print('read file:'+dotEmacs+' exception')
    exit(-1)
finally:
    dotFile.close()

dotContent = '(defconst my-emacser-path \"'+pwd+'\")\n' + dotContent

dotFile = open(homeDir+"/.emacs",'w')

try:
    dotFile.write(dotContent)
except IOError:
    print('create file:~/.emacs failed')
    exit(-1)
finally:
    dotFile.close()


print("\napply success")
    



