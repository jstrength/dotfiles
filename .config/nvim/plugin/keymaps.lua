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

local function cb()
    local cwd = vim.uv.cwd()
    local sessions = {}
    if not cwd then
        return
    end
    for name, type in vim.fs.dir(cwd) do
        -- if type == "file" and vim.endswith(name, ".vim") then
        if type == "file" then
            local contents = io.open(name, "r")
            if contents then
                for line in contents:lines("*l") do
                    if line == "let SessionLoad = 1" then
                        table.insert(sessions, name)
                    else
                        break
                    end
                end
                contents:close()
            end
        end
    end
    -- check if file begins with:
    -- also don't ask if they opened a session file
    if #sessions > 0 then
        vim.ui.select(sessions, { prompt = "Select Session to load" }, function(choice)
            if choice then
                vim.cmd("source " .. choice)
            end
        end)
    end
end
vim.api.nvim_create_autocmd({ "DirChanged" }, {
    callback = cb,
})
vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "VeryLazy",
    callback = function()
        vim.schedule(cb)
    end,
    once = true,
})
vim.keymap.set("n", "qq", cb)
