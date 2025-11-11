vim.opt.number = true
vim.opt.cursorline = true
vim.opt.encoding = 'utf8'

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.api.nvim_create_user_command('Config',
function() 
    vim.cmd.Ex(vim.fn.stdpath('config'))
end,
{})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank({ timeout = 1000 }) end,
    desc = "Briefly highlight yanked text"
})
