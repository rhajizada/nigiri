echo "Installing 'docker' and 'docker-compose'"
sudo pacman -S --noconfirm docker docker-compose
sudo usermod -aG docker ${USER}
sudo systemctl enable docker.service
# Use local logging driver - it's more efficient and uses compression by default.
cat <<EOL >/etc/docker/daemon.json
{
  "log-driver": "local",
  "log-opts": {
    "max-size": "10m",
    "max-file": "5"
  }
}
EOL
echo "Installing 'lazydocker'"
yay -S lazydocker
