#!/bin/bash

# Add necessary ppa's
sudo add-apt-repository ppa:kgilmer/speed-ricer -y
sudo add-apt-repository ppa:papirus/papirus -y
sudo add-apt-repository universe

# update
sudo apt update

## general tools
sudo apt -y install software-properties-common 
sudo apt -y install apt-transport-https 
sudo apt -y install wget
sudo apt -y install curl 
sudo apt -y install suckless-tools 
sudo apt -y install tree 
sudo apt -y install curl 
sudo apt -y install thunar 
sudo apt -y install alsa-utils 
sudo apt -y install xbacklight 
sudo apt -y install feh 
sudo apt -y install lxappearance 
sudo apt -y install i3status 
sudo apt -y install net-tools 
sudo apt -y install git
sudo apt -y install i3lock 
sudo apt -y install gpick 
sudo apt -y install vim 
sudo apt -y install bc 
sudo apt -y install xclip 
sudo apt -y install python3-pip
sudo apt -y install vlc
sudo apt -y install gconf2

## icon theme, theme and font
sudo apt -y install arc-theme 
sudo apt -y install papirus-icon-theme
sudo apt -y install fonts-firacode

## convert images
sudo apt -y install imagemagick

## i3, polybar and rofi
sudo apt -y install polybar 
sudo apt -y install rofi 
sudo apt -y install i3-gaps

## code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

## discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
rm discord.deb

## spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get install spotify-client -y

## fix broken
sudo apt --fix-broken install -y
