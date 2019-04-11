" Use `ag` for searching if available (partially supports 'ignore' files).
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
