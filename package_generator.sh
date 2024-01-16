#!/usr/bin/env bash
# -*- coding:  utf-8 -*-
# Universität Potsdam, Germany
# Author: Gaurav Sablok
# date: 2024-1-16

read -r -p "please input the package to be listed:" package
read -r -p "please provide the password:" password
for i in $(sudo apt-cache search "${package}" | grep ^"${package}" | cut -f 1,2 -d "-")
        do 
                echo sudo apt-get install $i
       done
echo "thank you updating the instance"
