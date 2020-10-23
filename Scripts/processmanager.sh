#!/bin/bash

ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head

ps -eo pid,ppid,cmd,%mem --sort=-%mem | head
