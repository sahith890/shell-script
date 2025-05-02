#!/bin/bash
# our program goal is to install mysql
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

VALIDATE(){
    # $1 is receving the argument
    if [ $1 -ne 0 ]
    then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi

}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
fi

# it is our responsibility to install the mysql is success or not

yum install mysql -y &>>LOGFILE

VALIDATE $? " Installing MYSQL"

yum install postfix -y &>>LOGFILE

VALIDATE $?  "Installing postfix"

