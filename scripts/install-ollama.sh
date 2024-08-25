echo "Installing ollama"
sudo pacman -S --noconfirm ollama
if ! id -u ollama &>/dev/null; then
  echo "Creating user for ollama"
  sudo useradd -r -s /bin/false -m -d /usr/share/ollama ollama
fi
if [[ ! -e /etc/systemd/system/ollama.service ]]; then
  sudo tee /etc/systemd/system/ollama.service <<EOL
[Unit]
Description=Ollama
After=network-online.target

[Service]
ExecStart=/usr/bin/ollama serve
User=ollama
Group=ollama
Restart=always
RestartSec=3

[Install]
WantedBy=default.target
EOL
  echo "Enabling ollama service"
  sudo systemctl daemon-reload
  sudo systemctl enable ollama
  sudo systemctl start ollama
fi
