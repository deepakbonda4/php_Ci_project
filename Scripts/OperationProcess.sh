#!/bin/bash

INPUT=UserOperation.csv
OLDIFS=$IFS
IFS=','
while read USER GROUP

do 

#GROUP=$1
#USER=$2
#NEW_GROUP=$3

function GroupAdd () {

a=`cat /etc/group | awk -F: '{ print $1 }' | grep $GROUP`

if [ -z "$a" ] 

then

	sudo groupadd $GROUP

else 
	echo "group already exist"

fi
}


function UserAdd () {

b=`cat /etc/passwd | awk -F: '{ print $1 }' | grep $USER`

if [ -z "$b" ]

then
	sudo useradd $USER
else

	echo "user already exist"

fi
}

function UserUpdate () {

	sudo usermod -g $NEW_GROUP $USER

}


function UserDelete () {

c=`cat /etc/passwd | awk -F: '{ print $1 }' | grep $USER`

if [ -z "$c" ]

then
	 echo "user doesn't exist"
else
	sudo userdel $USER
fi
}


function GroupDelete () {

d=`cat /etc/group | awk -F: '{ print $1 }' | grep $GROUP`

if [ -z "$d" ]

then
	echo "group doesn't exist"
else
	sudo groupdel $GROUP

fi
}


#e=`cat $INPUT | awk -F, '{ print $2 }'`

#if [ $e == 'add' ]
#then
 
GroupAdd
#fi
UserAdd
UserUpdate
UserDelete
GroupDelete

done < $INPUT
IFS=$OLDIFS

