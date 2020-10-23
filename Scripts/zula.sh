#!/bin/bash

cd /home/ubuntu
a=`find . -type f -name testamm`

if [ -z "$a" ]
then
echo "empty"

fi


