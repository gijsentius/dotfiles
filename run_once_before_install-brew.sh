#!/bin/bash

set -euo pipefail

# Homebrew isn't on PATH yet during the first chezmoi apply, so check the
# default install locations as well.
if command -v brew >/dev/null 2>&1 \
  || [ -x /opt/homebrew/bin/brew ] \
  || [ -x /usr/local/bin/brew ] \
  || [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  exit 0
fi

brew_install_script="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
NONINTERACTIVE=1 bash -c "${brew_install_script}"
