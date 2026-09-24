# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# menu if at least 2 items
zstyle ':completion:*' menu select=2

# keep completion output readable
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*:warnings' format 'no matches found: %d'

# cache expensive completions
zstyle ':completion:*' use-cache on
[[ -d "$HOME/.zcompcache" ]] || mkdir -p "$HOME/.zcompcache"
zstyle ':completion:*' cache-path "$HOME/.zcompcache"

compdef _targz targz
compdef _mkcd mkcd
compdef _ta ta
