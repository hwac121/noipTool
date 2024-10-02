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

#==================================
#         CHECK IF ROOT           #
#==================================

if [ "$EUID" -ne 0 ]
  then 
	clear
	splash
	echo " "
	echo -e "\e[35mMust be run as root or sudo ./noipTool.sh directly from the application folder\e[0m"
	echo -e "\e[35mor using the command noip anywhere in a terminal.\e[0m"
	sleep 0.5
  exit
fi

#==================================
#            FUNCTIONS            #
#==================================

splash(){
	figlet "no-ip Tool" | lolcat
	echo -e "\e[32mVersion 1.0 - Kali Linux\e[0m"
	echo -e "\e[32mby Majik Cat Security\e[0m"
	echo -e "\e[31mVisit Majik Cat Security on YouTube for pentesting tutorials\e[0m"

}

HNreader=$(cat noipHN2)

PWreader=$(cat noipPW)

UNreader=$(cat noipUN)

#==================================
#            MAIN MENU            #
#==================================

options=( "Instructions" "Setup" "Renew Domains" "Quit")
PS3='Choose what action to take: '
while [ "$menu" != 1 ]; do
	clear
	splash
	echo " "
	sleep 0.25
	select opt in "${options[@]}"; do
    	case $opt in 
    	
#==================================
#            OPTIONS              #
#==================================

		"Instructions")
			clear
			splash
			echo " "
			echo -e "	\e[34mStep 1: First run <Setup> to configure your script.\e[0m"
			echo -e "	\e[34mStep 2: If your hostnames change you must run <Setup> again.\e[0m"
			echo -e "	\e[34mStep 4: Run <Renew Domains> anytime you need to re-register your\e[0m"
			echo -e "	\e[34mdynamic hostnames on noip.com\e[0m"
			echo " "
			echo -e "	\e[31mYou MUST have an account setup on https://noip.com for this script.\e[0m"
			echo -e "	\e[31mYou MUST also have the noip DUC Daemon installed for this script to work.\e[0m"
			echo -e "	\e[31mYou can get the DUC script here - https://www.noip.com/download?page=linux\e[0m"
			echo -e "\e[33mYou will return to the main menu after 25 seconds...\e[0m"
			sleep 25
		break
		;;
		"Setup")
			clear
			splash
			echo " "
			echo "Enter your noip.com username."
			read UserName
			echo "$UserName" > noipUN
			echo "Enter your noip.com password."
			read PassWord 
			echo "$PassWord" > noipPW
			echo "Enter your first hostname (i.e. jumbo.hopto.org)."
			read HostName
			echo "$HostName" > noipHN
			echo "Enter your second hostname, leave blank if you do not have a second hostname."
			read HostName2
			echo "$HostName2" >> noipHN
			echo "Enter your third hostname, leave blank if you do not have a third hostname."
			read HostName3
			echo "$HostName3" >> noipHN
			tr '\n' ',' < noipHN | sed 's/,$//' > noipHN2
			sleep 5
			echo "Setup is complete!"
		break
		;;
		"Renew Domains")
			clear
			splash
			echo " "
			noip-duc --username $UNreader --password $PWreader --hostnames $HNreader --once
			sleep 5
			echo "Domains Updated!"
		break
		;;
		"Quit")
			clear
			splash
			echo " "
			echo -e "\e[32mClosing no-ip Tool v1.0\e[0m"
			sleep 2
			menu=1
			clear
		break
		;;
	* )		
			echo -e "\e[32m$REPLY is an invalid option\e[0m"
			sleep 3
		break
		;;
    	esac
	done
done
