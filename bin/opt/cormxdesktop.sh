#! /bin/bash

clear

apppath=$1
plataformpath=$2

#matar el proceso de xulrunner

exec $plataformpath/../../opt/cormxdesktop/xulrunner/xulrunner --app $plataformpath/../../opt/cormxdesktop/application.ini -profile $plataformpath/../../var/profile/cormxdesktop -purgecaches
exit
