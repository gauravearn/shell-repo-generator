#!/usr/bin/env bash
# -*- coding:  utf-8 -*-
# Universität Potsdam, Germany
# Author: Gaurav Sablok
# date: 2024-1-17

echo "a shell simulator and python configurator for the new system"
echo "thank you for using the shell simulator for system integration"
read -r -p "please provide the path to the previous pip installation file:" install
read -r -p "please provide the option for the configure:" shell
read -r -p "please provide the pakcage to search for the debian repo:" repo
if [[ "$install" eq 0 ]]
then 
    echo "please prepare a file using the pip3 freeze"
    echo "pip3 list freeze >> pip3install.txt"
fi 
if [[ "$install" == "yes" ]] 
then
    uname -a 
    pip3 list freeze >> pip3install.txt
fi
if [[ "${shell}" == "bash" ]]
then 
    read -r -p "plesae provide the password for the user"
    for i in $(sudo apt-get cache search "$repo" \
                        | grep ^"${repo}" | cut -f 1,2 -d "-")
    do 
        sudo apt-get install $i -y
    done  
fi
if [[ "${shell}" == "python" ]]
then 
    read -r -p "please provide the path to the pip3 file:" file
    if [[ -z "${file}" ]]
    then 
        echo "getting all the files for the instance"
        for i in $(sudo apt-cache search python \
                        | grep ^python | cut -f 1,2 -d "-")
        do 
            sudo apt-get install $i
        done
else 
    echo "thank you, you have neither used the shell stimulator neither you ahve used the python simulator"
fi
