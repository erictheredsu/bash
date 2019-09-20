#!/bin/bash

source ./util.sh


echo 1 2 3 \
 4


echo "------------------------for-loop----------------------------------"

file=./auth.txt
if [[ ! -e $file ]]
then
	echo "auth.txt does not exist!"
fi

array_file=('auth.txt' 'gate.txt' 'tcli.txt')

echo "array_file all element :${array_file[*]}"

echo "size of array_file :${#array_file[@]}"

echo

for f in ${array_file[*]}
do
	if [[ -e $f ]]
	then 
		echo "$f exist"
	else
		echo "$f dose not exist"
	fi
done 

echo

for planet in 'Mercury' 'Venus' 'Earth' 'Mars' 'Jupiter' 'Saturn' 'Uranus' 'Neptune' 'Pluto is eleminated'        
do
    echo $planet  
done

echo

array_path=('../java/auth/target/auth-10.00.000-SNAPSHOT.jar' '../java/gate/target/gate-10.00.000-SNAPSHOT.jar' '../java/tcli/tcli-web/target/tcli-web-10.00.000-SNAPSHOT.jar')

for ((i=0;i<${#array_file[@]};++i))
do
	printf "%s is %s\n" ${array_file[i]} ${array_path[i]}
done

echo

declare -A array_filepath

array_filepath[auth]='../java/auth/target/auth-10.00.000-SNAPSHOT.jar'
array_filepath[gate]='../java/gate/target/gate-10.00.000-SNAPSHOT.jar'
array_filepath[tcli]='../java/tcli/tcli-web/target/tcli-web-10.00.000-SNAPSHOT.jar'

for f in "${!array_filepath[@]}"
do
    printf "%s is in %s\n" "$f".txt "${array_filepath[$f]}"
done

echo

echo "------------------------function----------------------------------"

#funciton test
rc=null;
pad0()
{	
	tmp=$1
	
	while [ ${#tmp}  -lt $2 ]
	do
		tmp=0$tmp
	done 
	rc=$tmp
}

# echo "call local func with param"
# pad0 1 4
# echo $rc
# pad0 10 8
# echo $rc

echo "call util.pad_whth_0 func with param"
pad_whth_0 1 4
echo $RC
pad_whth_0 10 8
echo $RC

echo "------------------------string-operation----------------------------------"
stringZ=abcABC123ABCabc
echo ${#stringZ}                 		# 15
expr length $stringZ					# 15	
expr match "$stringZ" 'abc[A-Z]*'   	# 6
expr "$stringZ" : 'abc[A-Z]*.2'       	# 8
echo "---match use grep----"
rc=`echo $stringZ | grep "a*A"`   
#if [ -n $rc ]
#if [ ! -z $rc ]
if [ $rc != "" ]
then
	echo "find"
else 
	echo "not find"
fi

echo "---match use =~ ----"
exstring="This is a fine mess." 
if [[ $exstring =~ "This" ]]
then
	echo "find"
else 
	echo "not find"
fi

# reg="is"
# expr match "Thisisabook" 'is'



















