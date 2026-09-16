" Use `rg` for searching if available (supports 'ignore' files).
if executable('rg')
  function! s:UpdateAckPrg()
    let l:case = &ignorecase ? (&smartcase ? '--smart-case' : '--ignore-case') : '--case-sensitive'
    let g:ackprg = 'rg --hidden --vimgrep ' . l:case
  endfunction

  augroup AckRgCase
    autocmd!
    autocmd OptionSet ignorecase,smartcase call s:UpdateAckPrg()
  augroup END

  call s:UpdateAckPrg()
endif
