-- Toggle hlsearch if it's on, otherwise just do "enter"
vim.keymap.set("n", "<CR>", function()
    if vim.v.hlsearch == 1 then
        vim.cmd.nohl()
        return ""
    else
        return vim.keycode("<CR>")
    end
end, { expr = true })

vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "open current dir" })
vim.keymap.set("n", "<leader>fc", function()
    vim.cmd.Ex(vim.fn.stdpath("config"))
end, { desc = "open config dir" })

vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, { desc = "format current file" })
vim.keymap.set("n", "<leader>cd", function()
    vim.cmd("cd " .. vim.fn.expand("%:p:h"))
end, { desc = "Change working dir to current buffers" })

vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "q", "<nop>")
