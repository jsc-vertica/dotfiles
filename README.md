# Dotfiles

Personal configuration files (dotfiles) for Linux development environment, managed with [chezmoi](https://www.chezmoi.io/).

## Overview

This repository contains configuration files for a Wayland-based development environment using Sway window manager. The configurations include shell setup, terminal emulator, status bar, and various system utilities optimized for a modern Linux workflow.

## Components

### Shell Configuration
- **bash_profile**: Login shell initialization
- **bashrc**: Interactive bash shell configuration with:
  - Comprehensive history settings
  - Vi mode keybindings
  - Custom prompt with git branch display
  - Useful aliases for common commands
  - Utility functions (extract, mkcd, weather, etc.)
  - Environment variables for development (.NET, NVM, etc.)
- **inputrc**: Readline configuration for enhanced command-line editing

### Window Manager & Desktop Environment
- **Sway**: Wayland compositor and i3-compatible window manager
  - Danish keyboard layout (dk)
  - Custom keybindings with Mod4 (Super/Windows key)
  - Idle/lock configuration with swaylock
  - Custom background image support

### Applications
- **Alacritty**: Modern GPU-accelerated terminal emulator with Catppuccin Mocha theme
- **Waybar**: Customizable status bar for Wayland compositors
- **Fuzzel**: Application launcher for Wayland
- **Swaylock**: Screen locker for Sway/Wayland
- **Dunst**: Notification daemon
- **Btop**: Resource monitor with Catppuccin Mocha theme
- **Swappy**: Screenshot annotation tool

## Prerequisites

### Required
- [chezmoi](https://www.chezmoi.io/) - Dotfiles manager
- Bash shell
- Git

### Recommended (for full functionality)
- [Sway](https://swaywm.org/) - Wayland compositor
- [Alacritty](https://github.com/alacritty/alacritty) - Terminal emulator
- [Waybar](https://github.com/Alexays/Waybar) - Status bar
- [Fuzzel](https://codeberg.org/dnkl/fuzzel) - Application launcher
- [lsd](https://github.com/lsd-rs/lsd) - Modern ls replacement (used in aliases)
- [htop](https://htop.dev/) or btop - System monitor
- curl - For various utility functions

### Development Tools (optional)
- [.NET SDK](https://dotnet.microsoft.com/) - For .NET development
- [NVM](https://github.com/nvm-sh/nvm) - Node Version Manager
- [Rider](https://www.jetbrains.com/rider/) - Set as default editor

## Installation

### Using chezmoi (Recommended)

1. **Install chezmoi** (if not already installed):
   ```bash
   # On most systems
   sh -c "$(curl -fsLS get.chezmoi.io)"
   
   # Or using your package manager
   # Debian/Ubuntu: apt install chezmoi
   # Fedora: dnf install chezmoi
   # Arch: pacman -S chezmoi
   ```

2. **Initialize with this repository**:
   ```bash
   chezmoi init https://github.com/jsc-vertica/dotfiles.git
   ```

3. **Preview the changes**:
   ```bash
   chezmoi diff
   ```

4. **Apply the dotfiles**:
   ```bash
   chezmoi apply -v
   ```

5. **Keep your dotfiles updated**:
   ```bash
   chezmoi update -v
   ```

### Manual Installation

If you prefer not to use chezmoi, you can manually copy files:

```bash
# Clone the repository
git clone https://github.com/jsc-vertica/dotfiles.git ~/dotfiles-repo
cd ~/dotfiles-repo

# Note: Files with 'dot_' prefix should be renamed with '.' prefix
# Files with 'private_dot_config' should go to ~/.config/
# Files with 'empty_' prefix are templates/examples
# Files with 'executable_' should have execute permissions
```

## Key Features

### Bash Configuration

**History Management:**
- 10,000 commands in memory, 20,000 in history file
- Duplicate erasure and timestamp recording
- Multi-line command preservation

**Navigation Aliases:**
- `..`, `...`, `....` - Quick directory navigation
- `mkcd` - Create and enter directory in one command

**System Shortcuts:**
- Enhanced `ls` using lsd with detailed formatting
- Safe file operations with interactive confirmations (`rm -i`, `cp -i`, `mv -i`)
- Quick archive extraction with `extract` function
- Weather lookup with `weather` function

**Development Environment:**
- Vi mode for command-line editing
- Git branch display in prompt
- .NET and Node.js environment setup
- Colored man pages for better readability

### Sway Configuration

**Custom Keybindings:**
- `Mod4 + Return` - Open terminal (Alacritty)
- `Mod4 + Space` - Launch applications (Fuzzel)
- `Mod4 + W` - Close focused window
- `Mod4 + L` - Lock screen
- `Mod4 + Shift + C` - Reload Sway configuration
- `Mod4 + Shift + E` - Exit Sway

**Power Management:**
- Auto-lock after 10 minutes of inactivity
- Screen power off after 15 minutes
- Lock before sleep

## Customization

### Personalizing the Configuration

1. **Modify shell settings**:
   Edit `~/.bashrc` for bash customizations or create `~/.bashrc.local` for local overrides.

2. **Change editor**:
   In `.bashrc`, modify the `EDITOR` variable (default: rider)

3. **Adjust keyboard layout**:
   In `~/.config/sway/config`, modify the `xkb_layout` setting (default: dk)

4. **Change color theme**:
   Both Alacritty and btop use Catppuccin Mocha theme. Theme files are located in their respective config directories.

5. **Modify keybindings**:
   Edit `~/.config/sway/config` for Sway keybindings
   Edit `~/.inputrc` for readline/bash keybindings

### Using Chezmoi for Changes

After making changes to your dotfiles:

```bash
# Add changes from your home directory to the repository
chezmoi add ~/.bashrc

# Edit a file directly in chezmoi's source directory
chezmoi edit ~/.bashrc

# View differences
chezmoi diff

# Apply changes
chezmoi apply

# Commit and push to your fork
cd $(chezmoi source-path)
git add .
git commit -m "Update configurations"
git push
```

## File Naming Convention

This repository follows chezmoi's naming conventions:

- `dot_*` → `.* ` (dotfiles in home directory)
- `private_dot_config` → `~/.config/` (config directory)
- `empty_*` → Template/example files (may need customization)
- `executable_*` → Files that should have execute permissions

## Screenshots

### Terminal (Alacritty + Bash)
The configuration provides a clean, informative prompt with git integration and vi mode editing.

### Sway Desktop
Minimal Wayland-based desktop environment with Waybar status bar and efficient keyboard-driven workflow.

## Troubleshooting

### Fonts not displaying correctly
Ensure you have Nerd Fonts installed for proper icon display in the terminal and status bar.

### lsd command not found
Install lsd or modify the `ls` alias in `.bashrc` to use standard `ls` with colors.

### Sway won't start
Verify that all Sway dependencies are installed and your system supports Wayland.

### .NET or Node.js paths not working
Make sure .NET SDK and NVM are properly installed in the expected locations (`$HOME/.dotnet`, `$HOME/.nvm`).

## Contributing

Feel free to fork this repository and adapt it to your needs. If you find improvements that could benefit others, pull requests are welcome!

## License

This is free and unencumbered software released into the public domain.

## Acknowledgments

- [Catppuccin](https://github.com/catppuccin) - Color theme
- [chezmoi](https://www.chezmoi.io/) - Dotfiles management
- The open-source community for all the amazing tools

---

*Last Updated: January 2026*
