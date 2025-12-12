vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.encoding = "utf8"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.colorcolumn = "120"

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Netrw Configuration
-- vim.g.netrw_banner = 1
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_winsize = 30
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 0
-- vim.g.netrw_keepdir = 0

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
