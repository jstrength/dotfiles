-- Toggle hlsearch if it's on, otherwise just do "enter"
vim.keymap.set("n", "<CR>", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.v.hlsearch == 1 then
        vim.cmd.nohl()
        return ""
    else
        return vim.keycode "<CR>"
    end
end, { expr = true })

vim.keymap.set('n', '<leader>ff',  '<cmd>FzfLua files<cr>', { desc = "Fuzzy Finder Files"})
vim.keymap.set('n', '<leader>fr',  '<cmd>FzfLua oldfiles<cr>', { desc = "Fuzzy Finder Recent Files"})
vim.keymap.set('n', '<leader>fb',  '<cmd>FzfLua buffers<cr>', { desc = "Fuzzy Finder Buffers"})
vim.keymap.set('n', '<leader>fi',  '<cmd>FzfLua builtin<cr>', { desc = "Fuzzy Finder Builtins"})
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = "open current dir" })
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format, { desc = "format current file" })
