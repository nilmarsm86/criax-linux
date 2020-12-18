#! /bin/bash

clear

apppath=$1
plataformpath=$2
opttype=$3

#matar el proceso de xulrunner

exec $plataformpath/../../knl/xulrunner/xulrunner --app $plataformpath/../../opt/$opttype/application.ini -profile $plataformpath/../../var/profile/$opttype -purgecaches
exit
