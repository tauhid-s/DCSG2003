#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Update package list
sudo apt-get update

# Install required dependencies
sudo apt-get install -y ca-certificates curl

# Create the keyrings directory
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker's official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Set the correct permissions for the key
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker's official repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again
sudo apt-get update

# Install Docker packages
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify installation
sudo docker run hello-world

echo "Docker installation completed successfully!"
