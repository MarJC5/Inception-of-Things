#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit
fi

# Update package list and upgrade existing packages
echo "Updating package list and upgrading existing packages..."
sudo apt update && sudo apt upgrade -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
echo "Adding Docker's GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker's official repository
echo "Adding Docker's repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list to include Docker's repository
echo "Updating package list with Docker's repository..."
sudo apt update

# Install Docker Engine, CLI, and containerd
echo "Installing Docker Engine, CLI, and other components..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start and enable Docker service
echo "Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Add the current user to the Docker group
echo "Adding the current user to the Docker group..."
sudo usermod -aG docker $USER

# Display Docker version to verify installation
echo "Verifying Docker installation..."
sudo docker --version

# Test Docker by running a hello-world container
echo "Testing Docker installation by running hello-world container..."
sudo docker run hello-world

echo -e "\nDocker installation completed successfully!"
echo "Please reboot for the group changes to take effect."
