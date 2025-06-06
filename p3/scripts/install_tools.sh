#!/bin/bash
# Update package lists and install curl if it’s not installed
sudo apt-get update && sudo apt-get install -y curl

# 1. Install k3d using the official install script:
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# 2. Install kubectl (latest stable release)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

echo "Installation of k3d and kubectl is complete."
