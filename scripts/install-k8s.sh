echo "Installing microk8s"
sudo snap install microk8s --classic
echo "Configuring microk8s"
sudo usermod -a -G microk8s $USER
newgrp microk8s
sudo chown -R $USER $HOME/.kube
microk8s status --wait-ready
microk8s config >$HOME/.kube/config
echo "Enabling dashboard"
microk8s enable dashboard
echo "Enabling dns"
microk8s enable dns
echo "Enabling dns"
microk8s enable registry
echo "Enabling istio"
microk8s enable istio
echo "Installing kubectl"
sudo pacman -S --noconfirm kubectl
echo "Installing k9s"
sudo pacman -S --noconfirm k9s
echo "Installing helm"
sudo pacman -S --noconfirm helm
