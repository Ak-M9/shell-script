#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error: please check the root access for the user"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -e 0 ]
    then
        echo "MySql installation...Success"
    else
        echo "MySql installtion...Failure"
    fi
else
    echo "MySql already installed"
fi

