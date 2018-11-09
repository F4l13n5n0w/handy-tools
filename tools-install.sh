#!/bin/bash

sudo apt-get install golang python3-pip python-dnspython -y
sudo apt-get install testssl.sh -y
sudo apt-get install crackmapexec -y


# Install sublime-text3
# Need to update here if any updates on sublime-text3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
suod apt-get install sublime-text -y


# Install subfinder
go get github.com/subfinder/subfinder

# Install recursebuster
go get github.com/c-sto/recursebuster

export PATH=$PATH:/root/go/bin/

cd /opt/

# Install Empire
git clone https://github.com/EmpireProject/Empire.git
cd Empire
sudo setup/install.sh
cd ..

# Install SecLists
git clone https://github.com/danielmiessler/SecLists.git

# Install jwt_tool
git clone https://github.com/ticarpi/jwt_tool.git

# Install nullinux
git clone https://github.com/m8r0wn/nullinux.git
sudo ./nullinux/setup.sh

# Install venom.sh
git clone https://github.com/r00t-3xp10it/venom.git

# Install Windows-Exploit-Suggester
git clone https://github.com/GDSSecurity/Windows-Exploit-Suggester
sudo Windows-Exploit-Suggester/windows-exploit-suggester.py --update

# Install Seth RDP MiTM tool
git clone https://github.com/SySS-Research/Seth

# Install SigThief
git clone https://github.com/secretsquirrel/SigThief.git

# Install SIET
git clone https://github.com/Sab0tag3d/SIET.git

# Install Infoga
git clone https://github.com/The404Hacking/Infoga.git

# Install CloudFail
git clone https://github.com/m0rtem/CloudFail.git
cd CloudFail
pip3 install -r requirements.txt
cd ..

# Install MITMf Man-in-The-Middle attack framework
sudo apt-get install python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev libffi-dev file -y
pip install virtualenvwrapper
source `locate virtualenvwrapper.sh`
mkvirtualenv MITMf -p /usr/bin/python2.7
git clone https://github.com/byt3bl33d3r/MITMf
cd MITMf && git submodule init && git submodule update --recursive
pip install -r requirements.txt
cd ..

# Install CMSmap
git clone https://github.com/Dionach/CMSmap
cd CMSmap
pip3 install .
cd ..


mkdir /var/www/html/privesc

# Download LinEnum
git clone https://github.com/rebootuser/LinEnum.git
cp LinEnum/LinEnum.sh /var/www/html/privesc
chmod +x /var/www/html/privesc/LinEnum.sh

# Download LinuxPrivChecker
git clone https://github.com/sleventyeleven/linuxprivchecker.git
cp linuxprivchecker/linuxprivchecker.py /var/www/html/privesc/lpc.py
chmod +x /var/www/html/privesc/lpc.py

# Install ps1-toolkit (Obfucation version of PowerSploit, AV bypass)
mkdir /var/www/html/privesc/ps1-toolkit
git clone https://github.com/vysec/ps1-toolkit.git
cp ps1-toolkit/*.ps1 /var/www/html/privesc/ps1-toolkit/

# Install WindowsEnum
git clone https://github.com/absolomb/WindowsEnum
cp WindowsEnum/WindowsEnum.ps1 /var/www/html/privesc/WindowsEnum.ps1

# Install NMAP vulners.nse
wget https://raw.githubusercontent.com/vulnersCom/nmap-vulners/master/vulners.nse -O /usr/share/nmap/scripts/vulners.nse

