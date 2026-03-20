#!/bin/bash

# Mise à jour du système
sudo apt update && sudo apt upgrade -y

# Installation des outils utiles
sudo apt install -y sudo vim curl wget git ufw

# Création de l'utilisateur admin
sudo adduser admin
sudo usermod -aG sudo admin

# Configuration SSH
sudo sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
sudo systemctl restart sshd

# Firewall UFW
sudo ufw allow 22/tcp
sudo ufw --force enable
