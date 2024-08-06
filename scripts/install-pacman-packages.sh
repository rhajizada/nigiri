NIGIRI=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")
echo "Installing pacman packages"
sudo pacman -Syu --noconfirm
cat $NIGIRI/requirements/pacman/packages.txt | xargs sudo pacman -S --needed --noconfirm
