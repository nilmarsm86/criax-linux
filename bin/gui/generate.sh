#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xulrunner
rm "$apppath/Gruntfile.js"
rm "$apppath/package.json"
$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py generate
chmod 777 -R $apppath
cp $apppath/etc/tpl/source.js $apppath/etc/defaults/preferences/prefs.js
mkdir $apppath/var/profile
mkdir $apppath/var/profile/app
$plataformpath/../../knl/xulrunner/xulrunner --app $apppath/etc/application.ini -jsconsole -profile $apppath/var/profile/app -purgecaches
exit
