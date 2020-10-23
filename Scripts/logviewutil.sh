#!/bin/bash

echo "Your $1 script is being loged at log.file"
bash -x $1 2>&1 | tee log.file
