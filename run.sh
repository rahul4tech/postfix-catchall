#!/bin/sh

mapprogress=`tput setaf 1`
init=`tput setaf 2`
reset=`tput sgr0`
restartP1=`tput setaf 5`
restartProgress=`tput smul`
postfixPath="/etc/postfix"

clear
echo "${init}Please Enter Domain Name :${reset}"
read domain

echo "@$domain              catchall" >> $postfixPath/virtual

echo "${mapprogress}POSTMAP In Progress...."

postmap $postfixPath/virtual

echo "Adding Virtual Alias...${reset}"

echo "virtual_alias_maps = hash:/etc/postfix/virtual" >> $postfixPath/main.cf

echo "${restartP1}Restarting POSTFIX..${reset}"

systemctl restart postfix

echo "${init}Task Completed. ${reset}"
