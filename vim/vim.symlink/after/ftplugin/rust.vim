" Use rust-analyzer and cargo/rustc for linting
if has('nvim-0.12.0')
  let b:ale_linters = ['cargo']
else
  let b:ale_linters = ['analyzer', 'cargo']
endif

" Use rustfmt to fix code formatting
let b:ale_fixers = ['rustfmt']
