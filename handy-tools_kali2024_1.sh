#!/bin/bash

echo "[+] install handy tools for kali 2024.1 VM"


sudo apt-get update 
sudo apt-get full-upgrade -y

sudo apt-get install -y dirsearch pacu cloudbrute golang python3-pip plank flameshot
sudo apt-get install -y testssl.sh seclists neofetch lolcat gnome-terminal subfinder gron jq ansible-core
sudo apt-get install -y gnupg software-properties-common 
#sudo apt-get install -y kali-community-wallpapers
#sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
#sudo pip install wheel


# Install the latest version of feroxbuster
## https://github.com/epi052/feroxbuster/releases/
cd /opt/
wget https://github.com/epi052/feroxbuster/releases/download/v2.10.2/feroxbuster_amd64.deb.zip -O ./feroxbuster.zip
unzip ./feroxbuster.zip
dpkg -i feroxbuster_2.10.2-1_amd64.deb
rm -rf ./feroxbuster*


# Install sublime-text4
## https://www.sublimetext.com/download_thanks?target=x64-deb
cd /opt/
wget https://download.sublimetext.com/sublime-text_build-4169_amd64.deb -O sublime4.deb
dpkg -i ./sublime4.deb
rm -rf ./sublime4.deb


# Install VS code
## download deb installer from the website: https://code.visualstudio.com/docs/?dv=linux64_deb
## install plugins: GIST, Github, Github Pull Requests and Issues, Remote-SSH, Go, PowerShell, AWS Toolkit, Python
## Add email and name:
## git config --global user.email "fallensnow.qing@gmail.com"
## git config --global user.name "F4l13n5n0w"

cd /opt/
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" --output /opt/vscode_amd64.deb
dpkg -i /opt/vscode_amd64.deb
rm -rf /opt/vscode_amd64.deb

# Create softlink for python2 to python
rm -rf /usr/bin/python
ln -s /usr/bin/python2.7 /usr/bin/python

# Install pip3
#cd /opt/
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip3.py
#python3 ./get-pip3.py

# Install pip2
cd /opt/
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
python ./get-pip.py

# Setup pip3
sudo apt install python3-pip -y
ln -s /usr/bin/pip3.11 /usr/bin/pip3

# Install bloodhound python linux tool
pip3 install bloodhound

# Install neo4j and bloodhound 4.3.1 GUI
sudo apt-get install apt-transport-https -y
sudo apt-get install neo4j -y
sudo apt-get install bloodhound -y

# Install dnsreaper
cd /opt/
git clone https://github.com/punk-security/dnsReaper.git
cd dnsReaper
pip3 install -r ./requirements.txt

# Install golang tools, golang is already the latest 1.22.2
go install github.com/ffuf/ffuf@latest
go install github.com/Ice3man543/SubOver@latest
go install github.com/c-sto/recursebuster@latest
go install github.com/C-Sto/BananaPhone@latest
go install github.com/C-Sto/encembed@latest
go install github.com/cjbassi/gotop@latest
go install github.com/tomnomnom/gron@latest
go install github.com/tomnomnom/httprobe@latest
go install github.com/jaeles-project/gospider@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest

# Add go root to $PATH:
echo 'export PATH="$PATH:/root/.local/bin:/root/go/bin"' >> /root/.zshrc
source /root/.zshrc

# Install nexexec
sudo apt install pipx git -y
pipx ensurepath
pipx install git+https://github.com/Pennyw0rth/NetExec

# Install gosecrtsdump
#wget https://github.com/C-Sto/gosecretsdump/releases/download/v0.3.1/gosecretsdump_linux_v0.3.1 -O /usr/local/bin/gosecretsdump
#chmod +x /usr/local/bin/gosecretsdump


cd /opt/

# Install naabu and nuclei
sudo apt install -y libpcap-dev
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

# Install RustScan
###! update the URL before run this script
#wget https://github.com/RustScan/RustScan/releases/download/1.7.1/rustscan_1.7.1_amd64.deb
#dpkg -i rustscan_1.7.1_amd64.deb
#rm rustscan_1.7.1_amd64.deb

# Install gp3finder
#git clone https://bitbucket.org/grimhacker/gpppfinder.git
#cd gpppfinder
#python3 setup.py install
#cd /opt/

# Install latest smbmap
#git clone https://github.com/ShawnDEvans/smbmap.git
#cd /opt/smbmap/
#pip3 install -r requirements.txt
#cd /opt/

# Install latest Crackmapexec
# python3 -m pip install pipx
# pipx ensurepath
# pipx install crackmapexec

# Install latest aquatone
###! update this before run the script
apt install chromium -y
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip aquatone
mv aquatone /usr/local/bin/
rm aquatone_linux_amd64_1.7.0.zip

# Install takeover
#git clone https://github.com/m4ll0k/takeover.git
#chmod +x takeover/takeover.py

# Install jwt_tool
#cd /opt/
#git clone https://github.com/ticarpi/jwt_tool.git

# Install nullinux
cd /opt/
git clone https://github.com/m8r0wn/nullinux.git
cd nullinux
sudo ./setup.sh
cp nullinux.py /usr/local/bin/
cd ..

# Install Windows-Exploit-Suggester next gen
cd /opt/
pip3 install xlrd==1.2.0
git clone https://github.com/bitsadmin/wesng --depth 1
cd wesng
sudo ./wes.py --update
cd ..

# Install SIET
#git clone https://github.com/Sab0tag3d/SIET.git

# Install Seth RDP MiTM tool
#git clone https://github.com/SySS-Research/Seth

# Install Infoga
#git clone https://github.com/The404Hacking/Infoga.git

# Install CloudFail
git clone https://github.com/m0rtem/CloudFail.git
cd CloudFail
pip3 install -r requirements.txt
cd ..

# Install CMSmap
#git clone https://github.com/Dionach/CMSmap
#cd CMSmap
#pip3 install .
#cd ..

# Install XSStrike
#git clone https://github.com/s0md3v/XSStrike.git
#cd XSStrike
#pip3 install -r requirements.txt
#chmod +x xsstrike.py
#cd ..

# Install google chrome
cd /opt/
apt install libu2f-udev -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
cd ..

# Install firefox
# Make sure to set default browwer back to Firefox:
# "Settings Manager" -> "Default Applications" -> "Web Browser" -> choose "Firefox"
#cd /opt/
#curl -L "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64" --output ./firefox-latest.tar.bz2
#tar xjf ./firefox-latest.tar.bz2
#mv /usr/bin/firefox /usr/bin/firefox_old
#ln -s /opt/firefox/firefox /usr/bin/firefox
#rm -rf /opt/firefox-latest.tar.bz2
#cd ..


# Install webscreenshot
##sudo apt-get install phantomjs
##pip install webscreenshot

# Install adb
apt install adb -y

# Install objection
pip3 install objection

# Install dex2jar
## https://github.com/pxb1988/dex2jar

# Install apktool
## https://ibotpeaches.github.io/Apktool/install/

# Download CharpCollection
cd /var/www/html/
git clone https://github.com/Flangvik/SharpCollection.git

# Download PowerSharpLoader
cd /var/www/html/
git clone https://github.com/F4l13n5n0w/PowerSharpLoader.git


mkdir /var/www/html/privesc
# Download Linux priv escalation enumeration scripts
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh -O /var/www/html/privesc/LinEnum.sh
wget https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py -O /var/www/html/privesc/linuxprivchecker.py
wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -O /var/www/html/privesc/linux-exploit-suggester.sh
wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl -O /var/www/html/privesc/linux-exploit-suggester-2.pl
# Need to change the URL to get the lastest linpeas
#wget https://github.com/carlospolop/PEASS-ng/releases/download/20221204/linpeas.sh -O /var/www/html/privesc/linpeas.sh
#wget https://github.com/carlospolop/PEASS-ng/releases/download/20221204/linpeas_linux_amd64 -O /var/www/html/privesc/linpeasx64

# Create and setup windows web folder
mkdir /var/www/html/windows

# copy nc.exe to windows web folder
cp /usr/share/windows-resources/binaries/nc.exe /var/www/html/windows/nc.exe
# Download PrivescCheck.ps1
wget https://raw.githubusercontent.com/itm4n/PrivescCheck/master/PrivescCheck.ps1 -O /var/www/html/windows/privcheck.ps1
# Download JAWS Enumeration script
wget https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1 -O /var/www/html/windows/jaws-enum.ps1
# Download Sherlock.ps1
wget https://raw.githubusercontent.com/rasta-mouse/Sherlock/master/Sherlock.ps1 -O /var/www/html/windows/Sherlock.ps1
# Download Rubeus.exe
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe -O /var/www/html/windows/Rubeus.exe
# Download Grouper3r.exe
wget https://github.com/Group3r/Group3r/releases/download/1.0.13/Group3r.exe -O /var/www/html/windows/Grouper3r.exe
# Download gp3finder.exe
wget https://bitbucket.org/grimhacker/gpppfinder/downloads/gp3finder_v4.0.exe -O /var/www/html/windows/gp3finder.exe
# Download WindowsEnum.ps1
wget https://raw.githubusercontent.com/absolomb/WindowsEnum/master/WindowsEnum.ps1 -O /var/www/html/windows/WindowsEnum.ps1
#wget https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/winPEAS/winPEASbat/winPEAS.bat -O /var/www/html/windows/winPEAS.bat
# Download the latest PowerView.ps1
#wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/dev/Recon/PowerView.ps1 -O /var/www/html/windows/PowerView.ps1
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1 -O /var/www/html/windows/powerview_original.ps1
wget https://raw.githubusercontent.com/ZeroDayLab/PowerSploit/master/Recon/PowerView.ps1 -O /var/www/html/windows/powerview.ps1
# Download SharpHound
wget https://github.com/BloodHoundAD/AzureHound/releases/download/v1.2.2/azurehound-windows-amd64.zip -O /var/www/html/windows/AzureHound.zip
wget https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.exe -O /var/www/html/windows/SharpHound.exe
wget https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.ps1 -O /var/www/html/windows/SharpHound.ps1
# Download Procdump tools
wget https://download.sysinternals.com/files/Procdump.zip -O /var/www/html/windows/Procdump.zip
cd /var/www/html/windows
unzip Procdump.zip procdump.exe procdump64.exe
rm Procdump.zip
cd /opt/


# Install PEASS-NG priv esc tools
apt install peass -y
cp /usr/share/peass/linpeas/linpeas.sh /var/www/html/privesc/linpeas.sh
cp /usr/share/peass/linpeas/linpeas_linux_amd64 /var/www/html/privesc/linpeas_linux_amd64
cp /usr/share/peass/winpeas/winPEAS.bat /var/www/html/windows/winPEAS.bat
cp /usr/share/peass/winpeas/winPEASany_ofs.exe /var/www/html/windows/winPEASany_ofs.exe

# Install webfuzz.txt
wget https://raw.githubusercontent.com/C-Sto/scrap/master/webfuzz.txt -O /usr/share/wordlists/webfuzz.txt


## Install CloudFlared
## Download the latest cloudflared
cd /opt/
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -O cloudflared-stable-linux-amd64.deb
dpkg -i ./cloudflared-stable-linux-amd64.deb
rm -rf ./cloudflared-stable-linux-amd64.deb


# Install MONO .NET framwork compiler
#sudo apt install apt-transport-https dirmngr gnupg ca-certificates -y
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
#sudo apt update
sudo apt-get install mono-complete -y

# Download mount-shared-folder.sh script
wget https://raw.githubusercontent.com/F4l13n5n0w/handy-tools/master/mount-shared-folder.sh -O /root/mount-shared-folder.sh
chmod +x /root/mount-shared-folder.sh

# Change hostname 
echo "127.0.0.1   average-student" >> /etc/hosts
hostnamectl set-hostname average-student


# Install Insomnia
cd /opt/
curl -1sLf 'https://packages.konghq.com/public/insomnia/setup.deb.sh' | sudo -E distro=ubuntu codename=focal bash
sudo apt-get update
sudo apt-get install insomnia -y


# Install Burp Suite Pro
# Make sure to change to latest version numer in the URL
cd /opt/
curl -L "https://portswigger.net/burp/releases/download?product=pro&type=Linux" -o burppro.sh
chmod +x burppro.sh
./burppro.sh