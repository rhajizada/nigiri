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
  local required=$3

  while true; do
    if $noconfirm && $required; then
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

prompt_script "Do you want to install pacman packages?" "$NIGIRI/scripts/install-pacman-packages.sh" true
if ! command -v yay >/dev/null 2>&1; then
  prompt_script "Do you want to install yay?" "$NIGIRI/scripts/install-yay.sh" true
fi
prompt_script "Do you want to install yay packages?" "$NIGIRI/scripts/install-yay-packages.sh" true
if ! command -v brew >/dev/null 2>&1; then
  prompt_script "Do you want to install brew?" "$NIGIRI/scripts/install-brew.sh" true
fi
prompt_script "Do you want to install nerd fonts?" "$NIGIRI/scripts/install-fonts.sh" true
prompt_script "Do you want to enable system services?" "$NIGIRI/scripts/enable-services.sh" true
prompt_script "Do you want to install gnome extensions?" "$NIGIRI/scripts/install-gnome-extensions.sh" true
prompt_script "Do you want to install docker?" "$NIGIRI/scripts/install-docker.sh" false
prompt_script "Do you want to install snapd" "$NIGIRI/scripts/install-snapd.sh" false
prompt_script "Do you want to install k8s?" "$NIGIRI/scripts/install-k8s.sh" false
prompt_script "Do you want to install libreoffice?" "$NIGIRI/scripts/install-libreoffice.sh" false
prompt_script "Do you want to install Tomato.C?" "$NIGIRI/scripts/install-tomato.sh" false
