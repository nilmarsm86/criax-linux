#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xpcshell
rm "$apppath/Gruntfile.js"
rm "$apppath/package.json"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py source
chmod 777 -R $apppath
cd $apppath/source
$plataformpath/../../knl/xulrunner/run-mozilla.sh $plataformpath/../../knl/xulrunner/xpcshell -w $apppath/source/bootstrap.js
exit
