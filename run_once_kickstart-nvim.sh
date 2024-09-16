#!/bin/sh

if [ ! -d "${XDG_CONFIG_HOME:-$HOME/.config}/nvim" ]; then
  git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
fi
