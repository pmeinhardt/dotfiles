if !has('nvim') | finish | endif

lua << EOF
local cmp = require('cmp')

cmp.setup({
  mapping = cmp.config.mapping.preset.insert({
    ['<tab>'] = cmp.mapping.confirm({ select = false }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path', option = { trailing_slash = true } },
    { name = 'buffer' },
  }),

  window = {
    documentation = cmp.config.disable,
  },
})
EOF
