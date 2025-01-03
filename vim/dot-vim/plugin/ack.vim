" Use 'ack' alternatives that support ignore files if available.
if executable('rg')
  " Use `rg` for searching if available (supports 'ignore' files).
  let g:ackprg = 'rg --vimgrep --smart-case'
elseif executable('ag')
  " Use `ag` for searching if available (partially supports 'ignore' files).
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
