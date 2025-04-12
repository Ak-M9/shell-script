#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 installation... $R Failure"
    else
        echo -e "$2 installtion...$G Success"
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
    echo -e "$Y MySql already installed"
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
    echo -e  "$Y git already installed"
    dnf remove git -y
    if [ $? -eq 0 ]
    then
        echo "git uninstalled successfully"
    fi
fi