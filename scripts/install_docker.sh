#!/bin/bash
set -e

echo "======================================"
echo "Installing Docker..."
echo "======================================"

sudo apt update

# Install required packages
sudo apt install -y ca-certificates curl gnupg lsb-release

# Remove old Docker packages if present
sudo apt remove -y docker docker-engine docker.io containerd runc || true
sudo apt autoremove -y

# Remove any existing containerd package that conflicts
if dpkg -l | grep -q "^ii  containerd "; then
    echo "Removing conflicting containerd package..."
    sudo apt remove -y containerd
    sudo apt autoremove -y
fi

# Create Docker keyring directory
sudo install -m 0755 -d /etc/apt/keyrings

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list
sudo apt update

# Install Docker
sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# Enable Docker
sudo systemctl enable docker
sudo systemctl start docker

# Add current user to Docker group
sudo usermod -aG docker "$USER"

# Verify installation
docker --version
docker compose version

echo "======================================"
echo "Docker installed successfully!"
echo "======================================"
echo "Log out and log back in before using Docker without sudo."
