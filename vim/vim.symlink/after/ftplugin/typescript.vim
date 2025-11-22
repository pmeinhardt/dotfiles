if findfile('package.json', '.;') != ''
  " Use ESLint and TS Server for linting
  let b:ale_linters = ['eslint', 'tsserver']

  " Use ESLint to fix code issues
  let b:ale_fixers = ['eslint']
else
  " Use Deno for linting and fixing code issues
  let b:ale_linters = ['deno']
  let b:ale_fixers = ['deno']
endif
