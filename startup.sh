#!/bin/bash

source ./env.sh
 

function stop() {

    echo "stop webclient"
    pkill -f gate.jar
    pkill -f auth.jar
    pkill -f tcli.jar
    pkill -f noti.jar
    pkill -f anly.jar
    pkill -f extn.jar
}


function decyption(){
         local result=$(${JAVA_BIN} -jar ${ENCRYPTION_TOOL} -d $1)
         echo $result

}


rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER)
  #REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

function start(){

    echo "start webclient"

    local sldtoken=$(decyption $ENCYPTION_SLD_TOKEN)
    local sldParameter=$(rawurlencode $sldtoken)
    local httpDecodeParameter='token='${sldParameter}'&id='${WEBCLIENT_COMPONENTID}

    export b1_slds_url=${SLD_ADDRESS}${httpDecodeParameter}
    export WEBCLIENT_TLS_PASSWORD=$(decyption $WEBCLIENT_TLS_PASSWORD_ENCYPTED)

    export b1_tcli_url=http://127.0.0.1:9002
    export b1_anly_url=http://127.0.0.1:9003
    export b1_extn_url=http://127.0.0.1:9004
    export b1_noti_url=http://127.0.0.1:9005
    ${JAVA_BIN}   -jar gate.jar  \
    --server.ssl.enabled=true  \
    --server.ssl.keyStoreType=PKCS12 \
    --server.ssl.key-store=${WEBCLIENT_TLS_KEYSTORE} \
    --server.ssl.key-store-password=${WEBCLIENT_TLS_PASSWORD} \
    --server.ssl.key-alias=${WEBCLIENT_TLS_KEY_ALIAS} \
    --server.port=${WEBCLIENT_PORT} >gate.txt    2>&1 &

    ${JAVAEXE}  -jar auth.jar  >auth.txt 2>&1 &
    ${JAVAEXE}  -jar tcli.jar  >tcli.txt 2>&1 &
    ${JAVAEXE}  -jar noti.jar  >noti.txt 2>&1 &
    ${JAVAEXE}  -jar extn.jar  >extn.txt 2>&1 &
    ${JAVAEXE}  -jar anly.jar  >anly.txt 2>&1 &
}


function restart(){
    stop
    start
}

function help(){
    echo "help document"
    echo "startup.sh start"
    echo "startup.sh stop"
    echo "startup.sh restart"
}


execution=$1

case $execution in
	start)
		start
		;;
	stop)
		stop
		;;
    restart)
        restart
        ;;
	*)
		help
		;;
  esac
