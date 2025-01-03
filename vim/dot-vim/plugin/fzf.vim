" Enable per-command history
"
" - History files will be stored in the specified directory
" - CTRL-N and CTRL-P will be bound to 'next-history' and 'previous-history'
"
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Fill quickfix list from selection
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{"filename": v:val}'))
  copen
endfunction

" Set keybindings for opening selected files in different ways
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Display the window at the bottom of the screen
let g:fzf_layout = {'down': '40%'}

" Hide preview window by default, <c-space> to toggle
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-space']

" Hide statusline for a cleaner look
if has('nvim')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noruler
    \ | autocmd BufLeave <buffer> set laststatus=2 ruler
endif
