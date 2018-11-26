#! /bin/bash

echo -e " \e[94m @##################################################################################################################################################################"
echo -e " \e[94m @ #                                                                                                                                                                #"
echo -e " \e[94m @@ #   \e[34m      ,o888888o      \e[31m 8 8888888888888  88888 8888888888    \e[34m     8 888888888o    \e[31m 8 888888888888           8           8 888888888o        8  8888       ,8  \e[94m #"
echo -e " \e[94m @@@ #  \e[34m     8888      88    \e[31m 8 8888               8 8888          \e[34m     8 8888     88   \e[31m 8 8888                  888          8 8888     ^888      8  8888     ,8    \e[94m #"
echo -e " \e[94m @@@ #  \e[34m  ,8 8888        8   \e[31m 8 8888               8 8888          \e[34m     8 8888      88  \e[31m 8 8888                :88888         8 8888         88     8  8888   ,8     \e[94m #"
echo -e " \e[94m @@@ #  \e[34m  88 8888            \e[31m 8 8888               8 8888          \e[34m     8 8888     ,88  \e[31m 8 8888                  88888        8 8888          88     8  8888 ,8      \e[94m #"
echo -e " \e[94m @@@ #  \e[34m  88 8888            \e[31m 8 888888888888       8 8888          \e[34m     8 8888    ,88   \e[31m 8 888888888888       8   88888       8 8888          88      8  88888       \e[94m #"
echo -e " \e[94m @@@ #  \e[34m  88 8888            \e[31m 8 8888               8 8888          \e[34m     8 888888888P    \e[31m 8 8888              8 8   88888      8 8888          88       8  8888       \e[94m #"
echo -e " \e[94m @@@ #  \e[34m  88 8888   8888888  \e[31m 8 8888               8 8888          \e[34m     8 8888 8b       \e[31m 8 8888             8   8   88888     8 8888         ,88        8 8888       \e[94m #"
echo -e " \e[94m @@@ #  \e[34m   8 8888        8   \e[31m 8 8888               8 8888          \e[34m     8 8888  8b      \e[31m 8 8888            8     8   88888    8 8888        ,88         8 8888       \e[94m #"
echo -e " \e[94m @@@ #  \e[34m     8888     ,88    \e[31m 8 8888               8 8888          \e[34m     8 8888    8b    \e[31m 8 8888           888888888   88888   8 8888    ,o88P           8 8888       \e[94m #"
echo -e " \e[94m @@@ #  \e[34m       8888888P      \e[31m 8 888888888888       8 8888          \e[34m     8 8888      88  \e[31m 8 888888888888  8         8   88888  8 888888888P              8 8888       \e[94m #"
echo -e " \e[94m @@@ #                                                                                                                                                                #"
echo -e " \e[94m  @@ #                                                                                                                                                                #"
echo -e " \e[94m   @ ##################################################################################################################################################################\n\n"


echo -e "       ########################################################"
echo -e "      #                                                        #"
echo -e "      #          ====== PREPARING SOURCES.LIST ======          #"
echo -e "      #                                                        #"
echo -e "       ########################################################"

error=0

{
	echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list && 
	echo -e "\n\e[39mdeb http://http.kali.org/kali kali-rolling main non-free contrib >> /etc/apt/sources.list " 	
} || {
	$error = 1
	echo -e "\n\e[31mdeb http://http.kali.org/kali kali-rolling main non-free contrib >> /etc/apt/sources.list " 	
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
}

{
	echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list &&
	echo -e "deb-src http://http.kali.org/kali kali-rolling main non-free contrib > /etc/apt/sources.list "
} || {	
	$error = 1
	echo -e "\e[31mdeb-src http://http.kali.org/kali kali-rolling main non-free contrib > /etc/apt/sources.list "
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
     }

if [ "$error" != "1" ]; then
	echo -e "\e[32m"
	echo -e "       ######"
	echo -e "      # DONE #"
	echo -e "       ###### "
	echo -e "\e[94m"
else
	echo -e "\e[33m"
	echo -e "       ######################"
	echo -e "      # FINISHED WITH ERRORS #"
	echo -e "       ###################### "
	echo -e "\e[94m"
fi
		


echo -e "       ########################################################"
echo -e "      #                                                        #"
echo -e "      #           ====== UPDATING & UPGRADING ======           #"
echo -e "      #                                                        #"
echo -e "       ########################################################"

error=0

echo -e "\n      \e[34m--- APT CLEAN ---\e[39m"
apt clean ||
{
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
	
}

echo -e "\n      \e[34m--- APT UPDATE ---\e[39m"
apt update ||
{
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
}

echo -e "\n      \e[34m--- APT FULL-UPGRADE ---\e[39m"
apt full-upgrade ||
{
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
}
	
echo -e "\n      \e[34m--- APT AUTOREMOVE ---\e[39m"
apt autoremove ||
{
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
}

if [ "$error" != "1" ]; then
	echo -e "\e[32m"
	echo -e "       ######"
	echo -e "      # DONE #"
	echo -e "       ###### "
	echo -e "\e[94m"
else
	echo -e "\e[33m"
	echo -e "       ######################"
	echo -e "      # FINISHED WITH ERRORS #"
	echo -e "       ###################### "
	echo -e "\e[94m"
fi


echo -e "       ########################################################"
echo -e "      #                                                        #"
echo -e "      #         ====== DOWNLOADING & INSTALLING  ======        #"
echo -e "      #                                                        #"
echo -e "       ########################################################"

error=0
mkdir /root/Hacks/Scripts ||
{
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
}


echo -e "\n      \e[34m--- TERMINATOR ---\e[39m"
apt install terminator ||
{
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
}


echo -e "\n      \e[34m--- SECLISTS ---\e[39m"
{
	mkdir /root/Hacks/SecLists &&
	git clone https://github.com/danielmiessler/SecLists.git /root/Hacks/SecLists && ## TESTOWE DANE - POPRAWIC
	rm /root/Hack/SecLists/CON* &&
	rm /root/Hack/SecLists/LICENSE &&
	rm /root/Hack/SecLists/README.md

} || {
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
     }  


echo -e "\n      \e[34m--- RED HAWK ---\e[39m"
{
	mkdir /root/Hacks/RedHawk &&
	git clone git clone https://github.com/Tuhinshubhra/RED_HAWK.git /root/Hacks/Red_Hawk ## TESTOWE DANE - POPRAWIC

} || {
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
     }  


if [ "$error" != "1" ]; then
	echo -e "\e[32m"
	echo -e "       ######"
	echo -e "      # DONE #"
	echo -e "       ###### "
	echo -e "\e[94m\n\n\n"
else
	echo -e "\e[33m"
	echo -e "       ######################"
	echo -e "      # FINISHED WITH ERRORS #"
	echo -e "       ###################### "
	echo -e "\e[94m\n\n\n"
fi


echo -e "       ########################################################"
echo -e "      #                                                        #"
echo -e "      #                 ====== SETTINGS ======                 #"
echo -e "      #                                                        #"
echo -e "       ########################################################"

error=0

