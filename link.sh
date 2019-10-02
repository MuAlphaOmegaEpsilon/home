#!/bin/sh
set -euf

# Navigate to the folder containing this file
cd "$(dirname "$0")"

cd dotfiles/
stow HOME --target ${HOME}
stow XDG_CONFIG_HOME --target ${XDG_CONFIG_HOME}
