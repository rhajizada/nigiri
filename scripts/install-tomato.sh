cd /tmp
git clone https://github.com/gabrielzschmitz/Tomato.C.git
cd Tomato.C
sudo make install
cd --
rm -rf /tmp/Tomato.C
echo "Installing 'Tomato.C' gnome extension"
gext install tomato-c-to-panel@thomas-philippot.dev