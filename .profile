
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
	shopt -s checkjobs							# Notify about running jobs on exit
	shopt -s checkwinsize						# Update LINES and COLUMNS after each command
	shopt -s direxpand							# Complete dir name on word expansion
	shopt -s globstar							# Enable the "**" pattern for globbing

	if [ -f /etc/bash.bashrc ]; then . /etc/bash.bashrc; fi
	if [ -f /usr/share/defaults/etc/bash.bashrc ]; then	. /usr/share/defaults/etc/bash.bashrc; fi
	for file in "${XDG_CONFIG_HOME}"/profile.d/autocomplete/*; do . "${file}"; done

	[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

	eval "$(dircolors ${XDG_CONFIG_HOME}/dircolors)"	# Set the LS_COLORS env variable

	neofetch
fi


prompt_command() {
	if [ "$?" -eq 0 ]; then
		export PS1="\[$(tput bold)\]>\[$(tput sgr0)\] "
	else
		export PS1="\[$(tput setaf 1)\]>\[$(tput sgr0)\] "
	fi
	TMUX_CURRENT_REFRESH=$(date +%s)
	TMUX_DELTA_REFRESH=$(($TMUX_CURRENT_REFRESH - ${TMUX_LAST_REFRESH:-0}))
	export TMUX_LAST_REFRESH=${TMUX_CURRENT_REFRESH}
	if [ "${TMUX_DELTA_REFRESH}" -gt 1 ]; then
		tmux refresh -S
	fi
}
PROMPT_COMMAND=prompt_command
