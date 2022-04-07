" Enable nvim-treesitter modules. For a list of available modules see:
" https://github.com/nvim-treesitter/nvim-treesitter#available-modules
if exists(':TSEnableAll')
  TSEnableAll highlight
  TSEnableAll indent
endif
