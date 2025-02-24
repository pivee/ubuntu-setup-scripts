#!/bin/bash

# Function to log messages in color
log_message() {
    local message=$1
    local color=$2
    echo -e "\e[${color}m${message}\e[0m"
}

# Update package list and install dependencies
log_message "Updating package list and installing Tmux..." "33"
sudo apt update
sudo apt install -y tmux

# Verify installation
if command -v tmux &> /dev/null
then
    log_message "Tmux installed successfully." "32"
else
    log_message "Tmux installation failed." "31"
fi