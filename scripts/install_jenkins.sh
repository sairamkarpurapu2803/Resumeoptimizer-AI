#!/bin/bash
set -e

echo "Installing Jenkins..."

sudo apt update

# Install Java and required packages
sudo apt install fontconfig openjdk-21-jre

#check java version
java --version

# Download Jenkins GPG key
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add Jenkins repository
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  
# Update package list
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Verify Jenkins
sudo systemctl status jenkins --no-pager
