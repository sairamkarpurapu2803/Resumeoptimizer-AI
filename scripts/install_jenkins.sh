#!/bin/bash
set -e

echo "Installing Jenkins..."

sudo apt update

# Install Java and required packages
sudo apt install -y openjdk-21-jdk curl ca-certificates gnupg

# Create keyring directory
sudo mkdir -p /etc/apt/keyrings

# Download Jenkins GPG key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | \
sudo gpg --dearmor -o /etc/apt/keyrings/jenkins-keyring.gpg

# Add Jenkins repository
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Verify Jenkins
sudo systemctl status jenkins --no-pager
