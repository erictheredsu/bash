#!/bin/bash

#this the sample file for sytem environment that webclient depends
#b1_slds_url=https://10.58.114.38:40000?token=9a598ca76b1654d515ec42b99f88a2f5d81f2e2f4726c386e876d2a434198684&database=10.58.114.38:30015

export SLD_ADDRESS=https://10.58.114.38:40000
#export HANADATABASE=10.58.114.143:30015
export SLDTOKEN=9a598ca76b1654d515ec42b99f88a2f5d81f2e2f4726c386e876d2a434198684
export b1_slds_url=${SLD_ADDRESS}?token=${SLDTOKEN}&id=${WEBCLIENT_COMPONENTID}

export WEBCLIENT_TLS_KEYSTORE=webclient.p12
export WEBCLIENT_TLS_PASSWORD="webclient"
export WEBCLIENT_TLS_KEY_ALIAS="webclient"
export WEBCLIENT_PORT=443

export JAVAEXE=/usr/sap/SAPBusinessOne/Common/jre/bin/java 

##later just for test, and later it needs to be delete
#export b1_jdbc_url=jdbc:sap://10.58.114.38:30015/?user=SYSTEM&password=manager







