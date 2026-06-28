
#!/bin/bash
set -e

echo "Installing FindTheJob AI required tools"

sudo apt update -y

sudo apt install -y git curl wget unzip vim net-tools software-properties-common

bash scripts/install_python.sh
bash scripts/install_node.sh
bash scripts/install_docker.sh
bash scripts/install_java21.sh
bash scripts/install_jenkins.sh
bash scripts/install_kubernetes.sh
bash scripts/install_nginx.sh

bash scripts/check_tools.sh

echo "All tools installed successfully"
