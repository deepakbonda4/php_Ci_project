#!/bin/bash

id=$1
trial=$2
gap=$3

function Kill_Process_Id() {

pid=`ps -ef | awk '{printf "%s\n",$2;}'| grep "$id"`

if [ -z "$pid" ]
then
	echo "no process found by the pid $id"
	exit 0
else
	
	kill $id

if [[ $? = 0 ]]
then
	echo "$id has been killed"

	exit 0
else

for (( i = 1; i <= ${trial}; i++ ))
do
	kill $id

if [ $? -eq 0 ]
then
        echo "process $id killed successfully"
        exit 0
else

sleep ${gap}
fi
done
	kill -9 $id
fi
fi

}

Kill_Process_Id


