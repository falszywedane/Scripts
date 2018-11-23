#! /bin/sh

header_print()
{

}

green_print(char[])
{

}

red_print(char[]) 
{

}

##
apt update
apt full-upgrade

##
mkdir /root/Hack
mkdir /root/Hack/Scripts
mkdir /root/Hack/SecLists
mkdir /root/Hack/MasScan
mkdir /root/Hack/LinEnum
mkdir /root/Hack/LinExSug2
mkdir /root/Hack/RedHawk	
##

### --- Nessus


### --- SecLists
git clone https://github.com/danielmiessler/SecLists.git /root/Hack/SecLists
rm /root/Hack/SecLists/CO*
rm /root/Hack/Seclists/README.md
rm /root/Hack/Seclists/LICENSE

### --- Masscan
git clone https://github.com/robertdavidgraham/masscan.git /root/Hack/MasScan

### --- LineEnum
git clone https://github.com/rebootuser/LinEnum.git /root/Hack/LinEnum
cp /root/Hack/LinEnum/LinEnum.sh /root/Hack/Scripts
rm -r /root/Hack/LinEnum

### --- Unix-PrilEsc-Check
wget http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz -P /root/Hack
tar -xf /root/Hack/unix-privesc-check-1.4.tar.gz
cp /root/Hack/unix-privesc-check-1.4/unix-privesc-check /root/Hack/Scripts
rm -r /root/Hack/unix-privesc-check-1.4

### --- Linux-Exploit-Suggester-2
git clone https://github.com/jondonas/linux-exploit-suggester-2.git /root/Hack/LinExSug2
cp /root/Hack/LinExSug2/linux-exploit-suggester-2.pl /root/Hack/Scripts
rm root/Hack/LinExSug2

### --- Red_Hawk
git clone https://github.com/Tuhinshubhra/RED_HAWK.git /root/Hack/RedHawk


### --- Terminator
apt install terminator

