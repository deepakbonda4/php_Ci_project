#!/bin/bash                                                                                                                                      

file=$1

size() {

cd /home/ubuntu
a=`ls -l $file | awk '{ print $5 }'`

if [[ $a -gt 50000000 ]]

then
tar -cvzf $file.tar.gz $file
echo "File has been compressed"

else 
echo "file is less then 50mb so better luck next time"
fi

}

size


filey=$2
function olderfile () {

cd /home/ubuntu

 
find $filey -mtime +1 -print | tar -cvzf $filey.tar.gz $filey
rm $filey

}

olderfile


function awss3 () {
cd /home/ubuntu
a=`find . -type f -mtime +7 -print`
if [ "cat $a | wc -l" -gt 0 ]
then	
tar -cvzf $a.tar.gz $a
echo "compression done. Now removing the file"

rm $a

echo "transferinf to S3"
aws S3 cp $a.tar.gz https://s3.amazonaws.com/deepakbucket

else 
echo "no file less that 7 days old exist"

fi

}

awss3




