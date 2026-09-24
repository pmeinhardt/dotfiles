if findfile('package.json', '.;') != ''
  " Use ESLint and TS Server for linting in classic Vim.
  if !has('nvim-0.12.0')
    let b:ale_linters = ['eslint', 'tsserver']
  endif

  " Use ESLint to fix code issues
  let b:ale_fixers = ['eslint']
else
  " Use Deno for linting and fixing code issues in classic Vim.
  if !has('nvim-0.12.0')
    let b:ale_linters = ['deno']
  endif
  let b:ale_fixers = ['deno']
endif
