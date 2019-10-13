#!/bin/sh
set -euf

# Navigate to the folder containing this file
cd "$(dirname "$0")"

mkdir -p ${HOME}/.local/bin/shell
stow --dir executables shell --target ${HOME}/.local/bin/shell

stow --dir dotfiles HOME --target ${HOME}
stow --dir dotfiles CONFIG --target ${XDG_CONFIG_HOME}

./dotfiles/CONFIG/nvim/setup.sh
