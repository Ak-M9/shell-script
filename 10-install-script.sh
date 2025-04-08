#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error: please check the root access for the user"
fi

dnf list installed mysql

if [ $? -ne 0]
then
    dnf install mysql
    echo "type yes to install mysql"
fi

