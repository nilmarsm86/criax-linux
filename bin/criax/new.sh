#! /bin/bash

apptype=$1

APPSETNAME(){
    read -p "Set application name:" appname
    # debo ver que no solo este vacio sino que tampoco sean espacios en blanco
    if [ "$appname" = "" ]; then
        echo "Set application name please!"
        APPSETNAME
    fi
}
APPSETNAME

APPSETPATH(){
    read -p "Set application path:" apppath
    # debo ver que no solo este vacio sino que tampoco sean espacios en blanco
    if [ "$apppath" = "" ]; then
        echo "Set application path please!"
        APPSETPATH
    fi
}
APPSETPATH

CREATE(){
    read -p "Set namespace prefix:" appprefix
    if [ "$appprefix" = "" ]; then
        $PWD/opt/python/bin/pyrun2.7 $PWD/knl/qooxdoo/tool/bin/create-application.py -n $appname -o $apppath -t $apptype -p $PWD/etc/skeleton --cache=$apppath/$appname/var/cache -l $PWD/var/log/log.txt        
    elif [ "$appprefix" != "" ]; then
        $PWD/opt/python/bin/pyrun2.7 $PWD/knl/qooxdoo/tool/bin/create-application.py -n $appname -o $apppath -t $apptype -p $PWD/etc/skeleton --cache=$apppath/$appname/var/cache -s $appprefix.$appname -l $PWD/var/log/log.txt        
    fi    
    # verificar si el directorio existe para si no imprimir error
    chmod 777 -R $apppath/$appname/
    # cd $apppath/$appname/bin
    # exec bash $apppath/$appname/bin/bin.sh
    # exit
    clear
    echo "Application $appname created at $apppath"
}
CREATE
