#!/bin/bash

echo "select an operation"
read operation

function cpu () {
echo "Process which is consuming the highest cpu is"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head
}

function mem () {
echo "Process which is consuming the highest memory is"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head
}

function zombie () {
echo "the zombie processes are"
ps -aux | grep defunct

echo "killing the zombie process"
echo | ps -aux | grep defunct | awk '{print $2}'
read zom
kill $zom
}

function childparent () {
echo "the child and parent process of ssh is as below"
pstree -hp | grep sshd
}


function userprocess() {
ps -aux | awk '{print $1}' | sort | uniq
echo "select one user from the above"
read user
echo "the user process for $user are as below"
ps -U $user
}



function groupprocess (){
ps -eo gid,pid,comm | awk '{print $1}' | sort | uniq
echo "select the group from above"
read group
echo "'the group processes for $group are"
ps -g $group

}


#process=$1
#ps -axo stat,ppid,pid,comm | grep $process
#echo "killing the $process process"
#kill -HUP "$process"

#ps -axo stat,ppid,pid,comm | grep $process
#echo "killing the $process process forecefully"
#kill -9 "$process"


if [[ $operation == 'cpu' ]]
then
cpu

elif [[ $operation == 'mem' ]]
then
mem

elif [[ $operation == 'zombie' ]]
then
zombie

elif [[ $operation == 'childparent' ]]
then
childparent

elif [[ $operation == userp ]]
then
userprocess

elif [[ $operation == 'groupp' ]]
then
groupprocess

fi












