#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xulrunner

rm -R $apppath/inspector/
#$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py inspector
cp -r $plataformpath/../../lib/inspector/build $apppath/inspector/
cp -r $plataformpath/../../opt/selenium-server $apppath/inspector/selenium-server/
cp $apppath/etc/tpl/inspector.js $apppath/etc/defaults/preferences/prefs.js
cp $apppath/etc/tpl/inspector.html $apppath/inspector/index.html
cp $plataformpath/../../etc/user-extensions.js $apppath/inspector/script/user-extensions.js
mkdir $apppath/var/profile
mkdir $apppath/var/profile/inspector
$plataformpath/../../knl/xulrunner/xulrunner --app $apppath/etc/application.ini -profile $apppath/var/profile/inspector -purgecaches
# exportar el log de la consola de error a un archivo
# set XRE_CONSOLE_LOG=%app%\var\log\log.txt
exit
