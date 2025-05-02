#!/bin/bash
# our program goal is to install mysql

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Installation ... FAILURE"
        exit 1
    else
        echo "Installation ... SUCCESS"
    fi

}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
fi

# it is our responsibility to install the mysql is success or not

yum install mysql -y

VALIDATE $?

yum install postfix -y

VALIDATE $?

