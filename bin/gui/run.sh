#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xulrunner
$plataformpath/../../knl/xulrunner/xulrunner --app $apppath/etc/application.ini -jsconsole -profile $apppath/var/profile/app -purgecaches
# exportar el log de la consola de error a un archivo
# set XRE_CONSOLE_LOG=%app%\var\log\log.txt
exit
