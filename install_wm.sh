#!/bin/bash

## install rofi themes
mkdir -p ~/.config/rofi
cp rofi/config.rasi ~/.config/rofi/config.rasi
### copy themes
mkdir -p ~/.config/rofi/themes
cp rofi/themes/* ~/.config/rofi/themes/
### copy icons
mkdir -p ~/.icons
cp -r /usr/share/icons/* ~/.icons/

# configure i3
mkdir -p ~/.config/i3/
cp i3/config_desktop ~/.config/i3/config

# copy wallpapers
cp -r wallpapers/ ~/Pictures/wallpapers/

## solution for font problems
sudo apt -y install fonts-font-awesome
git clone https://github.com/stark/siji
cd siji
sudo bash install.sh
### remove the siji files
cd ..
rm -rf siji

## terminal
wget https://github.com/r3tex/one-dark/archive/master.zip
unzip master.zip
mv one-dark-master/bashrc ~/.bashrc
mv one-dark-master/onedark_prompt.sh ~/.onedark_prompt.sh
mv one-dark-master/dircolors ~/.dircolors
rm master.zip
rm -r one-dark-master
echo "test -r ~/.dircolors && eval \"$(dircolors -b ~/.dircolors)\" || eval \"$(dircolors -b)\"" >> ~/.bashrc

# Enable terminal color scheme
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"
