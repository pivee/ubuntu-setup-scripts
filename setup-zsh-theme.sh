#!/bin/bash

# Function to log messages in color
log_message() {
    local message=$1
    local color=$2
    echo -e "\e[${color}m${message}\e[0m"
}

# Ensure Zsh is installed
if ! command -v zsh &>/dev/null; then
    log_message "Zsh is not installed. Installing..." "33"
    sudo apt update && sudo apt install -y zsh || { log_message "Failed to install Zsh!" "31"; exit 1; }
fi

# Install Oh My Zsh
log_message "Installing Oh My Zsh..." "33"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || { log_message "Oh My Zsh installation failed!" "31"; exit 1; }
else
    log_message "Oh My Zsh is already installed, skipping..." "32"
fi

# Define ZSH_CUSTOM path
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# Install Zsh Syntax Highlighting
log_message "Installing Zsh Syntax Highlighting..." "33"
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    log_message "Updating Zsh Syntax Highlighting..." "32"
    (cd "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" && git pull)
fi

# Install Zsh Autosuggestions
log_message "Installing Zsh Autosuggestions..." "33"
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    log_message "Updating Zsh Autosuggestions..." "32"
    (cd "$ZSH_CUSTOM/plugins/zsh-autosuggestions" && git pull)
fi

# Install Powerlevel10k theme
log_message "Installing Powerlevel10k theme..." "33"
if [[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
    log_message "Updating Powerlevel10k theme..." "32"
    (cd "$ZSH_CUSTOM/themes/powerlevel10k" && git pull)
fi

# Ensure ~/.zshrc exists
if [[ ! -f "$HOME/.zshrc" ]]; then
    log_message "Creating ~/.zshrc..." "33"
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
fi

# Modify ~/.zshrc
log_message "Configuring ~/.zshrc with plugins and theme..." "33"
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

log_message "Zsh setup complete! Restarting shell..." "32"
exec zsh
