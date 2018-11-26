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
echo -e " \e[94m   @ ##################################################################################################################################################################"


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
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
}

if [ "$error" != "1" ]; then
	echo -e "\e[32m"
	echo -e "       ####"
	echo -e "      # OK #"
	echo -e "       #### "
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

echo -e "\n       \e[34m--- APT CLEAN ---\e[39m"
apt clean
echo -e "\e[32m"
echo -e "       ####"
echo -e "      # OK #"
echo -e "       #### "
echo -e "\e[94m"

echo -e "      \e[34m--- APT UPDATE ---\e[39m"
apt update
echo -e "\e[32m"
echo -e "       ####"
echo -e "      # OK #"
echo -e "       #### "
echo -e "\e[94m"

echo -e "      \e[34m--- APT FULL-UPGRADE ---\e[39m"
apt full-upgrade
echo -e "\e[32m"
echo -e "       ####"
echo -e "      # OK #"
echo -e "       #### "
echo -e "\e[94m"

echo -e "      \e[34m--- APT AUTOREMOVE ---\e[39m"
apt autoremove
echo -e "\e[32m"
echo -e "       ####"
echo -e "      # OK #"
echo -e "       #### "
echo -e "\e[94m"



echo -e "       ########################################################"
echo -e "      #                                                        #"
echo -e "      #         ====== DOWNLOADING & INSTALLING  ======        #"
echo -e "      #                                                        #"
echo -e "       ########################################################"



echo -e "       ########################################################"
echo -e "      #                                                        #"
echo -e "      #                 ====== SETTINGS ======                 #"
echo -e "      #                                                        #"
echo -e "       ########################################################"



