#!/bin/bash

read -p "Is this a desktop installation? [y/n]: "  desktop

# install all necessary software
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo add-apt-repository ppa:papirus/papirus
sudo add-apt-repository ppa:noobslab/themes
sudo apt update
## general tools
sudo apt install suckless-tools thunar alsa-utils xbacklight feh lxappearance gtk-chtheme qt4-qtconfig i3status net-tools gucharmap git i3lock gpick vim bc xclip xdotool xsel
## icon theme and gtk theme
sudo apt install arc-theme papirus-icon-theme
## convert images
sudo apt install imagemagick
## i3 and polybar
sudo apt install polybar i3-wm

# experimental
## solution for font problems
sudo apt install fonts-font-awesome
git clone https://github.com/stark/siji && cd siji
./install.sh
### remove the siji files
cd ..
rm -rf siji
## install rofi themes
mkdir -p ~/.config/rofi
cp rofi/config.rasi ~/.config/rofi/config.rasi
### copy themes
mkdir -p ~/.config/rofi/themes
cp rofi/themes/* ~/.config/rofi/themes/
### copy icons
mkdir -p ~/.icons
cp -r /usr/share/icons/* ~/.icons/

# configure i3 and polybar
mkdir -p ~/.config/i3/
mkdir -p ~/.config/polybar/
$if["$desktop" == "y"]
then
    cp i3/config_desktop ~/.config/i3/config
else
    cp i3/config_laptop ~/.config/i3/config
fi
cp polybar/* ~/.config/polybar/