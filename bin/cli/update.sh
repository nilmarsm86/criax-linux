#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xpcshell
rm -r "$apppath/build/"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py source -m OPTIMIZE:[]

cd $apppath/source
$plataformpath/../../knl/xulrunner/run-mozilla.sh $plataformpath/../../knl/xulrunner/xpcshell -w $apppath/source/bootstrap.js
# exportar el log de la consola de error a un archivo
# set XRE_CONSOLE_LOG=%app%\var\log\log.txt
exit
