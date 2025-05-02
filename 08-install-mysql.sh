#!/bin/bash
# our program goal is to install mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
fi

# it is our responsibility to install the mysql is success or not

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation of mysql is error"
    exit 1
else
    echo "Installation of mysql is success"
fi