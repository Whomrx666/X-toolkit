#!/bin/bash

white='\033[0;37m'
NC='\033[0m'
clear
printf '\033]2; INSTALLER\a'
echo -e "Press \e[1;33many key\e[0m to install the script..."
read -n 1 
clear

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$DIR" != "/root/X-toolkit" ]]
then
	echo -e "I will try to install it for you..."
	sleep 4
	if [[ -d /root/X-toolkit ]]
	then 
		rm -r /root/X-toolkit
	fi
	mkdir /root/X-toolkit
	cp -r "$DIR"/* /root/X-toolkit
	chmod +x /root/X-toolkit/install.sh
	#gnome-terminal -- bash -c "sudo /root/autoxploit/install.sh; exec bash"
fi
echo -e "Installing X-toolkit..."
sleep 1
echo -e "Fixing permissions..."
sleep 2
chmod +x /root/X-toolkit/X-toolkit.sh
clear
echo -e "Copying script to /bin/X-toolkit"
cd /root/X-toolkit
cp /root/X-toolkit/X-toolkit.sh /bin/X-toolkit
clear
while true
do  
	clear
	echo -e "Are you \e[1;33mu\e[0mpdating or \e[1;33mi\e[0mnstalling the script?(\e[1;33mu\e[0m/\e[1;33mi\e[0m): "
	echo -e "Only use 'i' for the first time."
	read UORI
	if [[ "$UORI" = "u" ]]
	then 
		clear 
		echo -e "This feature is currently under construction.."
		sleep 3
	elif [[ "$UORI" = "i" ]]
	then 
		clear
		BASHCHECK=$(cat ~/.bashrc | grep "/bin/X-toolkit")
		if [[ "$BASHCHECK" != "" ]]
		then 
			echo -e "I SAID USE i ONLY ONE TIME..........."
			sleep 3
			break
		fi
		echo -e "Adding X-toolkit to PATH so you can access it from anywhere"
		sleep 1
		export PATH=/bin/X-toolkit:$PATH
		sleep 1
		echo "export PATH=/bin/X-toolkit:$PATH" >> ~/.bashrc
		sleep 1
		clear
		break
	fi
done
clear
echo -e "${White}Installing Dependencies.."
sleep 0.1
echo -e "${White}Installing Curl"
sudo apt install curl
clear
sleep 1
echo -e "Installation is finished. Type 'X-toolkit' to launch the script after we exit."
sleep 0.5
echo -en "Starting X-toolkit"; sleep 0.5 ;echo -en "." ;sleep 0.5 ;echo -en "." ;sleep 0.5 ;echo -en "." ;sleep 0.5 ;echo -en "." ;
sudo X-toolkit

