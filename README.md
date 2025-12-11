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

3. Open **Karabiner-Elements** and grant accessibility permissions

4. In Karabiner: **Complex Modifications** → **Add rule** → Enable **"Hold Cmd+K to show AeroSpace cheatsheet"**

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

After editing, reload AeroSpace:
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
