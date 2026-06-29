#!/bin/bash

set -e

echo "========================================="
echo "Installing FindTheJob AI Required Tools"
echo "========================================="

# Update Ubuntu
sudo apt update

# Install basic packages
sudo apt install -y \
    git \
    curl \
    wget \
    unzip \
    vim \
    net-tools \
    software-properties-common

echo "Basic packages installed."
echo

echo "Step 1/7 : Installing Python..."
bash scripts/install_python.sh

echo "Step 2/7 : Installing Node.js..."
bash scripts/install_node.sh

echo "Step 3/7 : Installing Java 21..."
bash scripts/install_java21.sh

echo "Step 4/7 : Installing Docker..."
bash scripts/install_docker.sh

echo "Step 5/7 : Installing Jenkins..."
bash scripts/install_jenkins.sh

echo "Step 6/7 : Installing Kubernetes (kubectl)..."
bash scripts/install_kubernetes.sh

echo "Step 7/7 : Installing Nginx..."
bash scripts/install_nginx.sh

echo
echo "========================================="
echo "Verifying Installed Tools..."
echo "========================================="

bash scripts/check_tools.sh

echo
echo "========================================="
echo "All tools installed successfully!"
echo "========================================="
