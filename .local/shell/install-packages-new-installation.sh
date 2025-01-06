#!/bin/sh
set -euf

sudo apt update
sudo apt upgrade
sudo apt remove firefox-esr
sudo apt install bat build-essential cmake curl fd-find ffmpeg firefox fonts-terminus gawk gcolor3 gimp git git-cola gnome-shell-extensions gnome-shell-extension-blur-my-shell gnome-shell-extension-caffeine gnome-shell-extension-dashtodock gnome-shell-extension-desktop-icons-ng gnome-shell-extension-tiling-assistant heif-gdk-pixbuf hexyl htop hwinfo imagemagick libxcb-cursor0 lshw neovim ninja-build plocate pass ripgrep telegram-desktop tmux tree
