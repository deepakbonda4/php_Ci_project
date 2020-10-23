#!/bin/bash

Package=$1

sudo apt-get update -y
sudo apt-get install $Package -y

