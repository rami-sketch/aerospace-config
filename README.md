# AeroSpace Config

Hyprland-style tiling window manager config for macOS using [AeroSpace](https://github.com/nikitabobko/AeroSpace).

Inspired by [Omarchy](https://github.com/basecamp/omarchy) by DHH.

![Cheatsheet](./screenshot.png)

## Features

- **Horizontal (landscape) tiling** - Windows tile side-by-side like Hyprland
- **WASD focus navigation** - Opt + W/A/S/D to focus windows
- **Arrow key window movement** - Opt + Arrow keys to move windows
- **TUI-style cheatsheet** - Hold Cmd + K to show overlay with CRT effects
- **Quick float toggle** - Cmd + O to pop window out of tiling
- **Workspace support** - Opt + 1-9 to switch, Opt + Shift + 1-9 to move windows
- **Themeable** - 7 built-in themes, easy to create your own

## Themes

| Theme | Preview |
|-------|---------|
| **Tokyo Night** | Dark theme with cyan/green accents |
| **Catppuccin Mocha** | Soothing pastel colors |
| **Dracula** | Classic dark theme with purple/pink |
| **Gruvbox** | Retro groove with warm colors |
| **Nord** | Arctic, north-bluish palette |
| **Rosé Pine** | Natural pine with soho vibes |
| **Cyberpunk** | Neon-soaked night city |

## Installation

### One-liner

```bash
git clone https://github.com/rami-sketch/aerospace-config.git && cd aerospace-config && ./install.sh
```

### Manual

1. Clone this repo:
   ```bash
   git clone https://github.com/rami-sketch/aerospace-config.git
   cd aerospace-config
   ```

2. Run the install script:
   ```bash
   ./install.sh
   ```

3. Choose your theme when prompted

4. Open **Karabiner-Elements** and grant accessibility permissions

5. In Karabiner: **Complex Modifications** → **Add rule** → Enable **"Hold Cmd+K to show AeroSpace cheatsheet"**

## Theming

### Change Theme

```bash
# List available themes
./theme.sh list

# Apply a theme
./theme.sh apply dracula

# See current theme
./theme.sh current

# Preview a theme (shows cheatsheet for 3 seconds)
./theme.sh preview cyberpunk
```

### Available Themes

- `tokyo-night` - Dark theme inspired by Tokyo Night
- `catppuccin-mocha` - Soothing pastel theme
- `dracula` - Classic dark theme for vampires
- `gruvbox` - Retro groove color scheme
- `nord` - Arctic, north-bluish palette
- `rose-pine` - Natural pine, faux fur and soho vibes
- `cyberpunk` - Neon-soaked night city

### Create Your Own Theme

1. Copy an existing theme:
   ```bash
   cp themes/tokyo-night.conf themes/my-theme.conf
   ```

2. Edit the colors in `themes/my-theme.conf`:
   ```bash
   # My Custom Theme
   name="My Theme"

   # Background
   bg_primary="#1a1b26"
   bg_secondary="#13141c"
   bg_section="rgba(0, 0, 0, 0.2)"

   # Border
   border_color="#9ece6a"
   border_inner="#3b4261"

   # Text
   text_title="#7aa2f7"
   text_header="#9ece6a"
   text_key="#7dcfff"
   text_action="#a9b1d6"

   # Effects
   glow_color="rgba(125, 207, 255, 0.3)"
   scanline_opacity="0.03"
   ```

3. Apply your theme:
   ```bash
   ./theme.sh apply my-theme
   ```

## Keybindings

### Focus Windows
| Key | Action |
|-----|--------|
| `Opt + A` | Focus left |
| `Opt + S` | Focus down |
| `Opt + W` | Focus up |
| `Opt + D` | Focus right |

### Move Windows
| Key | Action |
|-----|--------|
| `Opt + ←` | Move left |
| `Opt + ↓` | Move down |
| `Opt + ↑` | Move up |
| `Opt + →` | Move right |

### Resize
| Key | Action |
|-----|--------|
| `Opt + -` | Shrink |
| `Opt + =` | Grow |

### Workspaces
| Key | Action |
|-----|--------|
| `Opt + 1-9` | Switch to workspace |
| `Opt + Shift + 1-9` | Move window to workspace |

### Layouts
| Key | Action |
|-----|--------|
| `Opt + /` | Toggle H/V tiling |
| `Opt + ,` | Accordion layout |
| `Opt + F` | Fullscreen |
| `Cmd + O` | Toggle float |

### Grouping
| Key | Action |
|-----|--------|
| `Opt + V` | Join with window below |
| `Opt + B` | Join with window to the right |

### Apps
| Key | Action |
|-----|--------|
| `Cmd + Shift + F` | Open Finder |

### Cheatsheet
| Key | Action |
|-----|--------|
| `Cmd + K` (hold) | Show cheatsheet overlay |

## Customization

- **AeroSpace config**: Edit `~/.aerospace.toml`
- **Cheatsheet styling**: Edit `~/.config/aerospace-cheatsheet/cheatsheet.html`
- **Karabiner rules**: Edit `~/.config/karabiner/assets/complex_modifications/aerospace-cheatsheet.json`

After editing AeroSpace config, reload:
```bash
aerospace reload-config
```

## Uninstall

```bash
./uninstall.sh
```

To fully remove AeroSpace and Karabiner:
```bash
brew uninstall --cask aerospace
brew uninstall --cask karabiner-elements
```

## Requirements

- macOS
- [Homebrew](https://brew.sh)

## Credits

- [AeroSpace](https://github.com/nikitabobko/AeroSpace) - Tiling window manager for macOS
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) - Keyboard customizer
- [Omarchy](https://github.com/basecamp/omarchy) - Inspiration for the Hyprland-style tiling

## License

MIT
