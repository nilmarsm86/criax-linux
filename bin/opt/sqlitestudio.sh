#! /bin/bash

clear

plataformpath=$1

#matar el proceso de sqlitestudio
exec $plataformpath/../../opt/sqlitestudio/sqlitestudio
exit
