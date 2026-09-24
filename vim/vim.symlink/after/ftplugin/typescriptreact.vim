if !has('nvim-0.12.0')
  " Use ESLint and TS Server for linting
  let b:ale_linters = ['eslint', 'tsserver']
endif

" Use ESLint to fix code issues
let b:ale_fixers = ['eslint']
