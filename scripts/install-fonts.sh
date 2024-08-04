# Install Nerd fonts
cd /tmp
echo "Installing fonts"
mkdir -p ~/.local/share /dev/null 2>/dev/null
mkdir -p ~/.local/share/fonts /dev/null 2>/dev/null
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp CascadiaFont/*.ttf $(HOME)/.local/share/fonts
rm -rf CascadiaMono.zip CascadiaFont
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
cp JetBrainsMono/*.ttf $(HOME)/.local/share/fonts
rm -rf JetBrainsMono.zip JetBrainsMono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
unzip Meslo.zip -d Meslo
cp Meslo/*ttf $(HOME)/.local/share/fonts
rm -rf Meslo.zip Meslo
cd --
fc-cache
