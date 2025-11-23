vim.g.mapleader = ' '

require('config.lazy')

vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
--vim.lsp.enable('jsonls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('html')
