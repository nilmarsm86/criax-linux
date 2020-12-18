#! /bin/bash

clear

apppath=$1
plataformpath=$2

cd $plataformpath #important only in this type of app
#matar el proceso de xpcshell
rm -r "$apppath/build/"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py source -m OPTIMIZE:[]
mv $apppath/source/script/$3.js $apppath/source/script/index.sjs
cd $apppath/source
$plataformpath/../../knl/xulrunner/run-mozilla.sh $plataformpath/../../knl/xulrunner/xpcshell -w $apppath/source/bootstrap.js

exit
