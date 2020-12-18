#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xulrunner
rm -r "$apppath/build/"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py update -m OPTIMIZE:[]
cp $apppath/etc/tpl/source.js $apppath/etc/defaults/preferences/prefs.js
$plataformpath/../../knl/xulrunner/xulrunner --app $apppath/etc/application.ini -jsconsole -profile $apppath/var/profile/app -purgecaches
# exportar el log de la consola de error a un archivo
# set XRE_CONSOLE_LOG=%app%\var\log\log.txt
exit
