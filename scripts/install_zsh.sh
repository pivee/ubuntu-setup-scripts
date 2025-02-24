#!/bin/bash

# Function to log messages in color
log_message() {
    local message=$1
    local color=$2
    echo -e "\e[${color}m${message}\e[0m"
}

# Update package list and install prerequisites
log_message "Updating package list and installing Zsh..." "33"
sudo apt update
sudo apt install -y zsh
