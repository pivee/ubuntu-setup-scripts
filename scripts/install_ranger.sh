#!/bin/bash

# Function to log messages in color
log_message() {
    local message=$1
    local color=$2
    echo -e "\e[${color}m${message}\e[0m"
}

# Update package list and install dependencies
log_message "Updating package list and installing Ranger..." "33"
sudo apt update
sudo apt install -y ranger

# Optional: Set Ranger as the default file manager (if desired)
# echo "alias fm='ranger'" >> ~/.zshrc

log_message "Ranger has been installed successfully." "32"