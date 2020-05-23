export XDG_CONFIG_HOME="${HOME}/.config"		# Where user configuration files should be stored
export XDG_CACHE_HOME="${HOME}/.cache"			# Where user non-essential data files should be stored
export XDG_LOCAL_HOME="${HOME}/.local"			# Where user main dirs should be stored
export XDG_DATA_HOME="${HOME}/.local/share"		# Where user data files should be stored
export XDG_3RD_PARTY="${HOME}/3rd-party"		# Where 3rd party git users directories should be stored

if [ "${TERM}" = "linux" ]; then
	$(command -v setfont) /usr/share/consolefonts/Lat15-Terminus20x10.psf.gz;
	$(command -v setvtrgb) "${XDG_CONFIG_HOME}"/vtrgb/maze;
fi

if [ -z "${TMUX:-}" ] && [ -n "${PS1:-}" ]; then
	exec /usr/bin/tmux -f "${XDG_CONFIG_HOME}/tmux/tmux.conf" new-session -A -s "${XDG_SESSION_TYPE}${XDG_VTNR:-}"
	tabs 4
	exit
fi

. "${XDG_CONFIG_HOME}"/profile.d/aliases
. "${XDG_CONFIG_HOME}"/profile.d/env
for file in "${XDG_CONFIG_HOME}"/private.d/*; do . "${file}"; done
for file in "${XDG_CONFIG_HOME}"/profile.d/"$(hostname)"/*; do . "${file}"; done

if [ -f /etc/profile ]; then . /etc/profile; fi

if [ -n "${BASH_VERSION:-}" ]; then
	shopt -s autocd								# Automatically cd into a directory
	shopt -s cdable_vars						# Use vars content as dir names
	shopt -s cdspell							# Autocorrect typos in path names when using cd
	shopt -s checkjobs							# Notify about running jobs on exit
	shopt -s checkwinsize						# Update LINES and COLUMNS after each command
	shopt -s direxpand							# Complete dir name on word expansion
	shopt -s dirspell							# Autocorrect directory spelling
	shopt -s globstar							# Enable the "**" pattern for globbing

	if [ -f /etc/bash.bashrc ]; then . /etc/bash.bashrc; fi
	if [ -f /usr/share/defaults/etc/bash.bashrc ]; then	. /usr/share/defaults/etc/bash.bashrc; fi
	for file in "${XDG_CONFIG_HOME}"/profile.d/autocomplete/*; do . "${file}"; done

	[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

	export HISTSIZE=1000						# History live should have this many lines
	export HISTCONTROL=ignoreboth				# No duplicate and no space-starting lines

	eval "$(dircolors ${XDG_CONFIG_HOME}/dircolors)"	# Set the LS_COLORS env variable

	neofetch
fi

export EDITOR=nano
export MOZ_ENABLE_WAYLAND=1						# Enable Wayland usage for Mozilla Firefox
export PATH="${XDG_LOCAL_HOME}/bin:${PATH}"		# Include generic executables files in PATH
export PATH="${XDG_LOCAL_HOME}/shell:${PATH}"	# Include user shell files in PATH
export PATH="${XDG_LOCAL_HOME}/shell/$(hostname):${PATH}" # Include user machine-specific shell files in PATH
export PS1="> "									# Customize prompt
