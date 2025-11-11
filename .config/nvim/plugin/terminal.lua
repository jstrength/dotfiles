-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", [["<c-\><c-n>"]])
-- Naviaget to new window in any mode
vim.keymap.set({ "t", "i" }, "<A-h>", [["<c-\><c-n><c-w>h"]])
vim.keymap.set({ "t", "i" }, "<A-j>", [["<c-\><c-n><c-w>j"]])
vim.keymap.set({ "t", "i" }, "<A-k>", [["<c-\><c-n><c-w>k"]])
vim.keymap.set({ "t", "i" }, "<A-l>", [["<c-\><c-n><c-w>l"]])
vim.keymap.set("n", "<A-h>", "<c-w>h")
vim.keymap.set("n", "<A-j>", "<c-w>j")
vim.keymap.set("n", "<A-k>", "<c-w>k")
vim.keymap.set("n", "<A-l>", "<c-w>l")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>ts", function()
    vim.cmd.new()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
end, 
{ desc = "Start terminal at botom of screen" })

-- Enter insert mode when starting terminal
vim.api.nvim_create_autocmd("TermOpen", {
    command = "startinsert",
})
