#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xulrunner

rm -R $apppath/api/
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py api -m APIVIEWER_ROOT:$plataformpath/../../lib/apiviewer
cp $apppath/etc/tpl/api.js $apppath/etc/defaults/preferences/prefs.js
mkdir $apppath/var/profile
mkdir $apppath/var/profile/api
$plataformpath/../../knl/xulrunner/xulrunner --app $apppath/etc/application.ini -profile $apppath/var/profile/api -purgecaches
exit
