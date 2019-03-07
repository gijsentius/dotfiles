# Install i3-gaps
cd /path/where/you/want/the/repository

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

sudo apt install i3status i3lock
sudo cp i3/i3status.conf /etc/i3status.conf
