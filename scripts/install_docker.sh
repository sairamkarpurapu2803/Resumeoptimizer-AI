
#!/bin/bash

sudo apt update

sudo apt install -y docker.io docker-compose-plugin

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker $USER

docker --version
docker compose version
