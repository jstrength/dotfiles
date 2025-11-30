vim.g.mapleader = ' '

require('config.lazy')

vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
--vim.lsp.enable('jsonls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('html')
vim.lsp.config['asm'] = {
    cmd = { 'asm-lsp' },
    -- Filetypes to automatically attach to.
    filetypes = { 'asm' },
}
vim.lsp.enable('asm')
