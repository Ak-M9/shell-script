#!/bin/bash

echo "All the variables passed: $@"
echo "Count of variables passed: $#"
echo "Present working directory: $pwd"
echo "Present working directory of user: $home"
echo "script name: $0"
echo "process id of current script: $$"
sleep 60 &
echo "process id of the last command in background: $!"