mkdir -p /tmp/brew
cd /tmp/brew
wget https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
chmod +x install.sh
./install.sh
cd --
rm -rf /tmp/brew
