if ! command -v zsh &>/dev/null; then
  echo "Installing Zsh"
  sudo pacman -Syu --noconfirm zsh
else
  echo "Zsh is already installed"
fi

# Check if Zsh is already the default shell
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "Setting Zsh as the default shell"
  chsh -s /bin/zsh
else
  echo "Zsh is already the default shell"
fi
