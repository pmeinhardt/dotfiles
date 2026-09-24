if !has('nvim-0.12.0') | finish | endif

lua << EOF
local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then return end

local util = require('lspconfig.util')

vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup' }
vim.opt.pumheight = 12

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
})

local function jump_to_diagnostic(bufnr, index)
  local diagnostics = vim.diagnostic.get(bufnr)
  if vim.tbl_isempty(diagnostics) then return end

  table.sort(diagnostics, function(a, b)
    if a.lnum == b.lnum then
      return a.col < b.col
    end

    return a.lnum < b.lnum
  end)

  local diagnostic = diagnostics[index]
  if not diagnostic then return end

  vim.api.nvim_win_set_cursor(0, {
    diagnostic.lnum + 1,
    diagnostic.col or 0,
  })
  vim.diagnostic.open_float(nil, { scope = 'cursor' })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('dotfiles-lsp', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if vim.lsp.completion
      and client:supports_method('textDocument/completion')
    then
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true,
      })
    end

    vim.bo[args.buf].tagfunc = 'v:lua.vim.lsp.tagfunc'

    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = args.buf,
        silent = true,
      })
    end

    map({ 'n', 'x' }, 'gA', vim.lsp.buf.code_action)
    map('n', 'gd', vim.lsp.buf.definition)
    map('n', 'gD', vim.lsp.buf.type_definition)
    map('n', 'gI', vim.lsp.buf.implementation)
    map('n', 'gK', function() vim.diagnostic.open_float(nil, { scope = 'cursor' }) end)
    map('n', 'gr', vim.lsp.buf.references)
    map('n', 'K', vim.lsp.buf.hover)
    map('n', '[d', vim.diagnostic.goto_prev)
    map('n', ']d', vim.diagnostic.goto_next)
    map('n', '[D', function() jump_to_diagnostic(args.buf, 1) end)
    map('n', ']D', function()
      jump_to_diagnostic(args.buf, #vim.diagnostic.get(args.buf))
    end)
    map('n', '<leader>i', function()
      vim.diagnostic.open_float(nil, { scope = 'cursor' })
    end)
    map('n', '<leader>r', vim.lsp.buf.rename)
  end,
})

local servers = {
  {
    name = 'gopls',
    bin = 'gopls',
  },
  {
    name = 'rust_analyzer',
    bin = 'rust-analyzer',
  },
  {
    name = 'eslint',
    bin = 'vscode-eslint-language-server',
    config = {
      settings = {
        workingDirectory = { mode = 'auto' },
      },
    },
  },
  {
    names = { 'ts_ls', 'tsserver' },
    bin = 'typescript-language-server',
    config = {
      root_dir = function(fname)
        if util.root_pattern('deno.json', 'deno.jsonc')(fname) then
          return nil
        end

        return util.root_pattern(
          'package.json',
          'tsconfig.json',
          'jsconfig.json',
          '.git'
        )(fname)
      end,
      single_file_support = false,
    },
  },
  {
    name = 'denols',
    bin = 'deno',
    config = {
      root_dir = util.root_pattern('deno.json', 'deno.jsonc'),
      single_file_support = false,
    },
  },
}

for _, server in ipairs(servers) do
  if vim.fn.executable(server.bin) == 1 then
    for _, name in ipairs(server.names or { server.name }) do
      if lspconfig[name] then
        lspconfig[name].setup(server.config or {})
        break
      end
    end
  end
end
EOF
