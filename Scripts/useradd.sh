#!/bin/bash

function useradd () {
local user=$1
a=`cat /etc/passwd | awk -F: '{print $1}' | grep {$user}`
if [ -z "$a" ]
then
useradd $user
else 
echo "user already exist"
exit
fi
}

useradd

