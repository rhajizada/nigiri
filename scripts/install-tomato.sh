echo "Installing pre-requisites for Tomato.c"
sudo pacman -S --noconfirm base-devel ncurses mpv pkgconf libnotify
echo "Installing Tomato.C"
cd /tmp
git clone https://github.com/gabrielzschmitz/Tomato.C.git
cd Tomato.C
sudo make install
cd --
rm -rf /tmp/Tomato.C
echo "Installing 'Tomato.C' gnome extension"
gext install tomato-c-to-panel@thomas-philippot.dev
