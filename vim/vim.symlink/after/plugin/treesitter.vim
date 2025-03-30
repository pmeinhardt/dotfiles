" Configure nvim-treesitter (https://github.com/nvim-treesitter/nvim-treesitter).
if has('nvim')
  lua << EOF
    require('nvim-treesitter.configs').setup({
      -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/README.md#highlight
      highlight = {
        enable = true,
      },

      -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/README.md#incremental-selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          node_decremental = "<s-cr>",
          scope_incremental = false,
        },
      },

      -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/README.md#indentation
      indent = {
        enable = true,
      },
    })
EOF
endif
