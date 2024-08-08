# Install Nerd fonts
cd /tmp
echo "Installing fonts"
mkdir -p $HOME/.local/share 2>/dev/null
mkdir -p $HOME/.local/share/fonts 2>/dev/null
if [ $(ls $HOME/.local/share/fonts/CaskaydiaMono*.ttf 2>/dev/null | wc -l) -ne 36 ]; then
  echo "Installing 'CascadiaMono'"
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
  unzip CascadiaMono.zip -d CascadiaFont
  cp CascadiaFont/*.ttf $HOME/.local/share/fonts
  rm -rf CascadiaMono.zip CascadiaFont
else
  echo "'CascadiaMono' is already installed"
fi
if [ $(ls $HOME/.local/share/fonts/JetBrainsMono*.ttf 2>/dev/null | wc -l) -ne 96 ]; then
  echo "Installing 'JetBrainsMono'"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
  unzip JetBrainsMono.zip -d JetBrainsMono
  cp JetBrainsMono/*.ttf $HOME/.local/share/fonts
  rm -rf JetBrainsMono.zip JetBrainsMono
else
  echo "'JetBrainsMono' is already installed"
fi
if [ $(ls $HOME/.local/share/fonts/Meslo*.ttf 2>/dev/null | wc -l) -ne 72 ]; then
  echo "Installing 'Meslo'"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
  unzip Meslo.zip -d Meslo
  cp Meslo/*ttf $HOME/.local/share/fonts
  rm -rf Meslo.zip Meslo
else
  echo "'Meslo' is already installed"
fi
cd --
fc-cache
