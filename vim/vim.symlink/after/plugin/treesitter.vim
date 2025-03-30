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

      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
          },
          goto_previous_start = {
            ["[s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
          },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ac"] = { query = "@class.outer", desc = "Select class" },
            ["ic"] = { query = "@class.inner", desc = "Select class body" },
            ["af"] = { query = "@function.outer", desc = "Select function" },
            ["if"] = { query = "@function.inner", desc = "Select function body" },
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["]$"] = { query = "@parameter.inner", desc = "Move parameter right" },
          },
          swap_previous = {
            ["[$"] = { query = "@parameter.inner", desc = "Move parameter left" },
          },
        },
      },
    })
EOF
endif
