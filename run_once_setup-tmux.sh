#!/bin/sh

if [ ! -d "${XDG_CONFIG_HOME:-$HOME/.tmux}" ]; then
  git clone https://github.com/gpakosz/.tmux.git ~/.tmux
  ln -s -f ~/.tmux/.tmux.conf
  cp ~/.tmux/.tmux.conf.local .
fi
