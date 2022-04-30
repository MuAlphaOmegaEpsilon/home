if [ "${TERM}" = "linux" ]; then
	$(command -v setfont) /usr/share/consolefonts/Lat15-Terminus18x10.psf.gz;
	$(command -v setvtrgb) "${HOME}"/.config/vtrgb/maze;
fi

if [ -z "${TMUX:-}" ] && [ -n "${PS1:-}" ]; then
	exec tmux -f "${HOME}/.config/tmux/tmux.conf" new-session -A -s "${XDG_SESSION_TYPE:-bash}${XDG_VTNR:-}"
	exit
fi

if [ -f /etc/profile ]; then . /etc/profile; fi
. "${HOME}"/.config/profile.d/env
. "${HOME}"/.config/profile.d/alias
for file in "${HOME}"/.config/private.d/*; do . "${file}"; done
for file in "${HOME}"/.config/profile.d/"$(hostname)"/*; do . "${file}"; done

if [ "${TMUX_PANE}" == "%0" ]; then
	neofetch
fi

if [ -f /etc/bash.bashrc ]; then . /etc/bash.bashrc; fi
if [ -f /usr/share/defaults/etc/bash.bashrc ]; then	. /usr/share/defaults/etc/bash.bashrc; fi
for file in "${HOME}"/.config/profile.d/autocomplete/*; do . "${file}"; done

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

eval "$(dircolors ${HOME}/.config/dircolors)"	# Set the LS_COLORS env variable
shopt -s autocd checkjobs checkwinsize direxpand globstar
tabs 4

prompt_command_tmux() {
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
PROMPT_COMMAND=prompt_command_tmux
