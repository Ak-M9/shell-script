#!/bin/bash

USERID=$(id -u)

Validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 installation...Failure"
    else
        echo "$2 installtion...Success"
    fi
}
if [ $USERID -ne 0 ]
then
    echo "Error: please check the root access for the user"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    Validate $? mysql
    
else
    echo "MySql already installed"
    dnf remove mysql -y
    if [ $? -eq 0 ]
    then
        echo "MySql uninstalled successfully"
    fi
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    Validate $? git
else
    echo "git already installed"
    dnf remove git -y
    if [ $? -eq 0 ]
    then
        echo "git uninstalled successfully"
    fi
fi