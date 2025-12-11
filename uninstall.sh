#!/bin/bash

set -e

# Colors
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${RED}Uninstalling AeroSpace Config...${NC}"
echo ""

# Remove config files
echo -e "${CYAN}Removing config files...${NC}"
rm -f ~/.aerospace.toml
rm -rf ~/.config/aerospace-cheatsheet
rm -f ~/.config/karabiner/assets/complex_modifications/aerospace-cheatsheet.json

echo ""
echo -e "${YELLOW}Config files removed.${NC}"
echo ""
echo "Note: AeroSpace and Karabiner-Elements are still installed."
echo "To fully uninstall, run:"
echo "  brew uninstall --cask aerospace"
echo "  brew uninstall --cask karabiner-elements"
echo ""
echo -e "${CYAN}Uninstall complete.${NC}"
