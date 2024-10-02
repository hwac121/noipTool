#!/bin/bash

# Title: NO-IP Tool
# Version: 1.0
# Date: Sept. 8, 2024
# Contact: hwac121@ptorbox.onion
# Author: RJ Levesque, Jr. - Majik Cat Security
# GitHub: https://github.com/hwac121

#-----------------------------------------------------------------

# Description:
# A simple script to renew your domains thru noip.com

#=======================================================================
#                         FUNCTIONS
#=======================================================================

splash(){
	figlet "no-ip Tool" | lolcat
	echo -e "\e[32mVersion 1.0 for Kali Linux\e[0m"
	echo -e "\e[32mby Majik Cat Security\e[0m"
	echo -e "\e[31mVisit Majik Cat Security on YouTube for pentesting tutorials\e[0m"
}

#==================================
#         CHECK IF ROOT           #
#==================================

if [ "$EUID" -ne 0 ]
  then 
	clear
	splash
	echo " "
	echo -e "\e[35mMust be run as root or sudo ./noipTool.sh directly from the application\e[0m"
	echo -e "\e[35mfolder or using the command noip anywhere in a terminal.\e[0m"
	sleep 0.5
  exit
fi

#===================================================================#
#			 CHECK FOR DEPENDENCIES                     #
#===================================================================#

clear
splash
echo " "
echo -e "\e[35mINSTALLATION PROCESS...\e[0m"
echo " "
echo -e "\e[35mby Majik Cat Security\e[0m"
sleep 2
rm /usr/bin/noip
chmod +x noipTool.sh
cp noipTool.sh /usr/bin/noip
chmod +x /usr/bin/noip
echo -e "\e[32mThe no-ip Tool is ready for use..."
sleep 3
clear
