#!/bin/bash

function killPID() {
pid=$1
ps -ef | awk '{print $2;}'| grep $pid   
if [[ $? -eq 0 ]]
then
	echo "good"
#count=$2
#echo "Terminating PID: "$pid
#for (( i = 1; i <= ${count}; i++ ))
#do
#kill $pid
#if [ $? -eq 0 ]
#then
 #       echo "Command Successful"
  #      exit 0
#fi
#done
#sudo kill -9 $pid
#else
#	echo "Please enter the correct PID.."
#	exit 0
#fi
}

killPID
