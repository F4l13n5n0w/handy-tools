#!/bin/bash

echo "[+] install handy tools for kali 2022.2 VM"

## in 2022.2 to install gnome-terminal:
## Ref: https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/
## echo "deb http://http.kali.org/kali kali-experimental main contrib non-free" | sudo tee /etc/apt/sources.list.d/kali-experimental.list
## echo "deb http://http.kali.org/kali kali-bleeding-edge main contrib non-free" | sudo tee /etc/apt/sources.list.d/kali-bleeding-edge.list
## apt update
## apt install gnome-terminal -y
## rm *.list

#sudo apt-get remove crackmapexec smbmap python3-pip

sudo apt-get update 
sudo apt-get full-upgrade -y
sudo apt --fix-broken install

sudo apt-get install -y dirsearch pacu feroxbuster cloudbrute golang python3-pip plank flameshot
sudo apt-get install -y testssl.sh seclists neofetch lolcat gnome-terminal subfinder gron jq ansible
sudo apt-get install -y gnupg software-properties-common curl
#sudo apt-get install -y kali-community-wallpapers
#sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
#sudo pip install wheel

# Install sublime-text4
cd /opt/
wget https://download.sublimetext.com/sublime-text_build-4143_amd64.deb -O sublime4.deb
dpkg -i ./sublime4.deb
rm -rf ./sublime4.deb


# Install VS code
## download deb installer from the website: https://code.visualstudio.com/docs/?dv=linux64_deb
## install plugins: GIST, Github, Github Pull Requests and Issues, Remote-SSH, Go, PowerShell, AWS Toolkit, Python
## Add email and name:
## git config --global user.email "fallensnow.qing@gmail.com"
## git config --global user.name "F4l13n5n0w"

curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" --output /opt/vscode_amd64.deb
dpkg -i /opt/vscode_amd64.deb

# Create softlink for python2 to python
rm -rf /usr/bin/python
rm -rf /usr/bin/python3
ln -s /usr/bin/python2.7 /usr/bin/python
ln -s /usr/bin/python3.10 /usr/bin/python3

# Install pip3
cd /opt/
curl https://bootstrap.pypa.io/get-pip.py -o get-pip3.py
python3 ./get-pip3.py

# Install pip2
cd /opt/
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
python ./get-pip.py

# Install bloodhound python linux tool
pip3 install bloodhound

# Install neo4j and bloodhound GUI
## reboot is required after neo4j DB installed.
## make sure to use the latest version: https://github.com/BloodHoundAD/BloodHound/releases/latest
## use the following command to start neo4j, login using default creds: neo4j/neo4j and change to a new password
##   neo4j console
#wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
#echo 'deb https://debian.neo4j.com stable 4.0' > /etc/apt/sources.list.d/neo4j.list
#sudo apt-get update

sudo apt-get install apt-transport-https -y
sudo apt-get install neo4j -y

cd /opt/
wget https://github.com/BloodHoundAD/BloodHound/releases/download/4.1.0/BloodHound-linux-x64.zip -O BloodHound-linux-x64.zip
unzip BloodHound-linux-x64.zip
ln -s /opt/BloodHound-linux-x64/BloodHound /usr/bin/bloodhound
rm BloodHound-linux-x64.zip

# Install httpx
#pip3 install httpx
apt install python3-httpx -y

# Install golang tools
go install github.com/ffuf/ffuf@latest
go install github.com/Ice3man543/SubOver@latest
go install github.com/c-sto/recursebuster@latest
go install github.com/C-Sto/BananaPhone@latest
go install github.com/C-Sto/encembed@latest
go install github.com/cjbassi/gotop@latest
go install github.com/tomnomnom/gron@latest
go install github.com/tomnomnom/httprobe@latest
go install github.com/jaeles-project/gospider@latest

# Add go root to $PATH:
echo 'export PATH="$PATH:/root/.local/bin:/root/go/bin"' >> /root/.zshrc
source /root/.zshrc

# Install evil-winrm
gem install evil-winrm

# Install gosecrtsdump
wget https://github.com/C-Sto/gosecretsdump/releases/download/v0.3.1/gosecretsdump_linux_v0.3.1 -O /usr/local/bin/gosecretsdump
chmod +x /usr/local/bin/gosecretsdump


cd /opt/

# Install naabu
sudo apt install -y libpcap-dev
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
# Install httpx
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
# Install nuclei
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
apt install chromium
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
git clone https://github.com/m8r0wn/nullinux.git
cd nullinux
sudo ./setup.sh
cp nullinux.py /usr/local/bin/
cd ..

# Install Windows-Exploit-Suggester
pip install xlrd==1.2.0
git clone https://github.com/GDSSecurity/Windows-Exploit-Suggester
cd Windows-Exploit-Suggester
sudo ./windows-exploit-suggester.py --update
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
git clone https://github.com/Dionach/CMSmap
cd CMSmap
pip3 install .
cd ..

# Install XSStrike
git clone https://github.com/s0md3v/XSStrike.git
cd XSStrike
pip3 install -r requirements.txt
chmod +x xsstrike.py
cd ..

# Install google chrome
cd /opt/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
cd ..

# Install firefox
# Make sure to set default browwer back to Firefox:
# "Settings Manager" -> "Default Applications" -> "Web Browser" -> choose "Firefox"
cd /opt/
curl -L "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64" --output ./firefox-latest.tar.bz2
tar xjf ./firefox-latest.tar.bz2
mv /usr/bin/firefox /usr/bin/firefox_old
ln -s /opt/firefox/firefox /usr/bin/firefox
rm -rf /opt/firefox-latest.tar.bz2
cd ..


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


# Install MONO .NET framwork compiler
sudo apt install apt-transport-https dirmngr gnupg ca-certificates -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt-get install mono-complete -y

# Download mount-shared-folder.sh script
wget https://raw.githubusercontent.com/F4l13n5n0w/handy-tools/master/mount-shared-folder.sh -O /root/mount-shared-folder.sh
chmod +x /root/mount-shared-folder.sh

# Change hostname 
echo "127.0.0.1   average-student" >> /etc/hosts
hostnamectl set-hostname average-student

# Install Burp Suite Pro
# Make sure to change to latest version numer in the URL
curl -L "https://portswigger.net/burp/releases/download?product=pro&type=Linux" -o burppro.sh
chmod +x burppro.sh
./burppro.sh