# Dotfiles

My dotfiles for macOS and Linux (Ubuntu / WSL), managed with [chezmoi](https://www.chezmoi.io/). One repo serves both personal and work machines; work machines get the same setup minus AI tooling and personal secrets.

## Installation

On a new machine:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply gijsentius/dotfiles
```

Or from a local clone, `./install.sh` installs chezmoi if needed and runs `chezmoi init --apply` against the clone.

`chezmoi init` asks two questions once and stores the answers in `~/.config/chezmoi/chezmoi.toml`:

| Prompt | Data key | Used for |
| --- | --- | --- |
| Is this a work machine (no AI tooling) | `work` | See [Work machines](#work-machines) |
| Git email address | `email` | `user.email` in `~/.gitconfig` |

To change an answer later, run `chezmoi edit-config` and then `chezmoi apply`.

On the first apply chezmoi:

1. installs Homebrew if it isn't there (`run_once_before_install-brew.sh`)
2. installs packages from `.chezmoidata/packages.yaml` (`run_onchange_install-packages.sh.tmpl`, re-runs whenever the package list changes)
3. clones [oh-my-tmux](https://github.com/gpakosz/.tmux) into `~/.tmux` (`.chezmoiexternal.toml`, pulled weekly)
4. writes the dotfiles

## Work machines

With `work = true`:

- packages under `packages.personal` (Claude Code, Gemini CLI) are not installed
- the Neovim AI extras (Copilot, Claude Code) are left out of `lua/config/extras.lua`
- the sops age key (`~/.config/sops`, `~/.sops.yaml`) is not deployed
- AI tool config dirs (`~/.claude`, `~/.gemini`, `~/.config/github-copilot`) are ignored by chezmoi

To keep something off work machines, add the package under `packages.personal`, wrap the config in `{{ if not .work }}`, or add the path to the `{{ if .work }}` block in `.chezmoiignore`.

## What's included

| Tool | Source | Notes |
| --- | --- | --- |
| Zsh | `dot_zshrc.tmpl`, `dot_zsh/` | [zinit](https://github.com/zdharma-continuum/zinit) plugins, fzf-tab, autosuggestions, syntax highlighting, OMZ snippets. Auto-attaches to a `workspace` tmux session. |
| Prompt | `dot_config/empty_starship.toml` | [Starship](https://starship.rs/) with default settings |
| Neovim | `dot_config/nvim/` | [LazyVim](https://www.lazyvim.org/) with extras for Go, Python, Helm, Docker, YAML and more; extra Go/Python LSP, test and debug settings in `lua/plugins/` |
| Tmux | `dot_tmux.conf.local` | oh-my-tmux, customised through `~/.tmux.conf.local` |
| Git | `dot_gitconfig.tmpl`, `dot_gitattributes` | Aliases, [difftastic](https://difftastic.wilfred.me.uk/) (`git dlog`, `git ddiff`, ...) and [mergiraf](https://mergiraf.org/) as merge driver |
| Alacritty | `dot_alacritty.toml` | macOS only |
| Yazi | `dot_config/yazi/yazi.toml` | Use `y` to open yazi and `cd` to where you quit |
| sops / age | `dot_sops.yaml`, `dot_config/sops/` | The age key is stored encrypted; decrypt it with `age -d` to `~/.config/sops/age/keys.txt` |

Packages are listed per OS in `.chezmoidata/packages.yaml`: Homebrew formulae and casks on macOS, and apt plus Homebrew on Linux.

## Repository layout

```
.chezmoi.toml.tmpl                    # init prompts (work, email)
.chezmoidata/packages.yaml            # packages per OS, plus personal-only
.chezmoiexternal.toml                 # oh-my-tmux checkout
.chezmoiignore                        # per-OS and work-machine exclusions
.chezmoiremove                        # stale files to delete from $HOME
run_once_before_install-brew.sh       # Homebrew bootstrap
run_onchange_install-packages.sh.tmpl # package installation
dot_zshrc.tmpl
dot_zsh/
├── zsh_aliases                       # shell and git aliases
├── completions.sh.tmpl               # loads completions below + flux/fzf
└── completions/                      # kubectl, talosctl, sops, lima
dot_config/
├── nvim/                             # LazyVim config
├── yazi/yazi.toml
├── sops/age/keys.txt.age
└── empty_starship.toml
dot_gitconfig.tmpl
dot_gitattributes
dot_tmux.conf.local
symlink_dot_tmux.conf                 # ~/.tmux.conf -> ~/.tmux/.tmux.conf
dot_alacritty.toml
dot_sops.yaml
install.sh                            # bootstrap from a local clone
```

## Day-to-day

```bash
chezmoi edit ~/.zshrc     # edit the source of a managed file
chezmoi diff              # preview changes
chezmoi apply             # apply them
chezmoi update            # git pull + apply
chezmoi cd                # open a shell in this repo
```

Machine-specific shell settings that shouldn't be committed go in `~/.zsh_overrides`, which `~/.zshrc` sources if it exists.
