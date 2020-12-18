#! /bin/bash

INIT(){
    read -p "${Namespace}>" option
    if [ "$$option" = "" ]; then
        LISTOPTIONS
    else
        OKTYPE
    fi
}

LISTOPTIONS(){
    echo "List of options:"
    echo "-generate"
    echo "-update"
    echo "-run"
    echo "-prebuild"
    echo "-package"
    echo "-api"
    echo "-clean"
    echo "-clear"
    echo "-jsuml"
    echo "-playground"
    echo "-soaclient"
    echo "-sqlitestudio"
    echo "-test"
    echo "-cormxdesktop"
    echo "-translate"
    echo "-library"
    INIT
}

OKTYPE(){
    if [ "$$option" = "generate" ]; then
        exec bash ${ABS_QOOXDOO_PATH}/../../bin/httpd/generate.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH} ${Namespace}
    elif [ "$$option" = "update" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/httpd/update.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH} ${Namespace}
    elif [ "$$option" = "run" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/httpd/run.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH}    
    elif [ "$$option" = "prebuild" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/httpd/prebuild.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH} ${Namespace}
    elif [ "$$option" = "package" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/httpd/package.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH} ${Namespace} 
    elif [ "$$option" = "api" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/api.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "clean" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/clean.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "clear" ]; then
        clear
    elif [ "$$option" = "jsuml" ]; then
        exec ${ABS_QOOXDOO_PATH}/../../knl/xulrunner/xulrunner ${ABS_QOOXDOO_PATH}/../../opt/jsuml/application.ini -profile ${ABS_QOOXDOO_PATH}/../../var/profile/jsuml
    elif [ "$$option" = "playground" ]; then
        exec ${ABS_QOOXDOO_PATH}/../../knl/xulrunner/xulrunner ${ABS_QOOXDOO_PATH}/../../opt/playground/application.ini -profile ${ABS_QOOXDOO_PATH}/../../var/profile/playground
    elif [ "$$option" = "soaclient" ]; then
        exec ${ABS_QOOXDOO_PATH}/../../knl/xulrunner/xulrunner ${ABS_QOOXDOO_PATH}/../../opt/soaclient/application.ini -profile ${ABS_QOOXDOO_PATH}/../../var/profile/soaclient
    elif [ "$$option" = "sqlitestudio" ]; then
        exec ${ABS_QOOXDOO_PATH}/../../opt/sqlitestudio/sqlitestudio
    elif [ "$$option" = "test" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/httpd/test.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "cormxdesktop" ]; then
        exec ${ABS_QOOXDOO_PATH}/../../opt/cormxdesktop/xulrunner/xulrunner ${ABS_QOOXDOO_PATH}/../../opt/cormxdesktop/application.ini -profile ${ABS_QOOXDOO_PATH}/../../var/profile/cormxdesktop
    elif [ "$$option" = "translate" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/translate.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "library" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/library.sh ${USER_APP}/${Namespace} ${ABS_QOOXDOO_PATH} ${Namespace}    
    else
        LISTOPTIONS
    fi
}

#clear
LISTOPTIONS
