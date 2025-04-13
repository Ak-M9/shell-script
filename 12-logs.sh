#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_File=$(echo $0 | cut -d '.' -f 1)
TIMESTAMP=$(date +%d-%m-%Y-%H-%M-%S)
LOG_FILENAME="$LOGS_FOLDER/$LOG_File-$TIMESTAMP.log"

Validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 installation... $R Failure $N"
    else
        echo -e "$2 installtion...$G Success $N"
    fi
}

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILENAME

if [ $USERID -ne 0 ]
then
    echo "Error: please check the root access for the user" &>>$LOG_FILENAME
    exit 1
fi

dnf list installed mysql &>>$LOG_FILENAME

if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILENAME
    Validate $? mysql
    
else
    echo -e "$Y MySql already installed $N"
    dnf remove mysql -y &>>$LOG_FILENAME
    if [ $? -eq 0 ]
    then
        echo "MySql uninstalled successfully"
    fi
fi

dnf list installed git &>>$LOG_FILENAME

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILENAME
    Validate $? git
else
    echo -e  "$Y git already installed $N"
    dnf remove git -y &>>$LOG_FILENAME
    if [ $? -eq 0 ]
    then
        echo "git uninstalled successfully"
    fi 
fi