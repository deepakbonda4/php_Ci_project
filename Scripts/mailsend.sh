#!/bin/bash

echo "Enter the script path"
read path

bash $path

if [ $? -eq 0 ]
then
echo "The script is running fine man"
echo "Script is successfully" | mail -s "Script Status" deepak.adhikari@mygurukulam.com

exit 

else
echo "The script failed" 

fi
