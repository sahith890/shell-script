#!/bin/bash

for i in $@
do
    yum install $i 
done