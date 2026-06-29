#!/bin/bash
set -e

sudo apt update

sudo apt install -y docker.io docker-compose-plugin

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker $USER

sudo docker --version
sudo docker compose version

echo "Docker installed successfully."
echo "Please log out and log back in (or reboot) to use Docker without sudo."
