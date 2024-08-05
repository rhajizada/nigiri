set -e

HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DISTRO=$(cat /etc/os-release 2>/dev/null | grep ^ID= | cut -d= -f2)
UNAME=$(uname 2>/dev/null)

prompt_script() {
  local prompt=$1
  local script=$2

  while true; do
    read -p "$prompt (y/n): " response
    case "$response" in
    [yY] | [yY][eE][sS])
      source $script
      break
      ;;
    [nN] | [nN][oO])
      break
      ;;
    *)
      echo "Invalid input. Please enter y/yes or n/no."
      ;;
    esac
  done
}

if [[ $UNAME != "Linux" ]]; then
  echo "nigiri not supported on $UNAME"
  exit 1
fi

if [[ $DISTRO != "arch" ]]; then
  echo "nigiri not supported on $DISTRO"
  exit 1
fi

prompt_script "Do you want to install pacman packages?" "$HOME/scripts/install-pacman-packages.sh"
if ! command -v yay >/dev/null 2>&1; then
  prompt_script "Do you want to install yay?" "$HOME/scripts/install-yay.sh"
fi
prompt_script "Do you want to install yay packages?" "$HOME/scripts/install-yay-packages.sh"
prompt_script "Do you want to enable system service?" "$HOME/scripts/enable-services.sh"
prompt_script "Do you want to install gnome extensions?" "$HOME/scripts/install-gnome-extensions.sh"
prompt_script "Do you want to install nerd fonts?" "$HOME/scripts/install-fonts.sh"
prompt_script "Do you want to install 'docker'?" "$HOME/scripts/install-docker.sh"
prompt_script "Do you want to install 'libreoffice'?" "$HOME/scripts/install-libreoffice.sh"
