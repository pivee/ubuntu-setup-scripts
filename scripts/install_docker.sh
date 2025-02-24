#!/bin/bash

# Function to log messages in color
log_message() {
    local message=$1
    local color=$2
    echo -e "\e[${color}m${message}\e[0m"
}

# Update the package index
log_message "Updating package index..." "33"
sudo apt-get update

# Install required packages for Docker
log_message "Installing required packages for Docker..." "33"
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
log_message "Adding Docker's official GPG key..." "33"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker repository to APT sources
log_message "Adding Docker repository to APT sources..." "33"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package index again
log_message "Updating package index again..." "33"
sudo apt-get update

# Install Docker
log_message "Installing Docker..." "33"
sudo apt-get install -y docker-ce

# Add the current user to the docker group
log_message "Adding current user to Docker group..." "33"
sudo usermod -aG docker $USER

# Print Docker version to verify installation
docker --version

# Instructions to start a new session for group changes to take effect
log_message "Please log out and log back in to apply the changes to your user group." "32"