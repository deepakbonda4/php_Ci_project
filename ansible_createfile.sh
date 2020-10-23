#!/bin/bash

ansible remote -m file -a "name=/var/log/deepak.txt state=touch" -i hosts --become
ansible remote -m command -a "echo `hostname && date` >> /var/log/deepak.txt" -i hosts --become

