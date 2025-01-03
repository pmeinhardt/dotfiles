if exists('g:loaded_scratch') || &cp
  finish
endif
let g:loaded_scratch = 1

let s:bufname = '\[Scratch\]'

function! s:scratch() abort
  let bufnum = bufnr(s:bufname)

  if bufnum == -1
    execute 'new ' . s:bufname
  else
    let winnum = bufwinnr(bufnum)

    if winnum == -1
      execute 'split +buffer' . bufnum
    else
      if winnr() != winnum
        execute winnum . 'wincmd w'
      endif
    endif
  endif
endfunction

function! s:mark() abort
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal buflisted
endfunction

augroup scratch
  autocmd!
  execute 'autocmd BufNewFile ' . s:bufname . ' call s:mark()'
augroup end

command! -nargs=0 Scratch call s:scratch()
