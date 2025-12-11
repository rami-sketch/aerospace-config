#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEMES_DIR="$SCRIPT_DIR/themes"
CHEATSHEET_DIR="$HOME/.config/aerospace-cheatsheet"
CURRENT_THEME_FILE="$CHEATSHEET_DIR/.current-theme"

# Function to list available themes
list_themes() {
    echo -e "${CYAN}Available themes:${NC}"
    echo ""
    for theme_file in "$THEMES_DIR"/*.conf; do
        if [[ -f "$theme_file" ]]; then
            theme_name=$(basename "$theme_file" .conf)
            # Read the display name from the theme file
            display_name=$(grep "^name=" "$theme_file" | cut -d'"' -f2)
            
            # Check if this is the current theme
            if [[ -f "$CURRENT_THEME_FILE" ]] && [[ "$(cat "$CURRENT_THEME_FILE")" == "$theme_name" ]]; then
                echo -e "  ${GREEN}* $theme_name${NC} - $display_name (current)"
            else
                echo "    $theme_name - $display_name"
            fi
        fi
    done
    echo ""
}

# Function to apply a theme
apply_theme() {
    local theme_name="$1"
    local theme_file="$THEMES_DIR/$theme_name.conf"
    
    if [[ ! -f "$theme_file" ]]; then
        echo -e "${RED}Error: Theme '$theme_name' not found${NC}"
        echo ""
        list_themes
        exit 1
    fi
    
    echo -e "${CYAN}Applying theme: $theme_name${NC}"
    
    # Source the theme file to get variables
    source "$theme_file"
    
    # Generate the cheatsheet HTML with theme colors
    cat > "$CHEATSHEET_DIR/cheatsheet.html" << EOF
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    
    html, body {
      background: transparent;
    }
    
    body {
      font-family: Menlo, Monaco, 'Courier New', monospace;
      font-size: 13px;
      color: ${text_action};
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }
    
    .crt {
      position: relative;
    }
    
    .terminal {
      position: relative;
      z-index: 1;
      background: linear-gradient(145deg, ${bg_primary} 0%, ${bg_secondary} 100%);
      border: 2px solid ${border_color};
      border-radius: 12px;
      padding: 15px 20px;
      text-shadow: 0 0 2px ${glow_color};
      overflow: hidden;
    }
    
    /* CRT Scanlines */
    .terminal::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: repeating-linear-gradient(
        0deg,
        rgba(0, 0, 0, ${scanline_opacity}),
        rgba(0, 0, 0, ${scanline_opacity}) 1px,
        transparent 1px,
        transparent 2px
      );
      pointer-events: none;
      z-index: 10;
      border-radius: 12px;
    }
    
    /* CRT Glow/Vignette */
    .terminal::after {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: radial-gradient(
        ellipse at center,
        transparent 50%,
        rgba(0, 0, 0, 0.4) 100%
      );
      box-shadow: inset 0 0 80px ${glow_color};
      pointer-events: none;
      z-index: 5;
      border-radius: 12px;
    }
    
    .title {
      text-align: center;
      color: ${text_title};
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 15px;
      text-shadow: 0 0 10px ${glow_color};
      letter-spacing: 4px;
    }
    
    .grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 15px;
    }
    
    .section {
      border: 1px solid ${border_inner};
      border-radius: 4px;
      padding: 10px;
      background: ${bg_section};
    }
    
    .section-title {
      color: ${text_header};
      font-weight: bold;
      margin-bottom: 8px;
      font-size: 11px;
      letter-spacing: 1px;
    }
    
    .row {
      display: flex;
      margin-bottom: 4px;
    }
    
    .key {
      color: ${text_key};
      width: 110px;
      flex-shrink: 0;
    }
    
    .action {
      color: ${text_action};
    }
    
    .divider {
      border-top: 1px solid ${border_inner};
      margin: 15px 0;
    }
    
    .apps-row {
      display: flex;
      align-items: center;
      gap: 20px;
    }
    
    .apps-row .section-title {
      margin-bottom: 0;
    }
  </style>
</head>
<body>
  <div class="crt">
    <div class="terminal">
      <div class="title">AEROSPACE</div>
      
      <div class="grid">
        <div class="section">
          <div class="section-title">FOCUS</div>
          <div class="row"><span class="key">Opt+A</span><span class="action">left</span></div>
          <div class="row"><span class="key">Opt+S</span><span class="action">down</span></div>
          <div class="row"><span class="key">Opt+W</span><span class="action">up</span></div>
          <div class="row"><span class="key">Opt+D</span><span class="action">right</span></div>
        </div>
        
        <div class="section">
          <div class="section-title">MOVE</div>
          <div class="row"><span class="key">Opt+Arrow</span><span class="action">left</span></div>
          <div class="row"><span class="key">Opt+Arrow</span><span class="action">down</span></div>
          <div class="row"><span class="key">Opt+Arrow</span><span class="action">up</span></div>
          <div class="row"><span class="key">Opt+Arrow</span><span class="action">right</span></div>
        </div>
        
        <div class="section">
          <div class="section-title">RESIZE</div>
          <div class="row"><span class="key">Opt+-</span><span class="action">shrink</span></div>
          <div class="row"><span class="key">Opt+=</span><span class="action">grow</span></div>
        </div>
        
        <div class="section">
          <div class="section-title">WORKSPACES</div>
          <div class="row"><span class="key">Opt+1-9</span><span class="action">switch</span></div>
          <div class="row"><span class="key">Opt+Shift+1-9</span><span class="action">move</span></div>
        </div>
        
        <div class="section">
          <div class="section-title">LAYOUTS</div>
          <div class="row"><span class="key">Opt+/</span><span class="action">h/v tile</span></div>
          <div class="row"><span class="key">Opt+,</span><span class="action">accordion</span></div>
          <div class="row"><span class="key">Opt+F</span><span class="action">fullscreen</span></div>
          <div class="row"><span class="key">Cmd+O</span><span class="action">float</span></div>
        </div>
        
        <div class="section">
          <div class="section-title">GROUPING</div>
          <div class="row"><span class="key">Opt+V</span><span class="action">join below</span></div>
          <div class="row"><span class="key">Opt+B</span><span class="action">join right</span></div>
        </div>
      </div>
      
      <div class="divider"></div>
      
      <div class="apps-row">
        <span class="section-title">APPS</span>
        <div class="row"><span class="key">Cmd+Shift+F</span><span class="action">finder</span></div>
      </div>
    </div>
  </div>
</body>
</html>
EOF
    
    # Save current theme
    echo "$theme_name" > "$CURRENT_THEME_FILE"
    
    echo -e "${GREEN}Theme '$theme_name' applied!${NC}"
    echo ""
    echo "Press Cmd+K to see your new theme."
}

# Function to show current theme
show_current() {
    if [[ -f "$CURRENT_THEME_FILE" ]]; then
        current=$(cat "$CURRENT_THEME_FILE")
        echo -e "${CYAN}Current theme:${NC} $current"
    else
        echo -e "${YELLOW}No theme set. Using default.${NC}"
    fi
}

# Function to preview themes (opens cheatsheet)
preview_theme() {
    local theme_name="$1"
    apply_theme "$theme_name"
    # Trigger the cheatsheet
    ~/.config/aerospace-cheatsheet/show.sh &
    sleep 3
    ~/.config/aerospace-cheatsheet/hide.sh
}

# Main
case "${1:-}" in
    list|ls)
        list_themes
        ;;
    apply|set)
        if [[ -z "${2:-}" ]]; then
            echo -e "${RED}Error: Please specify a theme name${NC}"
            echo "Usage: $0 apply <theme-name>"
            echo ""
            list_themes
            exit 1
        fi
        apply_theme "$2"
        ;;
    current)
        show_current
        ;;
    preview)
        if [[ -z "${2:-}" ]]; then
            echo -e "${RED}Error: Please specify a theme name${NC}"
            exit 1
        fi
        preview_theme "$2"
        ;;
    *)
        echo -e "${CYAN}AeroSpace Theme Manager${NC}"
        echo ""
        echo "Usage: $0 <command> [options]"
        echo ""
        echo "Commands:"
        echo "  list, ls        List available themes"
        echo "  apply, set      Apply a theme (e.g., $0 apply tokyo-night)"
        echo "  current         Show current theme"
        echo "  preview         Preview a theme (e.g., $0 preview dracula)"
        echo ""
        list_themes
        ;;
esac
