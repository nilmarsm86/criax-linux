#! /bin/bash

clear

apppath=$1
plataformpath=$2

#cd $plataformpath
#matar el proceso de xulrunner
rm -r "$apppath/test/"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py test-source -m TESTRUNNER_ROOT:$plataformpath/../../opt/testrunner
cp $apppath/etc/boot/bootstrap.test.js $apppath/test/bootstrap.js
cd $apppath/test
$plataformpath/../../knl/xulrunner/run-mozilla.sh $plataformpath/../../knl/xulrunner/xpcshell -w $apppath/test/bootstrap.js
exit
