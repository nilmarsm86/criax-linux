#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xulrunner
rm -r "$apppath/build/"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py prebuild -m OPTIMIZE:[]
cp $apppath/etc/tpl/build.js $apppath/etc/defaults/preferences/prefs.js
$plataformpath/../../knl/xulrunner/xulrunner --app $apppath/etc/application.ini -jsconsole -profile $apppath/var/profile/app -purgecaches
exit
