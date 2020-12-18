#! /bin/bash

clear

apppath=$1
plataformpath=$2

cd $plataformpath #important only in this type of app
#matar el proceso de xpcshell
cd $apppath/source
$plataformpath/../../knl/xulrunner/run-mozilla.sh $plataformpath/../../knl/xulrunner/xpcshell -w $apppath/source/bootstrap.js

exit
