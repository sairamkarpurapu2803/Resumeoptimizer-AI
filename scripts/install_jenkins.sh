#!/bin/bash
set -e

echo "Installing Jenkins..."

sudo apt update

sudo apt install -y openjdk-21-jdk curl gnupg ca-certificates

# Create keyring directory
sudo mkdir -p /etc/apt/keyrings

# Download Jenkins signing key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
| sudo gpg --dearmor -o /etc/apt/keyrings/jenkins-keyring.gpg

# Add Jenkins repository
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" \
| sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install -y jenkins

sudo systemctl enable jenkins
sudo systemctl start jenkins

java -version
jenkins --version || echo "Jenkins installed successfully."
