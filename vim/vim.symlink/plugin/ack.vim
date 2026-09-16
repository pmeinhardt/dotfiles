" Use 'ack' alternatives that support ignore files if available.
if executable('rg')
  " Use `rg` for searching if available (supports 'ignore' files).
  let g:ackprg = 'rg --hidden --smart-case --vimgrep'
endif
