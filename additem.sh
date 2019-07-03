#!/bin/bash

source ./util.sh

#this script add UDF to table
#set -x

SL_URL="http://10.193.84.13:50001/b1s/v1"

curl_result=`curl -s -b cookies.txt -c cookies.txt \
-X POST \
  $SL_URL/Login \
  -H 'Postman-Token: 2663f443-f656-4d9b-942a-d72fcae43cbc' \
  -H 'cache-control: no-cache' \
  -d '{
    "CompanyDB": "US_I305582_2906_07_02",
    "UserName": "manager",
    "Password": "manager"
}'`

if [[ $curl_result =~ 'error' ]]
then 
	echo $curl_result
else
	echo "login success"
fi

ITEM_NUMBER=100
ITEM_NAME_PREFIX="item"

for((i=1; i<ITEM_NUMBER;i++))
do
pad_whth_0 $i 4
echo adding i$RC ...
curl_result=`curl -s -b cookies.txt -c cookies.txt \
-X POST \
  $SL_URL/Items \
  -H 'Accept: */*' \
  -d '{
    "ItemCode": "i$RC",
    "ItemName": "${ITEM_NAME_PREFIX}$RC",
    "ItemType": "itItems"
}'`

if [[ $curl_result =~ 'error' ]]
then 
	echo "error encounter :" $curl_result
else
	echo "add success: i$RC"
fi
done 

