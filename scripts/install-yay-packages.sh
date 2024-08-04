HOME=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")
cat $HOME/requirements/yay/packages.txt | xargs yay -S --needed --noconfirm
