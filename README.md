# Ubuntu Setup Scripts

This project provides a series of scripts to set up an Ubuntu machine for development. The scripts automate the installation of essential tools and utilities, making it easier to configure your environment.

## Prerequisites

Ensure you have `sudo` privileges on your Ubuntu machine to run the installation scripts.

## Installation Scripts

The following scripts are included in this project:

- **install_zsh.sh**: Installs Zsh and sets it as the default shell for the user.
- **install_nvm_node.sh**: Installs Node.js using NVM (Node Version Manager) for easy management of Node.js versions.
- **install_docker.sh**: Installs Docker, setting up the necessary repositories and dependencies.
- **install_tmux.sh**: Installs Tmux, a terminal multiplexer that allows for multiple terminal sessions within a single window.
- **install_ranger.sh**: Installs Ranger, a terminal file manager with a minimalistic interface.
- **setup-zsh-theme.sh**: Installs Oh My Zsh, Zsh Syntax Highlighting, Zsh Autosuggestions, and Powerlevel10k theme.

## Setup Script

To run all the installation scripts in the correct order, execute the `setup.sh` script:

```bash
chmod +x setup.sh
./setup.sh
```

This will sequentially run each of the individual installation scripts.

## Usage

After running the setup script, you can start using the installed tools immediately. For example, you can launch Tmux by simply typing `tmux` in your terminal, or you can start Ranger by typing `ranger`.

Feel free to modify the scripts as per your requirements or add additional tools to enhance your development environment.

## Zsh Theme Setup

To set up the Zsh theme, execute the `setup-zsh-theme.sh` script:

```bash
chmod +x setup-zsh-theme.sh
./setup-zsh-theme.sh
```

This will install Oh My Zsh, Zsh Syntax Highlighting, Zsh Autosuggestions, and the Powerlevel10k theme, and configure your `~/.zshrc` file accordingly.