#!/bin/sh
set -euf

# Navigate to the folder containing this file
cd "$(dirname "$0")"
FILE_DIR="$(pwd)"

# Setup symbolic links in HOME directory
set +e
unlink "${HOME}"/developers	2> /dev/null
unlink "${HOME}"/projects	2> /dev/null
unlink "${HOME}"/.profile	2> /dev/null
unlink "${HOME}"/.dircolors	2> /dev/null
unlink "${XDG_LOCAL_HOME}"	2> /dev/null
unlink "${XDG_CONFIG_HOME}" 2> /dev/null
set -e

ln -s -r "${FILE_DIR}"/config						"${XDG_CONFIG_HOME}"
ln -s -r "${XDG_CONFIG_HOME}"/profile				"${HOME}"/.profile
ln -s -r "${XDG_CONFIG_HOME}"/dircolors				"${HOME}"/.dircolors

ln -s -r "${FILE_DIR}"/developers					"${XDG_DEVS_HOME}"
ln -s -r "${XDG_DEVS_HOME}"/MuAlphaOmegaEpsilon		"${HOME}"/projects

ln -s -r "${FILE_DIR}"/local						"${XDG_LOCAL_HOME}"
