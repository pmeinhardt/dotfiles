if exists('g:loaded_hmm')
  finish
endif
let g:loaded_hmm = 1

function! s:new(args) abort
  let cmd = 'hmm'

  if !empty(a:args)
    let cmd .= ' ' . a:args
  endif

  let output = systemlist(cmd)

  if !(empty(bufname('%')) && line('$') == 1 && getline(1) == '')
    new
  endif

  let bname = bufname('%')

  setlocal filetype=markdown
  setlocal spell

  call appendbufline(bname, 0, output)
  call deletebufline(bname, line('$'))

  call cursor(1, 1)
endfunction

" TODO: :command-complete (customlist, dir, …?)
command! -nargs=* Hmm call s:new(<q-args>)
