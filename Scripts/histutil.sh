#!/bin/bash

echo "Do you want to clear your history? if yes type y if no type n"
read a

if [[ $a == 'y' ]]
then
history -c

echo "history deleted"

exit

elif [[ $a == 'n' ]]
then
echo "history not deleted"

else 
echo "choose the correct option"

fi

