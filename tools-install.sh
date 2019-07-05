#!/bin/bash

# Set terminal bold and color
red_bold=`tput bold && tput setaf 1`
green_bold=`tput bold && tput setaf 2`

sudo apt-get install golang python3-pip python-dnspython -y
sudo apt-get install sslyze testssl.sh -y
sudo apt-get install crackmapexec -y


# Install sublime-text3
# Need to update here if any updates on sublime-text3
echo "${green_bold}[Info] Install sublime-text3"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text -y

# Install SubOver
go get github.com/Ice3man543/SubOver

# Install subfinder
go get github.com/subfinder/subfinder

# Install recursebuster
go get github.com/c-sto/recursebuster

export PATH=$PATH:/root/go/bin/

cd /opt/

# Install Interlace
git clone https://github.com/codingo/Interlace.git
cd Interlace
python3 setup.py install
cd /opt/

# Install takeover
git clone https://github.com/m4ll0k/takeover.git
chmod +x takeover/takeover.py

# Install aquatone
mkdir aquatone
cd aquatone
wget https://github.com/michenriksen/aquatone/releases/download/v1.4.3/aquatone_linux_amd64_1.4.3.zip
unzip aquatone_linux_amd64_1.4.3.zip
rm aquatone_linux_amd64_1.4.3.zip
sudo apt-get install chromium-browser -y
ln -ns /opt/aquatone/aquatone /usr/local/bin/aquatone
cd /opt/

# Install Empire
echo "${green_bold}[Info] Install Empire"
git clone https://github.com/EmpireProject/Empire.git
cd Empire
sudo setup/install.sh
cd ..

# Install SecLists
git clone https://github.com/danielmiessler/SecLists.git

# Install jwt_tool
git clone https://github.com/ticarpi/jwt_tool.git

# Install nullinux
echo "${green_bold}[Info] Install nullinux"
git clone https://github.com/m8r0wn/nullinux.git
sudo ./nullinux/setup.sh

# Install venom.sh
#git clone https://github.com/r00t-3xp10it/venom.git

# Install Windows-Exploit-Suggester
echo "${green_bold}[Info] Install Windows-Exploit-Suggester"
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

# Install dirsearch
git clone https://github.com/maurosoria/dirsearch.git

# Install CloudFail
echo "${green_bold}[Info] Install CloudFail"
git clone https://github.com/m0rtem/CloudFail.git
cd CloudFail
pip3 install -r requirements.txt
cd ..

# Install MITMf Man-in-The-Middle attack framework
echo "${green_bold}[Info] Install MITMf"
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

# install ObfuscatedEmpire
git clone https://github.com/cobbr/ObfuscatedEmpire.git
cd ObfuscatedEmpire
cd setup
./install.sh
pip uninstall urllib3
pip install urllib3==1.22
sudo ln -s /usr/bin/pwsh /usr/local/bin/powershell
cd ..
cd ..

# Install webscreenshot
echo "${green_bold}[Info] Install webscreenshot"
sudo apt-get install phantomjs
pip install webscreenshot

# Install Phantom-Evasion
echo "${green_bold}[Info] Install Phantom-Evasion"
cd /opt
git clone https://github.com/oddcod3/Phantom-Evasion.git
cd ..

# Install altdns
echo "${green_bold}[Info] Install altdns"
git clone https://github.com/infosec-au/altdns.git
cd altdns
pip install -r requirements.txt
cd ..

# Install rtfm
git clone https://github.com/leostat/rtfm.git
cd rtfm
chmod +x rtfm.py
./rtfm.py -u
cd ..

# Install Winpayloads
git clone https://github.com/nccgroup/Winpayloads.git
cd Winpayloads
./setup.sh
cd ..

# Install massdns
git clone https://github.com/blechschmidt/massdns/
cd massdns
make
cd ..

# Install eyeBeam
#echo "${green_bold}[Info] Install eyeBeam"
#sudo apt-get install build-essential chrpath libssl-dev libxft-dev -y
#sudo apt-get install libfreetype6 libfreetype6-dev -y
#sudo apt-get install libfontconfig1 libfontconfig1-dev -y
#export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
#wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
#sudo tar xvjf $PHANTOM_JS.tar.bz2
#sudo mv $PHANTOM_JS /usr/local/share
#sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
#pip install progress
#pip install heimdall
#git clone https://github.com/F4l13n5n0w/eyeBeam.git

# The following installation process only working on Kali 2018v4
#pip install selenium
#wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz
#tar zxvf geckodriver-v0.23.0-linux64.tar.gz
#mv geckodriver /usr/local/bin/
#git clone https://github.com/F4l13n5n0w/eyeBeam.git


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

# Install webfuzz.txt
wget https://gist.githubusercontent.com/skim-milk/6500420e54bb154063551fc7ef527123/raw/e6b731e951ad2aaefbef4d91553e1419733f7dcd/webfuzz.txt -O /usr/share/wordlists/webfuzz.txt

# Download the latest PowerView.ps1
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/dev/Recon/PowerView.ps1 -O /var/www/html/privesc/PowerView.ps1

# Download SharpHound
wget https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Ingestors/SharpHound.ps1 -O /var/www/html/privesc/SharpHound.ps1
wget https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Ingestors/SharpHound.exe -O /var/www/html/privesc/SharpHound.exe


