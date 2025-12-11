#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "    ___                     _____                      "
echo "   /   | ___  _________    / ___/____  ____ __________ "
echo "  / /| |/ _ \/ ___/ __ \   \__ \/ __ \/ __ \`/ ___/ _ \\"
echo " / ___ /  __/ /  / /_/ /  ___/ / /_/ / /_/ / /__/  __/"
echo "/_/  |_\___/_/   \____/  /____/ .___/\__,_/\___/\___/ "
echo "                             /_/                       "
echo -e "${NC}"
echo -e "${GREEN}Hyprland-style tiling for macOS${NC}"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew not found. Installing...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install AeroSpace
echo -e "${CYAN}Installing AeroSpace...${NC}"
if ! brew list --cask aerospace &> /dev/null; then
    brew install --cask nikitabobko/tap/aerospace
else
    echo "AeroSpace already installed"
fi

# Install Karabiner-Elements
echo -e "${CYAN}Installing Karabiner-Elements...${NC}"
if ! brew list --cask karabiner-elements &> /dev/null; then
    brew install --cask karabiner-elements
else
    echo "Karabiner-Elements already installed"
fi

# Copy AeroSpace config
echo -e "${CYAN}Installing AeroSpace config...${NC}"
cp "$SCRIPT_DIR/config/aerospace.toml" ~/.aerospace.toml

# Create cheatsheet directory and copy files
echo -e "${CYAN}Installing cheatsheet overlay...${NC}"
mkdir -p ~/.config/aerospace-cheatsheet
cp "$SCRIPT_DIR/cheatsheet/cheatsheet.html" ~/.config/aerospace-cheatsheet/
cp "$SCRIPT_DIR/cheatsheet/overlay.swift" ~/.config/aerospace-cheatsheet/
cp "$SCRIPT_DIR/cheatsheet/show.sh" ~/.config/aerospace-cheatsheet/
cp "$SCRIPT_DIR/cheatsheet/hide.sh" ~/.config/aerospace-cheatsheet/
chmod +x ~/.config/aerospace-cheatsheet/show.sh
chmod +x ~/.config/aerospace-cheatsheet/hide.sh

# Copy Karabiner config
echo -e "${CYAN}Installing Karabiner rules...${NC}"
mkdir -p ~/.config/karabiner/assets/complex_modifications
cp "$SCRIPT_DIR/karabiner/aerospace-cheatsheet.json" ~/.config/karabiner/assets/complex_modifications/

# Reload AeroSpace config if running
if pgrep -x "AeroSpace" > /dev/null; then
    echo -e "${CYAN}Reloading AeroSpace config...${NC}"
    aerospace reload-config 2>/dev/null || true
fi

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Open AeroSpace from Applications (or it may already be running)"
echo "2. Open Karabiner-Elements and grant accessibility permissions"
echo "3. In Karabiner: Complex Modifications → Add rule → Enable 'Hold Cmd+K to show AeroSpace cheatsheet'"
echo ""
echo -e "${CYAN}Keybindings:${NC}"
echo "  Focus:      Opt + W/A/S/D"
echo "  Move:       Opt + Arrow keys"
echo "  Workspaces: Opt + 1-9"
echo "  Float:      Cmd + O"
echo "  Cheatsheet: Hold Cmd + K"
echo "  Finder:     Cmd + Shift + F"
echo ""
echo -e "${GREEN}Enjoy your new tiling window manager!${NC}"
