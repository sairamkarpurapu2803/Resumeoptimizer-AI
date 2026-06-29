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
sudo apt install -y \
    openjdk-21-jdk \
    curl \
    wget \
    gnupg \
    ca-certificates \
    fontconfig

# Create keyring directory
sudo mkdir -p /usr/share/keyrings

# Download the NEW Jenkins 2026 signing key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key \
| sudo tee /usr/share/keyrings/jenkins-keyring.asc >/dev/null

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
| sudo tee /etc/apt/sources.list.d/jenkins.list >/dev/null

# Update package index
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo
echo "======================================"
echo "Jenkins Installed Successfully"
echo "======================================"

echo
echo "Java Version:"
java -version

echo
echo "Jenkins Status:"
sudo systemctl status jenkins --no-pager

echo
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
