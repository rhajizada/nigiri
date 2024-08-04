HOME=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")
export PATH="$HOME/.local/bin:$PATH"
pipx install gnome-extensions-cli --system-site-packages
cat $HOME/requirements/pacman/packages.txt | xargs gext install
