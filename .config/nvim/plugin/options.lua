vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.encoding = "utf8"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.undofile = true

vim.cmd("colorscheme habamax")

vim.diagnostic.config({
    --virtual_text = true,
    --virtual_text = { current_line = true },
    virtual_lines = { current_line = true },
    --virtual_lines = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 1000 })
    end,
    desc = "Briefly highlight yanked text",
})
