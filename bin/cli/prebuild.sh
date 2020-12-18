#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xpcshell
rm -r "$apppath/build/"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py build -m OPTIMIZE:[]
cp $apppath/etc/boot/bootstrap.build.js $apppath/build/bootstrap.js
cd $apppath/build
$plataformpath/../../knl/xulrunner/run-mozilla.sh $plataformpath/../../knl/xulrunner/xpcshell -w $apppath/build/bootstrap.js
exit
