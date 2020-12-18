#! /bin/bash

# borra cache, build, api, test, standalones

clear

apppath=$1
plataformpath=$2

$plataformpath/../../opt/python/bin/pyrun2.7 $apppath/generate.py clean-all
rm -R $apppath/standalone/
rm -R $apppath/var/profile/
mkdir $apppath/var/profile
exit
