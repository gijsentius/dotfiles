DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install i3-gaps
cd ~/Downloads 
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

cd ${DIR}

sudo apt install i3status i3lock
sudo cp i3/i3status.conf /etc/i3status.conf
sudo cp i3/config ~/.config/i3/config

sudo apt install neovim


