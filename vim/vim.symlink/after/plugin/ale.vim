" Disable in-code highlights.
let g:ale_set_highlights = 0

" Configure code issue signs.
let g:ale_sign_error = '!'
let g:ale_sign_warning = '~'

" Configure highlighting for code issue signs.
highlight! link ALEErrorSign WarningMsg
highlight! link ALEWarningSign MoreMsg
