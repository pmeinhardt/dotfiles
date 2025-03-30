" Configure nvim-treesitter: https://github.com/nvim-treesitter/nvim-treesitter
if has('nvim')
  lua << EOF
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          node_decremental = "<bs>",
          scope_incremental = "<s-cr>",
        },
      },
      indent = {
        enable = true,
      },
    })
EOF
endif
