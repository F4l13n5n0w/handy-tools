#!/bin/bash

echo "[+] install handy tools for kali 2020.2 VM"

sudo apt-get remove crackmapexec smbmap python3-pip

sudo apt-get update
sudo apt-get full-upgrade -y
sudo apt-get install -y python3-pip python-pip golang 
sudo apt-get install -y testssl.sh seclists neofetch plank lolcat gnome-terminal apt-transport-https
sudo apt-get install -y kali-community-wallpapers
sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
sudo pip install wheel

# Install sublime-text3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Install VS code
###! update this link before run this script
#wget https://az764295.vo.msecnd.net/stable/5763d909d5f12fe19f215cbfdd29a91c0fa9208a/code_1.45.1-1589445302_amd64.deb
sudo apt install /root/hivint/tmp/hivint-kali-backup/code_1.45.1-1589445302_amd64.deb


# Install bloodhound python linux tool
pip install bloodhound

# Install golang tools
go get github.com/Ice3man543/SubOver
go get github.com/subfinder/subfinder
go get github.com/c-sto/recursebuster
go get github.com/ffuf/ffuf
go get github.com/cjbassi/gotop
go get -u github.com/tomnomnom/gron
go get -u github.com/tomnomnom/httprobe
go get -u github.com/jaeles-project/gospider

# Install evil-winrm
gem install evil-winrm

# Install gosecrtsdump
wget https://github.com/C-Sto/gosecretsdump/releases/download/v0.3.0/gosecretsdump_linux_v0.3.0 -O /usr/local/bin/gosecretsdump
chmod +x /usr/local/bin/gosecretsdump


cd /opt/

# Install RustScan
###! update the URL before run this script
wget https://github.com/RustScan/RustScan/releases/download/1.7.1/rustscan_1.7.1_amd64.deb
dpkg -i rustscan_1.7.1_amd64.deb
rm rustscan_1.7.1_amd64.deb

# Install gp3finder
git clone https://bitbucket.org/grimhacker/gpppfinder.git
cd gpppfinder
python3 setup.py install
cd /opt/

# Install latest smbmap
git clone https://github.com/ShawnDEvans/smbmap.git
cd /opt/smbmap/
pip3 install -r requirements.txt
cd /opt/

# Install latest Crackmapexec
#wget https://github.com/byt3bl33d3r/CrackMapExec/releases/download/v5.0.2dev/cme-ubuntu-latest.zip
#unzip cme-ubuntu-latest.zip
#chmod +x cme
#mv cme /usr/local/bin/
#rm cme-ubuntu-latest.zip
git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec
cd CrackMapExec
python3 setup.py install
cd /opt/

# Install latest aquatone
###! update this before run the script
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip aquatone
mv aquatone /usr/local/bin/
rm aquatone_linux_amd64_1.7.0.zip

# Install takeover
git clone https://github.com/m4ll0k/takeover.git
chmod +x takeover/takeover.py

# Install jwt_tool
cd /opt/
git clone https://github.com/ticarpi/jwt_tool.git

# Install nullinux
git clone https://github.com/m8r0wn/nullinux.git
cd nullinux
sudo ./setup.sh
cd ..

# Install Windows-Exploit-Suggester
git clone https://github.com/GDSSecurity/Windows-Exploit-Suggester
cd Windows-Exploit-Suggester
sudo ./windows-exploit-suggester.py --update
cd ..

# Install SIET
git clone https://github.com/Sab0tag3d/SIET.git

# Install Seth RDP MiTM tool
git clone https://github.com/SySS-Research/Seth

# Install Infoga
git clone https://github.com/The404Hacking/Infoga.git

# Install dirsearch
git clone https://github.com/maurosoria/dirsearch.git

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

# Install webscreenshot
sudo apt-get install phantomjs
pip install webscreenshot



mkdir /var/www/html/privesc
# Download Linux priv escalation enumeration scripts
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh -O /var/www/html/privesc/LinEnum.sh
wget https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py -O /var/www/html/privesc/linuxprivchecker.py
wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -O /var/www/html/privesc/linux-exploit-suggester.sh
wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl -O /var/www/html/privesc/linux-exploit-suggester-2.pl
wget https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh -O /var/www/html/privesc/linpeas.sh


# Create and setup windows web folder
mkdir /var/www/html/windows

# copy nc.exe to windows web folder
cp /usr/share/windows-resources/binaries/nc.exe /var/www/html/windows/nc.exe
# Download JAWS Enumeration script
wget https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1 -O /var/www/html/windows/jaws-enum.ps1
# Download Sherlock.ps1
wget https://raw.githubusercontent.com/rasta-mouse/Sherlock/master/Sherlock.ps1 -O /var/www/html/windows/Sherlock.ps1
# Download Rubeus.exe
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe -O /var/www/html/windows/Rubeus.exe
# Download Grouper2.exe
wget https://github.com/l0ss/Grouper2/releases/download/0.9.64/Grouper2.exe -O /var/www/html/windows/Grouper2.exe
# Download gp3finder.exe
wget https://bitbucket.org/grimhacker/gpppfinder/downloads/gp3finder_v4.0.exe -O /var/www/html/windows/gp3finder.exe
# Download WindowsEnum.ps1
wget https://raw.githubusercontent.com/absolomb/WindowsEnum/master/WindowsEnum.ps1 -O /var/www/html/windows/WindowsEnum.ps1
wget https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/winPEAS/winPEASbat/winPEAS.bat -O /var/www/html/windows/winPEAS.bat
# Download the latest PowerView.ps1
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/dev/Recon/PowerView.ps1 -O /var/www/html/windows/PowerView.ps1
# Download SharpHound
wget https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Ingestors/SharpHound.ps1 -O /var/www/html/windows/SharpHound.ps1
wget https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Ingestors/SharpHound.exe -O /var/www/html/windows/SharpHound.exe
# Download Procdump tools
wget https://download.sysinternals.com/files/Procdump.zip -O /var/www/html/windows/Procdump.zip
cd /var/www/html/windows
unzip Procdump.zip procdump.exe procdump64.exe
rm Procdump.zip
cd /opt/



# Install webfuzz.txt
wget https://raw.githubusercontent.com/C-Sto/scrap/master/webfuzz.txt -O /usr/share/wordlists/webfuzz.txt

