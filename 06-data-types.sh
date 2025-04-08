#!/bin/bash

Number1=$1
Number2=$2

Sum=$(($Number1+$Number2))
echo "Sum of $Number1 and $Number2 is $Sum"
Timestamp=$(date)
echo "script executed at timestamp: $Timestamp"
