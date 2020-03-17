#!/bin/sh

# Color variables
GREEN='\033[0;32m'
NC='\033[0m'

# Install Xonsh
echo -e "[${GREEN}HARBS${NC}] Installing Xonsh"
sudo pacman -S xonsh

# Run the installer
xonsh harbs.xsh