local function find_sessions()
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
    if #sessions > 0 then
        return sessions
    else
        return nil
    end
end
local function notify_sessions()
    local sessions = find_sessions()
    if sessions then
        local msg = "Found available sessions:"
        for _, sess in ipairs(sessions) do
            msg = msg .. "\n\t" .. sess
        end
        vim.notify(msg)
    end
end
local function select_session()
    local sessions = find_sessions()
    if not sessions then
        vim.notify("No sessions found")
        return
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
    callback = notify_sessions,
})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = notify_sessions,
    once = true,
})
vim.keymap.set("n", "<leader>sl", notify_sessions, { desc = "List sessions" })
vim.keymap.set("n", "<leader>ss", select_session, { desc = "Select session" })
