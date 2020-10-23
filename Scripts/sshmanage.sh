#!/bin/bash

cd /home/ubuntu/.ssh
touch config
chmod 600 config

echo "new ssh host connectivity details are adding"

echo "type the username"
read uname

echo "type the host name"
read hostname

echo "type the port number"
read portnum

function addinghost (){
cat >> config << "EOF"
Host $unme
HostNmae $hostname
user $uname
port $portnum

EOF
}

addinghost

echo "do you want to update ssh connectivity details? if yes type yes if no type no"
read answer

if [[ $answer == "yes" ]]
then 
addinghost

else 
echo "Thank you"

exit



