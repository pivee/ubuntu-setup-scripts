#!/bin/bash

# Function to log messages in color
log_message() {
    local message=$1
    local color=$2
    echo -e "\e[${color}m${message}\e[0m"
}

# Update package list and upgrade existing packages
log_message "Updating package list and upgrading existing packages..." "33"
sudo apt update && sudo apt upgrade -y

# Run individual installation scripts
log_message "Running individual installation scripts..." "33"
bash scripts/install_zsh.sh
bash scripts/install_nvm_node.sh
bash scripts/install_docker.sh
bash scripts/install_tmux.sh
bash scripts/install_ranger.sh

# Set Zsh as the default shell
log_message "Setting Zsh as the default shell..." "33"
chsh -s $(which zsh)

# Verify if the default shell has been changed to Zsh
if [ "$SHELL" == "$(which zsh)" ]; then
    log_message "Zsh has been set as the default shell." "32"
else
    log_message "Failed to set Zsh as the default shell. Please log out and log back in, or set it manually using 'chsh -s $(which zsh)'." "31"
fi

log_message "Setup complete! Please restart your terminal." "32"