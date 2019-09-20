#!/bin/bash

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

table="ORDR"
desc_prefix="Order"
array_Objs=('ChartOfAccounts' 'BusinessPartners' 'Banks' 'Items' 'Users' 'Invoices' 'CreditNotes' \
'DeliveryNotes' 'Returns' 'Orders' 'PurchaseInvoices' 'PurchaseCreditNotes' 'PurchaseDeliveryNotes' \
'PurchaseReturns' 'PurchaseOrders' 'Quotations' 'IncomingPayments' 'DepositsService' 'JournalEntries' \
'Contacts' 'VendorPayments' 'ChecksforPayment' 'InventoryGenEntry' 'InventoryGenExit' 'Warehouses' \
'ProductTrees' 'StockTransfer' 'SalesOpportunities' 'Drafts' 'MaterialRevaluation' 'EmployeesInfo' \
'CustomerEquipmentCards' 'ServiceContracts' 'ServiceCalls' 'ProductionOrders' 'InventoryTransferRequest' \
'BlanketAgreementsService' 'ProjectManagementService' 'ReturnRequest' 'GoodsReturnRequest')

for f in ${array_Objs[*]}
do
curl_result=`curl -s -b cookies.txt -c cookies.txt \
-X POST \
  $SL_URL/UserFieldsMD \
  -H 'Accept: */*' \
  -d '{
    "Name": "${desc_prefix}H_${f^^}",
    "Description": "${desc_prefix} ${f}",
    "TableName": "${table}",
    "LinkedSystemObject": "ul${f}"
}'`
if [[ $curl_result =~ 'error' ]]
then 
	echo "error encounter :" $curl_result
else
	echo "add success: ${desc_prefix}H_${f^^}"
fi

done 

