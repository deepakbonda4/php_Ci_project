#!/bin/bash

echo "Enter path of script : $1 "
echo "Enter job timing : $2 "
command="bash $1"
job="$2 $command"
cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -e
crontab -l
