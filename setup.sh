#!/bin/sh
set -euf

# Navigate to the folder containing this file
cd "$(dirname "$0")"

stow "$(dirname "$0")" --ignore=.sh --ignore=.gitmodules --target "${HOME}"
