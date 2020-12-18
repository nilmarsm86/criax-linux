#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xulrunner
rm -r "$apppath/test/"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py test-source -m TESTRUNNER_ROOT:$plataformpath/../../lib/testrunner
cp $apppath/etc/tpl/test.js $apppath/etc/defaults/preferences/prefs.js
cp $apppath/etc/tpl/test.html $apppath/test/index.html
cp $apppath/etc/tpl/html-tests-source.html $apppath/test/html/tests-source.html
mkdir $apppath/var/profile
mkdir $apppath/var/profile/test
$plataformpath/../../knl/xulrunner/xulrunner --app $apppath/etc/application.ini -profile $apppath/var/profile/test -purgecaches
exit
