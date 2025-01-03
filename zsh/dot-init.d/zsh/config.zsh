# Enable colors. See `man ls`.
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true


# Add `functions` directory to shell search path.
fpath=($ZSH/functions $fpath)

# Autoload functions.
autoload -U $ZSH/functions/*(:t)


# Configure shell history (more options are set below).
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


# Specify zsh options. See `man zshoptions`.

# If this is set, zsh sessions will append their history list to the history
# file, rather than replace it.
setopt APPEND_HISTORY

# Do not run background jobs at a lower priority.
setopt NO_BG_NICE

# Prevent aliases on the command line from being internally substituted before
# completion is attempted.
setopt COMPLETE_ALIASES

# Allow completions in the middle of a word.
setopt COMPLETE_IN_WORD

# Try to correct the spelling of commands.
setopt CORRECT

# Save each command’s beginning timestamp and duration to the history file.
setopt EXTENDED_HISTORY

# If a new command line being added to the history list duplicates an older
# one, the older command is removed from the list.
setopt HIST_IGNORE_ALL_DUPS

# Remove superfluous blanks from each command being added to the history list.
setopt HIST_REDUCE_BLANKS

# Whenever the user enters a line with history expansion, do not execute the
# line directly. Instead, perform history expansion and reload the line into
# the editing buffer.
setopt HIST_VERIFY

# Do not send the HUP signal to running jobs when the shell exits.
setopt NO_HUP

# Do not exit on end-of-file.
setopt IGNORE_EOF

# Allow functions to have local options.
setopt LOCAL_OPTIONS

# Allow functions to have local traps
setopt LOCAL_TRAPS

# Do not beep on an ambiguous completion.
setopt NO_LIST_BEEP

# If set, parameter expansion, command substitution and arithmetic expansion
# are performed in prompts.
setopt PROMPT_SUBST

# Import new commands from the history file, and append typed commands to it.
setopt SHARE_HISTORY


# Define key bindings for cursor movement. See `man zshzle`.

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char


# Better history: Start typing + arrow up/down key to find in history.
# See `man zshzle` and `man zshcontrib`.

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
