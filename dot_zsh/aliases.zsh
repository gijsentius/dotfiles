# Aliases. Machine-specific ones go in ~/.zsh/local/*.zsh (not managed by chezmoi).

# Tool shortcuts
alias n='nvim'
alias vim='nvim'
alias k='kubectl'
alias s='sofka'
alias lg='lazygit'

# Kubernetes
alias rancher='export KUBECONFIG=~/.kube/rancher-config'

# Files and navigation
alias ls='ls -F --color=auto'
alias l='ls -F'
alias ll='ls -l'
alias la='ls -las'
alias duh='du -hsx * 2>/dev/null | sort -hr | head -n 6'
alias projects='cd ~/Projects'

# Colors and sane defaults
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c'
# Remove squashfs (snaps) from df
alias df='df -x"squashfs"'

# Misc
alias pandock='docker run --rm --platform linux/amd64 -v "$(pwd):/data" -u $(id -u):$(id -g) pandoc/extra --from markdown --template eisvogel --listings'
alias createpassword='openssl rand -base64 30'
alias createmac='printf '%02x:%s\n' $(( 0x$(openssl rand -hex 1) & 0xFE | 0x02 )) "$(openssl rand -hex 5 | sed 's/../&:/g; s/:$//')"'

# Git: every git alias from ~/.gitconfig as g<alias> (e.g. gst, gcm, gd)
for al in $(git --list-cmds=alias); do
  alias g$al="git $al"
done
unset al
