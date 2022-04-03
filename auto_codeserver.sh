## This is used to automatically install code server on a Linode Ubuntu 21.10 LTS VPS.
## 1. download and run this script on the new Linode Linux VPS
## 2. Config c0der.xyz to the new public IP address of the Linode Server
## 3. manual config the Chaddy config file to setup HTTPS for the code server.
## 

## pre-install setup
sudo apt update -y
sudo apt full-upgrade -y
sudo apt install net-tools python3 golang tmux -y

## install the latest mono-complete (https://www.mono-project.com/download/stable/#download-lin-ubuntu)
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-complete -y

## install code-server
cd /opt
wget https://code-server.dev/install.sh
chmod +x install.sh
./install.sh
systemctl enable --now code-server@$USER

## install caddy and setup HTTPS for c0der.xyz
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/cfg/gpg/gpg.155B6D79CA56EA34.key' | sudo apt-key add -
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/cfg/setup/config.deb.txt?distro=debian&version=any-version' | sudo tee -a /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

## change file /etc/caddy/Caddyfile as follow and reload caddy:
#
# c0der.xyz {
#     reverse_proxy 127.0.0.1:8080
# }
#

sudo systemctl reload caddy

## Done, wait for couple of minutes and everything should works

## setup ufw to only allow port 22 and 443
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow https
sudo ufw enable