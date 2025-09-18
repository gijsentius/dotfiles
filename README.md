# Dotfiles Configuration

A cross-platform dotfiles configuration managed with [chezmoi](https://www.chezmoi.io/), providing a consistent development environment across Linux and macOS systems.

## Features

### Development Environment
- **Shell**: Zsh with [zinit](https://github.com/zdharma-continuum/zinit) plugin manager
- **Prompt**: [Starship](https://starship.rs/) cross-shell prompt
- **Terminal**: Alacritty with FiraCode Nerd Font
- **Editor**: Neovim with kickstart configuration
- **Version Control**: Git with extensive aliases and difftastic integration
- **Multiplexer**: Tmux with gpakosz configuration

### Development Tools
- **Kubernetes**: kubectl, k9s, krew plugins, flux, helm
- **Languages**: Go, Node.js (via nvm), Elixir, Python (ruff linter)
- **Utilities**: ripgrep, fd, fzf, lima (macOS), trivy security scanner
- **Git Tools**: git-extras, mergiraf merge tool, difftastic diff viewer

### Shell Enhancements
- Syntax highlighting and autosuggestions
- Fuzzy finding with fzf-tab integration
- Oh My Zsh plugins (git, helm, argocd, chezmoi, etc.)
- Custom aliases for common operations
- Kubernetes and Lima completions

## Installation

1. Install chezmoi:
   ```bash
   # Linux
   curl -sfL https://git.io/chezmoi | sh

   # macOS
   brew install chezmoi
   ```

2. Initialize with this repository:
   ```bash
   chezmoi init --apply https://github.com/yourusername/dotfiles.git
   ```

## Platform Support

### Linux (Ubuntu/Debian)
- Package management via `apt`
- Manual installations for modern tools (Go, fzf, flux, ruff)
- Homebrew installation as fallback package manager

### macOS
- Primary package management via Homebrew
- Comprehensive tool installation including GUI applications
- Lima for lightweight Linux VMs
- Google Cloud SDK integration

## File Structure

```
├── .chezmoiignore           # Platform-specific ignore rules
├── dot_alacritty.toml       # Alacritty terminal configuration
├── dot_gitconfig            # Git configuration with aliases
├── dot_zshrc.tmpl           # Zsh configuration (templated)
├── dot_zsh_aliases          # Shell aliases
├── dot_config/              # Application configs
│   ├── kube_complete.sh     # Kubernetes completion
│   └── lima_completion.zsh  # Lima completion (macOS)
├── run_onchange_before_install-packages.sh.tmpl    # Main package installer
├── run_once_before_install-packages-unmanaged.sh.tmpl  # One-time setup
├── run_onchange_before_install-go.sh.tmpl          # Go installation
└── run_once_zz-kickstart-nvim.sh                   # Neovim setup
```

## Customization

### Platform-Specific Configuration
The configuration uses chezmoi templating to handle OS differences:

```bash
{{ if eq .chezmoi.os "linux" -}}
# Linux-specific configuration
{{ else if eq .chezmoi.os "darwin" -}}
# macOS-specific configuration
{{ end -}}
```

### Local Overrides
Create `~/.zsh_overrides` for machine-specific customizations that won't be tracked by chezmoi.

## Key Aliases

### Git Shortcuts
- `gst` / `gs` - git status
- `gcm` - git commit -m
- `gpu` - git push to current branch
- `gco` - git checkout
- `gd` - git diff with word-diff

### Kubernetes
- `k` - kubectl shorthand
- All kubectl plugins via krew

### System
- `ll` - detailed file listing
- `la` - all files with details
- `vim` - launches neovim
- `projects` - navigate to ~/Projects

## Dependencies

### Required
- Git
- Zsh
- curl/wget

### Installed Automatically
All development tools and utilities are installed automatically via the chezmoi scripts based on your platform.

## Updating

```bash
# Update dotfiles
chezmoi update

# Re-run package installations (if needed)
chezmoi apply --force
```

## Contributing

1. Fork the repository
2. Make your changes
3. Test on both Linux and macOS if possible
4. Submit a pull request

## License

MIT License - feel free to use and modify as needed.