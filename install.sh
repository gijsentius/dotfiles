#!/bin/bash

# install all necessary software
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update
sudo apt install suckless-tools thunar alsa-utils xbacklight feh lxappearance gtk-chtheme qt4-qtconfig i3status net-tools gucharmap git i3lock gpick polybar i3-wm polybar

# experimental
sudo apt install fonts-font-awesome
# change to temp directory
git clone https://github.com/stark/siji && cd siji
./install.sh
cd ..
rm -rf siji