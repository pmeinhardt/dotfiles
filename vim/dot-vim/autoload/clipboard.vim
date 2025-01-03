function! clipboard#yank(type, ...) abort
  if a:type ==# 'setup'
    let &operatorfunc = 'clipboard#yank'
    return 'g@'
  endif

  let reg = '+'

  if a:type ==# 'char'
    execute 'normal! `[v`]"' . reg . 'y'
  elseif a:type ==# 'line'
    execute 'normal! `[V`]"' . reg . 'y'
  elseif a:type ==# 'block'
    execute 'normal! `[<c-v>`]"' . reg . 'y'
  endif
endfunction
