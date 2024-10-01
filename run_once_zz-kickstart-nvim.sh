#!/bin/sh

if [ ! -d "${XDG_CONFIG_HOME:-$HOME/.config}/nvim" ]; then
  git clone git@github.com:gijsentius/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
fi
