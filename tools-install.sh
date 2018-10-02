#!/bin/bash

sudo apt-get install golang python3-pip
sudo apt-get install testssl.sh

go get subfinder
go get recursebuster

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



