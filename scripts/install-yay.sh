echo "Installing yay"
sudo pacman -Syu --needed --noconfirm git base-devel
cd /tmp && git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm
cd .. && rm -rf yay
