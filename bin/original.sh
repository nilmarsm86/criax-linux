#! /bin/bash

clear

apppath=$1
plataformpath=$2
command=$3

$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py $command
chmod 777 -R $apppath
exit
