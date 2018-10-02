#!/bin/bash

sudo apt-get install golang python3-pip
sudo apt-get install testssl.sh

go get subfinder
go get recursebuster

cd /opt/

# Install SecLists
git clone https://github.com/danielmiessler/SecLists.git

# Install jwt_tool
git clone https://github.com/ticarpi/jwt_tool.git

# Install CMSmap
git clone https://github.com/Dionach/CMSmap
cd CMSmap
pip3 install .


cd /opt/
