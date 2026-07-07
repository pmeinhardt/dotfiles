" Tree-sitter highlighting + incremental selection (Neovim 0.12+).
"
" The nvim-treesitter *main* branch is only a parser installer + query provider;
" it does not enable features itself. So here we (1) turn on tree-sitter
" highlighting per code buffer and (2) map <CR>/<S-CR> to grow/shrink the
" selection on top of Neovim's native `an`/`in` node maps.
"
" Parsers are not installed automatically -- install them per language as you
" need them with :TSInstall <lang> (and :TSUpdate / :TSUninstall to manage).
" Highlighting and the selection maps only activate once a parser is installed.
" Requires the tree-sitter CLI (brew install tree-sitter).

if !has('nvim-0.12.0') | finish | endif

lua << EOF
-- Parser names that differ from the Neovim filetype must be registered.
vim.treesitter.language.register('tsx', 'typescriptreact')

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Tree-sitter highlighting + incremental selection',
  callback = function(ev)
    -- Only attach where a parser exists; quickfix/help/terminal have none,
    -- so start() fails and we bail.
    if not pcall(vim.treesitter.start, ev.buf) then return end

    -- Set up custom keybindings for incremental selection.
    -- remap = true: van/an/in ride on Neovim's built-in node-selection maps.
    local o = { buffer = ev.buf, remap = true, silent = true }
    vim.keymap.set('n', '<cr>',   'van', o)  -- start + grow selection
    vim.keymap.set('x', '<cr>',   'an',  o)  -- grow selection
    vim.keymap.set('x', '<s-cr>', 'in',  o)  -- shrink selection
  end,
})
EOF
