#!/bin/bash
set -e

echo "======================================"
echo "Installing Jenkins..."
echo "======================================"

# Remove old Jenkins repository and keys
sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo rm -f /usr/share/keyrings/jenkins-keyring.asc
sudo rm -f /etc/apt/keyrings/jenkins-keyring.asc
sudo rm -f /etc/apt/keyrings/jenkins-keyring.gpg

# Install prerequisites
sudo apt update
sudo apt install -y curl wget gnupg ca-certificates fontconfig openjdk-21-jdk

# Create keyring directory
sudo mkdir -p /etc/apt/keyrings

# Download the latest Jenkins repository key
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list >/dev/null

# Update package list
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo
echo "Jenkins Version:"
jenkins --version || true

echo
echo "Service Status:"
sudo systemctl status jenkins --no-pager

echo
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
