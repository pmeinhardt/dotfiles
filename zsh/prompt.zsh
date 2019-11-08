# Pure
#
# This is a radically trimmed-down version of:
# https://github.com/sindresorhus/pure
#
# Changes:
#
# - remove async tasks for git status information
# - no display of command execution times
# - use a single-line prompt without a "preprompt"
# - update colors
#
# Prompt:
#
# %F      => color dict
# %f      => reset color
# %~      => current path
# %*      => time
# %n      => username
# %m      => shortname host
# %(?..)  => prompt conditional - %(condition.true.false)
#
# Terminal codes:
#
# \e7     => save cursor position
# \e[2A   => move cursor 2 lines up
# \e[1G   => go to position 1 in terminal
# \e8     => restore cursor position
# \e[K    => clears everything after the cursor on the current line
# \e[2K   => clear everything on the current line

prompt_pure_set_title() {
	setopt localoptions noshwordsplit

	# Emacs terminal does not support setting the title.
	(( ${+EMACS} )) && return

	case $TTY in
		# Don't set title over serial console.
		/dev/ttyS[0-9]*) return;;
	esac

	# Show hostname if connected via SSH.
	local hostname=
	if [[ -n $prompt_pure_state[username] ]]; then
		# Expand in-place in case ignore-escape is used.
		hostname="${(%):-(%m) }"
	fi

	local -a opts
	case $1 in
		expand-prompt) opts=(-P);;
		ignore-escape) opts=(-r);;
	esac

	# Set title atomically in one print statement so that it works when XTRACE is enabled.
	print -n $opts $'\e]0;'${hostname}${2}$'\a'
}

prompt_pure_preexec() {
	# Shows the current directory and executed command in the title while a process is active.
	prompt_pure_set_title 'ignore-escape' "$PWD:t: $2"
}

prompt_pure_precmd() {
	# Shows the full path in the title.
	prompt_pure_set_title 'expand-prompt' '%~'

	# Make sure VIM prompt is reset.
	prompt_pure_reset_prompt_symbol
}

prompt_pure_reset_prompt() {
	if [[ $CONTEXT == cont ]]; then
		# When the context is "cont", PS2 is active and calling
		# reset-prompt will have no effect on PS1, but it will
		# reset the execution context (%_) of PS2 which we don't
		# want. Unfortunately, we can't save the output of "%_"
		# either because it is only ever rendered as part of the
		# prompt, expanding in-place won't work.
		return
	fi

	zle && zle .reset-prompt
}

prompt_pure_reset_prompt_symbol() {
	prompt_pure_state[prompt]=${PURE_PROMPT_SYMBOL:-❯}
}

prompt_pure_update_vim_prompt_widget() {
	setopt localoptions noshwordsplit
	prompt_pure_state[prompt]=${${KEYMAP/vicmd/${PURE_PROMPT_VICMD_SYMBOL:-❮}}/(main|viins)/${PURE_PROMPT_SYMBOL:-❯}}

	prompt_pure_reset_prompt
}

prompt_pure_reset_vim_prompt_widget() {
	setopt localoptions noshwordsplit
	prompt_pure_reset_prompt_symbol

	# We can't perform a prompt reset at this point because it
	# removes the prompt marks inserted by macOS Terminal.
}

prompt_pure_state_setup() {
	setopt localoptions noshwordsplit

	# Check SSH_CONNECTION and the current state.
	local ssh_connection=${SSH_CONNECTION:-$PROMPT_PURE_SSH_CONNECTION}
	local username hostname
	if [[ -z $ssh_connection ]] && (( $+commands[who] )); then
		# When changing user on a remote system, the $SSH_CONNECTION
		# environment variable can be lost. Attempt detection via `who`.
		local who_out
		who_out=$(who -m 2>/dev/null)
		if (( $? )); then
			# Who am I not supported, fallback to plain who.
			local -a who_in
			who_in=( ${(f)"$(who 2>/dev/null)"} )
			who_out="${(M)who_in:#*[[:space:]]${TTY#/dev/}[[:space:]]*}"
		fi

		local reIPv6='(([0-9a-fA-F]+:)|:){2,}[0-9a-fA-F]+'  # Simplified, only checks partial pattern.
		local reIPv4='([0-9]{1,3}\.){3}[0-9]+'   # Simplified, allows invalid ranges.
		# Here we assume two non-consecutive periods represents a
		# hostname. This matches `foo.bar.baz`, but not `foo.bar`.
		local reHostname='([.][^. ]+){2}'

		# Usually the remote address is surrounded by parenthesis, but
		# not on all systems (e.g. busybox).
		local -H MATCH MBEGIN MEND
		if [[ $who_out =~ "\(?($reIPv4|$reIPv6|$reHostname)\)?\$" ]]; then
			ssh_connection=$MATCH

			# Export variable to allow detection propagation inside
			# shells spawned by this one (e.g. tmux does not always
			# inherit the same tty, which breaks detection).
			export PROMPT_PURE_SSH_CONNECTION=$ssh_connection
		fi
		unset MATCH MBEGIN MEND
	fi

	# Show `username@host` if logged in through SSH.
	[[ -n $ssh_connection ]] && username='%F{$prompt_pure_colors[user]}%n@%m%f'

	# Show `username@host` if root, with username in default color.
	[[ $UID -eq 0 ]] && username='%F{$prompt_pure_colors[user:root]}%n@%m%f'

	typeset -gA prompt_pure_state
	prompt_pure_state+=(
		prompt	 "${PURE_PROMPT_SYMBOL:-❯}"
		username "$username"
	)
}

prompt_pure_setup() {
	prompt_opts=(subst percent)

	# Borrowed from `promptinit`. Sets the prompt options in case Pure was not
	# initialized via `promptinit`.
	setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

	if [[ -z $prompt_newline ]]; then
		# This variable needs to be set, usually set by promptinit.
		typeset -g prompt_newline=$'\n%{\r%}'
	fi

	zmodload zsh/zle
	zmodload zsh/parameter
	zmodload zsh/zutil

	autoload -Uz add-zsh-hook

	# The `add-zle-hook-widget` function is not guaranteed to be available.
	# It was added in Zsh 5.3.
	autoload -Uz +X add-zle-hook-widget 2>/dev/null

	# Set the colors.
	typeset -gA prompt_pure_colors_default prompt_pure_colors
	prompt_pure_colors_default=(
		path                 242
		prompt:error         red
		prompt:success       white
		user                 242
		user:root            default
        continuation         242
	)
	prompt_pure_colors=("${(@kv)prompt_pure_colors_default}")

	add-zsh-hook precmd prompt_pure_precmd
	add-zsh-hook preexec prompt_pure_preexec

	prompt_pure_state_setup

	zle -N prompt_pure_reset_prompt
	zle -N prompt_pure_update_vim_prompt_widget
	zle -N prompt_pure_reset_vim_prompt_widget

	if (( $+functions[add-zle-hook-widget] )); then
		add-zle-hook-widget zle-line-finish prompt_pure_reset_vim_prompt_widget
		add-zle-hook-widget zle-keymap-select prompt_pure_update_vim_prompt_widget
	fi

    # Initial newline, for spaciousness.
    PROMPT='${prompt_newline}'

	# Username and machine, if applicable.
	[[ -n $prompt_pure_state[username] ]] && PROMPT+='$prompt_pure_state[username]%F{${prompt_pure_colors[path]}}:%f'

    # Path.
    PROMPT+='%F{${prompt_pure_colors[path]}}%~%f '

    # Prompt symbol with success/error color.
	PROMPT+='%(?.%F{$prompt_pure_colors[prompt:success]}.%F{$prompt_pure_colors[prompt:error]})${prompt_pure_state[prompt]}%f '

	# Indicate continuation prompt by … and use a darker color for it.
	PROMPT2='%F{${prompt_pure_colors[continuation]}}%_%f '

	# Store prompt expansion symbols for in-place expansion via (%). For
	# some reason it does not work without storing them in a variable first.
	typeset -ga prompt_pure_debug_depth
	prompt_pure_debug_depth=('%e' '%N' '%x')

	# Compare is used to check if %N equals %x. When they differ, the main
	# prompt is used to allow displaying both filename and function. When
	# they match, we use the secondary prompt to avoid displaying duplicate
	# information.
	local -A ps4_parts
	ps4_parts=(
		depth 	  '%F{yellow}${(l:${(%)prompt_pure_debug_depth[1]}::+:)}%f'
		compare   '${${(%)prompt_pure_debug_depth[2]}:#${(%)prompt_pure_debug_depth[3]}}'
		main      '%F{blue}${${(%)prompt_pure_debug_depth[3]}:t}%f%F{242}:%I%f %F{242}@%f%F{blue}%N%f%F{242}:%i%f'
		secondary '%F{blue}%N%f%F{242}:%i'
		prompt 	  '%F{242}>%f '
	)
	# Combine the parts with conditional logic. First the `:+` operator is
	# used to replace `compare` either with `main` or an ampty string. Then
	# the `:-` operator is used so that if `compare` becomes an empty
	# string, it is replaced with `secondary`.
	local ps4_symbols='${${'${ps4_parts[compare]}':+"'${ps4_parts[main]}'"}:-"'${ps4_parts[secondary]}'"}'

	# Improve the debug prompt (PS4), show depth by repeating the +-sign and
	# add colors to highlight essential parts like file and function name.
	PROMPT4="${ps4_parts[depth]} ${ps4_symbols}${ps4_parts[prompt]}"
}

prompt_pure_setup "$@"
