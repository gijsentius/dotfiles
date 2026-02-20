#!/bin/bash

brew_install_script="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
bash -c "${brew_install_script}"
