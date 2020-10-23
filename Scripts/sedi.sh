#!/bin/bash


function creategroup () {

groupnum=$1
groupgap=$2

echo "the group ${groupnum} members are"
sed -n ${groupnum}~${groupgap}p employee.txt

}

for (( i=1; i<=3; i++ ))
	
do creategroup $i `expr 3`
done



