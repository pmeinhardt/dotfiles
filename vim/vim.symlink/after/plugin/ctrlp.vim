" Hide ignored files from CtrlP.
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

" Use `fd` as a fallback if available (faster and supports 'ignore' files).
if executable('fd')
  let g:ctrlp_user_command['fallback'] = 'fd --type f --hidden --color never . %s'
endif

" Disable caching in CtrlP.
let g:ctrlp_use_caching = 0
