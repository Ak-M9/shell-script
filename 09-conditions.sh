#!/bin/bash

Number1=$1
Number2=$2

# -gt -lt -ge 
if [ $Number1 -gt $Number2 ]
then
    echo "$Number1 greater than $Number2"
else
    echo "$Number1 less than $Number2"
fi