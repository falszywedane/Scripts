#! /bin/bash
echo " ........................................................................."
echo " ..............110011010010110............................................"
echo " ..........00100110101110100110101........................................"
echo " .......10010100100110010110100101100....................................."
echo " ....@101101010010100101010010101001010@.................................."
echo " ....@000101010011101011011011111001011@.................................."
echo " ....@111011100101010010101101010011001@.................................."
echo " ....@010000000111000000010101111101011@.................................."
echo " ....@110010110101111100001101010101010@.................................."         
echo " ....@001010100110101100101001011100010@.................................."
echo " ....@010101100000011101010110101010110@.................................."
echo " ....@011101100100010001011100000110101@.................................."
echo " ....@110001010111010101110010001010110@.................................."
echo " .....@1110010100000011101001110100101@..................................."
echo " ......@01001010100111010101000001010@...................................."
echo " .......@010100111101010100010101111@.....                              .."
echo " .........@00111101010001001101110@.......   Kali Linux Distribution    .."
echo " ............@10111001100010101@..........   Customizing & Hardening    .."
echo " ...............@00101110101@.............           Script             .."
echo " ..................@10101@................................................"
echo " .....................@.............................. 2018 ..............."
echo " ........................................................................."

echo -e "\e[94m\n"

echo -e "       ########################################################"
echo -e "      #                                                        #"
echo -e "      #          ====== PREPARING SOURCES.LIST ======          #"
echo -e "      #                                                        #"
echo -e "       ########################################################"

error=0

{
	echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list && 
	echo -e "\n\e[39mdeb http://http.kali.org/kali kali-rolling main non-free contrib > /etc/apt/sources.list " 	
} || {
	$error = 1
	echo -e "\n\e[31mdeb http://http.kali.org/kali kali-rolling main non-free contrib > /etc/apt/sources.list " 	
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
}

{
	echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list &&
	echo -e "deb-src http://http.kali.org/kali kali-rolling main non-free contrib >> /etc/apt/sources.list "
} || {	
	$error = 1
	echo -e "\e[31mdeb-src http://http.kali.org/kali kali-rolling main non-free contrib >> /etc/apt/sources.list "
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
	echo -e "\e[94m\n"
else
	echo -e "\e[33m"
	echo -e "       ######################"
	echo -e "      # FINISHED WITH ERRORS #"
	echo -e "       ###################### "
	echo -e "\e[94m\n"
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
	echo -e "\e[94m\n"
else
	echo -e "\e[33m"
	echo -e "       ######################"
	echo -e "      # FINISHED WITH ERRORS #"
	echo -e "       ###################### "
	echo -e "\e[94m\n"
fi


echo -e "       ########################################################"
echo -e "      #                                                        #"
echo -e "      #         ====== DOWNLOADING & INSTALLING  ======        #"
echo -e "      #                                                        #"
echo -e "       ########################################################"

error=0
echo -e "\e[39m"
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


echo -e "\n      \e[34m--- WINE32 ---\e[39m"
apt install wine32 ||
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
	git clone https://github.com/Tuhinshubhra/RED_HAWK.git /root/Hacks/Red_Hawk ## TESTOWE DANE - POPRAWIC

} || {
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
     }  


echo -e "\n      \e[34m--- LINENUM.SH ---\e[39m"
{
	mkdir /root/Hacks/LinEnum &&
	git clone https://github.com/rebootuser/LinEnum.git /root/Hacks/LinEnum &&
	cp /root/Hacks/LinEnum/LinEnum.sh /root/Hacks/Scripts/LinEnum.sh &&
	rm -r /root/Hacks/LinEnum						## TESTOWE DANE - POPRAWIC

} || {
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
     }  


echo -e "\n      \e[34m--- UNIX-PRIVESC-CHECK ---\e[39m"
{
	mkdir /root/Hacks/UPC &&
	wget http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz -P /root/Hacks/UPC &&
	tar -xvf /root/Hacks/UPC/unix-privesc-check-1.4.tar.gz -C /root/Hacks/UPC &&
	cp /root/Hacks/UPC/unix-privesc-check-1.4/unix-privesc-check /root/Hacks/Scripts/upc.sh &&
	rm -r /root/Hacks/UPC									## TESTOWE DANE - POPRAWIC

} || {
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
     }  


echo -e "\n      \e[34m--- LINUX-EXPLOIT-SUGGESTER-2 ---\e[39m"
{
	mkdir /root/Hacks/LES2 &&
	git clone https://github.com/jondonas/linux-exploit-suggester-2.git /root/Hacks/LES2 &&
	cp /root/Hacks/LES2/linux-exploit-suggester-2.pl /root/Hacks/Scripts/les2.pl &&
	rm -r /root/Hacks/LES2								## TESTOWE DANE - POPRAWIC

} || {
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
     }  


echo -e "\n      \e[34m--- JOHN-THE-RIPPER-JUMBO ---\e[39m"
{
	mkdir /root/Hacks/JTRJ &&
	git clone https://github.com/magnumripper/JohnTheRipper.git /root/Hacks/JTRJ &&
	#rm -r /root/Hacks/JTRJ								## TESTOWE DANE - POPRAWIC - dodać budowanie i instalację!

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
	echo -e "\e[94m\n"
else
	echo -e "\e[33m"
	echo -e "       ######################"
	echo -e "      # FINISHED WITH ERRORS #"
	echo -e "       ###################### "
	echo -e "\e[94m\n"
fi


echo -e "       ########################################################"
echo -e "      #                                                        #"
echo -e "      #                 ====== SETTINGS ======                 #"
echo -e "      #                                                        #"
echo -e "       ########################################################"

error=0
echo -e "\n      \e[34m--- CREATE .VIMRC ---\e[39m"
touch /root/.vimrc || 
{	
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
}

echo -e "\n      \e[34m--- CONFIGURE .VIMRC ---\e[39m"
{
	echo "set expandtab" >> /root/.vimrc &&
	echo "set expandtab >> /root/.vimrc" &&
	echo "set number" >> /root/.vimrc &&
	echo "set number >> /root/.vimrc" &&
	echo "set tabstop=4" >> /root/.vimrc &&
	echo "set tabstop=4 >> /root/.vimrc" &&
	echo "syntax enable" >> /root/.vimrc &&
	echo "syntax enable >> /root/.vimrc"
} || {
	error=1
	echo -e "\e[31m"
	echo -e "       ######"
	echo -e "      # FAIL #"
	echo -e "       ###### "
	echo -e "\e[94m"
     }


echo -e "\n      \e[34m--- CONFIGURE IPTABLES ---\e[39m"
{
    iptables -F
        # ^^ Usun istniejace reguly
    iptables -A INPUT -I -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT  
        # ^^ Akceptuj wszystkie pakiety z ustanowionych polaczen
    iptables -A INPUT -m conntrack --ctstate INVALID 2 -j DROP                       
        # ^^ Odrzucaj wszystkie nieprawidlowe pakiety 
    iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100/minute -j ACCEPT
        # ^^ Ogranicz liczbe polaczen TCP na porcie 80 do 25/min po osiagnieciu pulapu 100/min    
    // TODO	
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
	echo -e "\e[94m\n"
else
	echo -e "\e[33m"
	echo -e "       ######################"
	echo -e "      # FINISHED WITH ERRORS #"
	echo -e "       ###################### "
	echo -e "\e[94m\n"
fi
