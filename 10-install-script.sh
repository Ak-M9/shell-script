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
    if [ $? -ne 0 ]
    then
        echo "MySql installation...Failure"
    else
        echo "MySql installtion...Success"
    fi
else
    echo "MySql already installed"
    dnf remove mysql
    if [ $? -eq 0 ]
    then
        echo "MySql uninstalled successfully"
fi

