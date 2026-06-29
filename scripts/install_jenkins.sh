#!/bin/bash
set -e

echo "======================================"
echo "Installing Jenkins..."
echo "======================================"

# Remove old Jenkins repository and keys
sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo rm -f /etc/apt/keyrings/jenkins-keyring.gpg
sudo rm -f /usr/share/keyrings/jenkins-keyring.asc

# Update package list
sudo apt update

# Install prerequisites
sudo apt install -y openjdk-21-jdk curl ca-certificates gnupg

# Create keyrings directory
sudo mkdir -p /etc/apt/keyrings

# Download and install Jenkins GPG key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | \
sudo gpg --dearmor -o /etc/apt/keyrings/jenkins-keyring.gpg

# Add Jenkins repository
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list again
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start and enable Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "======================================"
echo "Jenkins Installed Successfully"
echo "======================================"

# Verify
java -version
sudo systemctl status jenkins --no-pager
