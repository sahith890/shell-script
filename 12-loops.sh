#!/bin/bash

DATE=$(date +%F)
LOGDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$0/$DATE.log

USERID=$(id -u)
R="\e[31m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ];
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1
fi
# all arguments are in $@

VALIDATE(){
    # $1 is receving the argument
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ];
    then
        echo "$i is not installed, lets install the package"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi
done