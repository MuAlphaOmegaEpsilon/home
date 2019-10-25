# ~/.profile: executed by the command interpreter for login shells.

export XDG_DATA_HOME="$HOME/.local/share" # Directory relative to which user specific data files should be stored
export XDG_CONFIG_HOME="$HOME/.config" # Directory relative to which user specific configuration files should be stored
export XDG_CACHE_HOME="$HOME/.cache" # Directory relative to which user specific non-essential data files should be stored
PATH="$HOME/.local/bin:$HOME/.local/bin/shell:$PATH" # Include in PATH user's private bin

# Source the bashrc only if running bash
if [ -n "$BASH_VERSION" ]; then
    . "$XDG_CONFIG_HOME/bash/bashrc"
fi
