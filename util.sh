#!/bin/bash

#filename util.sh
#this file place the func I useed in other script
#useage: put the file on same folder of your script, 
#and add "source ./util.sh" to top of your script


#return value
RC=null

#pad with 0 eg: 10 pad 4 = 0010
#param1, the string need for padding
#param2, the length of output string
pad_whth_0()
{	
	tmp=$1
	
	while [ ${#tmp}  -lt $2 ]
	do
		tmp=0$tmp
	done 
	RC=$tmp
}