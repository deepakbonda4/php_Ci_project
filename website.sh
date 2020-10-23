#!/bin/bash

ansible remote -m shell -a "apt-get update" -i hosts --become
ansible remote -m apt -a "name=nginx state=present" -i hosts --become
ansible remote -m service -a "name=nginx state=restarted" -i hosts --become
ansible remote -m shell -a "systemctl status nginx" -i hosts --become
ansible remote -m copy -a "src=index.html dest=/var/www/html" -i hosts -become

