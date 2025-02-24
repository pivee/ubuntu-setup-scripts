#!/bin/bash

# Function to log messages in color
log_message() {
    local message=$1
    local color=$2
    echo -e "\e[${color}m${message}\e[0m"
}

# Install NVM (Node Version Manager)
if [ ! -d "$HOME/.nvm" ]; then
  log_message "Installing NVM..." "33"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
else
  log_message "NVM is already installed." "32"
fi

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js
NODE_VERSION="lts/*"
log_message "Installing Node.js version $NODE_VERSION..." "33"
nvm install $NODE_VERSION

# Set default Node.js version
nvm alias default $NODE_VERSION

log_message "Node.js installation completed." "32"