#!/bin/bash

read -p "Is this a desktop installation? [y/n]: "  desktop

# install all necessary software
sudo add-apt-repository ppa:kgilmer/speed-ricer -y
sudo add-apt-repository ppa:papirus/papirus -y
sudo add-apt-repository ppa:noobslab/themes -y
sudo apt update
## general tools
sudo apt -y install suckless-tools tree  curl thunar alsa-utils xbacklight feh lxappearance gtk-chtheme qt4-qtconfig i3status net-tools gucharmap git i3lock gpick vim bc xclip xdotool xsel
## icon theme and gtk theme
sudo apt -y install arc-theme papirus-icon-theme
## convert images
sudo apt -y install imagemagick
## i3, polybar and rofi
sudo apt -y install polybar i3-gaps-wm rofi
-
# experimental
## solution for font problems
sudo apt -y install fonts-font-awesome
git clone https://github.com/stark/siji
cd siji
sudo bash install.sh
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
if [ "$desktop" == "y" ]; then
    cp i3/config_desktop ~/.config/i3/config
    cp polybar/config_desktop ~/.config/polybar/config
else
    cp i3/config_laptop ~/.config/i3/config
    cp polybar/config_default ~/.config/polybar/config
fi
cp polybar/launch.sh ~/.config/polybar/

# copy wallpapers
cp -r wallpapers/ ~/Pictures/wallpapers/

# install vs code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt -y install apt-transport-https
sudo apt update
sudo apt -y install code
