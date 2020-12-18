#! /bin/bash

INIT(){
    read -p "${Name}>" option
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
    echo "-inspector"
    echo "-prebuild"
    echo "-package"
    echo "-api"
    echo "-clean"
    echo "-jsuml"
    echo "-playground"
    echo "-soaclient"
    echo "-sqlitestudio"
    echo "-test-cli"
    echo "-test-gui"
    echo "-cormxdesktop"
    echo "-translate"
    echo "-validate"
    echo "-info"
    echo "-white-space"
    echo "-lint"
    echo "-beauty"
    echo "-profiling"
    INIT
}

OKTYPE(){
    if [ "$$option" = "generate" ]; then
        exec bash ${ABS_QOOXDOO_PATH}/../../bin/gui/generate.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "update" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/gui/update.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "run" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/gui/run.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "inspector" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/gui/inspector.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}        
    elif [ "$$option" = "prebuild" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/gui/prebuild.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "package" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/gui/package.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} ${Name} 
    elif [ "$$option" = "api" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/api.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "clean" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/clean.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}
        clear
    elif [ "$$option" = "jsuml" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/opt/opt.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} jsuml
    elif [ "$$option" = "playground" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/opt/opt.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} playground
    elif [ "$$option" = "soaclient" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/opt/opt.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} soaclient
    elif [ "$$option" = "sqlitestudio" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/opt/sqlitestudio.sh ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "test-cli" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/gui/test-cli.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "test-gui" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/gui/test-gui.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}        
    elif [ "$$option" = "cormxdesktop" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/opt/cormxdesktop.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH}
    elif [ "$$option" = "translate" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/original.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} translation
    elif [ "$$option" = "validate" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/original.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} validate
    elif [ "$$option" = "info" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/original.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} info
    elif [ "$$option" = "white-space" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/original.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} white-space
    elif [ "$$option" = "lint" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/original.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} lint
    elif [ "$$option" = "beauty" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/original.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} beauty
    elif [ "$$option" = "profiling" ]; then
        ${ABS_QOOXDOO_PATH}/../../bin/original.sh ${USER_APP}/${Name} ${ABS_QOOXDOO_PATH} profiling     
    else
        LISTOPTIONS
    fi
}

#clear
LISTOPTIONS
