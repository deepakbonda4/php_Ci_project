#!/bin/bash

function createFileOrDir(){
read -p "Please enter the file or directory you want to create " name
a=`echo "$name" | awk -F. '{ print $1"\t" $2 }'| wc -w`

if [[ $a == 2 ]]
then
touch $name
else
mkdir $name
fi

}

#createFileOrDir

name=$1
function ListFiles () {

#local name=$1
if [ -z "$name" ]
then
ls -l
else 
ls -l $name

fi

}

#ListFiles



function ListAndConcatinate(){
	
read -p "enter the file name" input
if [ -f "$input" ]
then
echo "this line is concatenated to the file" >> $input
cat $input
else
a=`ls -d */ | sort -f | head -n1`
echo "the content of $a directory is as below"
ls -l $a
fi

}

#ListAndConcatinate



function addContent () {

read -p "enter the file name you want to add content to" input
b=`find . -type f -name $input`
if [ -z "$b" ]
then
echo "file doesn't exist"
exit
else 
echo "type t if you want to add the data at the top of file"
read data
if [ -z "$data" ]
then	
echo "line has been added to the end" >> $input
else
echo "line has been added to the top of file" | cat - $input >> justfile | mv justfile $input
fi
fi
}

#addContent


function DeleteLines () {

read -p "enter the file name you want to delete data" filey
c=`find . -type f -name $filey`
if [ -z "$filey" ]
then
	echo "file doesn't exist"
	exit
else
 	echo "type t to delete data from top"
	read tag
	echo "how many lines you want to delete"
	read numberofline

if [ $tag == "t" ]
then
x=`cat $filey | wc -l`
y=`expr $x - expr $numberofline`
cat $filey | tail -n $y >> tempfile | mv tempfile $filey

else
	z=`cat $filey | wc -l`
	sum=`expr $z - expr $numberofline`
	cat $filey | head -n$sum >> tempfile | mv tempfile $filey

fi
fi

} 

#DeleteLines


function DeleteFile () {

read -p "enter the name of the file you want to delete" fileyy
d=`find . -type f -name $fileyy`
if [ -z "$fileyy" ]
then
        echo "file doesn't exist"
        exit
else 

rm $fileyy

fi
}

#DeleteFile



