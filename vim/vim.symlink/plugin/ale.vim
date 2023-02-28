" Disable in-code highlights.
" let g:ale_set_highlights = 0

" Configure code issue signs.
let g:ale_sign_error = '┃'
let g:ale_sign_warning = '┃'

" Configure highlighting for code issue signs.
if has('nvim')
  highlight! link ALEError DiagnosticUnderlineError
  highlight! link ALEErrorSign DiagnosticSignError
  highlight! link ALEWarning DiagnosticUnderlineWarn
  highlight! link ALEWarningSign DiagnosticSignWarn
else
  highlight! link ALEError SpellBad
  highlight! link ALEErrorSign WarningMsg
  highlight! link ALEWarning SpellLocal
  highlight! link ALEWarningSign MoreMsg
endif
