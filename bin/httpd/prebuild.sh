#! /bin/bash

clear

apppath=$1
plataformpath=$2

cd $plataformpath #important only in this type of app
#matar el proceso de xpcshell
rm -r "$apppath/build/"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py build -m OPTIMIZE:[]
cp $apppath/etc/boot/bootstrap.build.js $apppath/build/bootstrap.js
mv $apppath/build/script/$3.js $apppath/build/script/index.sjs
cp $apppath/etc/bootload.json $apppath/build/bootload.json
cd $apppath/build
$plataformpath/../../knl/xulrunner/run-mozilla.sh $plataformpath/../../knl/xulrunner/xpcshell -w $apppath/build/bootstrap.js
exit
