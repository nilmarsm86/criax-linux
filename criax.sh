#! /bin/bash

# criax.sh 
# - gui
# name: appname 
# path: /home/user/proyects

INIT(){
    read -p "criax>" option
    if [ "$option" = "" ]; then
        LISTOPTIONS
    else
        OKTYPE
    fi
}

LISTOPTIONS(){
    echo "CRIAX-SDK"
    echo "List of options:"
    echo "-gui"
    echo "-cli"
    echo "-httpd"
    echo "-mobile"
    INIT
}

OKTYPE(){
    if [ "$option" = "gui" ]; then        
        bash $PWD/bin/criax/new.sh desktop
        exit
    elif [ "$option" = "cli" ]; then        
        bash $PWD/bin/criax/new.sh native
        exit
    elif [ "$option" = "httpd" ]; then        
        bash $PWD/bin/criax/new.sh server
        exit
    elif [ "$option" = "mobile" ]; then        
        bash $PWD/bin/criax/new.sh mobile
        exit        
    fi
    INIT
}

clear
LISTOPTIONS
