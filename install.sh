#!/bin/bash

set -e

usage() {
  echo "Usage: $0 [--noconfirm]"
  echo "  --noconfirm    Disable confirmation prompts"
  exit 1
}

noconfirm=false

while [[ "$#" -gt 0 ]]; do
  case $1 in
  --noconfirm)
    noconfirm=true
    ;;
  -h | --help)
    usage
    ;;
  *)
    echo "Unknown option: $1"
    usage
    ;;
  esac
  shift
done

NIGIRI="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DISTRO=$(cat /etc/os-release 2>/dev/null | grep ^ID= | cut -d= -f2)
UNAME=$(uname 2>/dev/null)

prompt_script() {
  local prompt=$1
  local script=$2

  while true; do
    if $noconfirm; then
      source $script
      break
    else
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
    fi
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

prompt_script "Do you want to install pacman packages?" "$NIGIRI/scripts/install-pacman-packages.sh"
if ! command -v yay >/dev/null 2>&1; then
  prompt_script "Do you want to install yay?" "$NIGIRI/scripts/install-yay.sh"
fi
prompt_script "Do you want to install yay packages?" "$NIGIRI/scripts/install-yay-packages.sh"
if ! command -v brew >/dev/null 2>&1; then
  prompt_script "Do you want to install brew?" "$NIGIRI/scripts/install-brew.sh"
fi
prompt_script "Do you want to install nerd fonts?" "$NIGIRI/scripts/install-fonts.sh"
prompt_script "Do you want to install squashfs" "$NIGIRI/scripts/enable-squashfs.sh"
prompt_script "Do you want to enable system services?" "$NIGIRI/scripts/enable-services.sh"
prompt_script "Do you want to install gnome extensions?" "$NIGIRI/scripts/install-gnome-extensions.sh"
prompt_script "Do you want to install docker?" "$NIGIRI/scripts/install-docker.sh"
prompt_script "Do you want to install snapd" "$NIGIRI/scripts/install-snapd.sh"
prompt_script "Do you want to install k8s?" "$NIGIRI/scripts/install-k8s.sh"
prompt_script "Do you want to install libreoffice?" "$NIGIRI/scripts/install-libreoffice.sh"
prompt_script "Do you want to install Tomato.C?" "$NIGIRI/scripts/install-tomato.sh"
