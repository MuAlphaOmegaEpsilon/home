#!/bin/sh
set -euf

sudo apt update
sudo apt upgrade
sudo apt install bat build-essential cmake curl fd-find ffmpeg fonts-terminus gawk gimp git git-cola heif-gdk-pixbuf hexyl htop hwinfo imagemagick libxcb-cursor0 lshw neovim ninja-build plocate telegram-desktop tmux tree
