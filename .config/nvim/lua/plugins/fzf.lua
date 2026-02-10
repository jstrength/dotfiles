return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {
        files = {},
        defaults = {
            actions = {
                ["ctrl-y"] = function(selected)
                    local fzf = require("fzf-lua")
                    local relative_path = fzf.path.entry_to_file(selected[1]).path
                    vim.fn.setreg("", relative_path)
                end,
                ["alt-y"] = function(selected)
                    local fzf = require("fzf-lua")
                    local relative_path = fzf.path.entry_to_file(selected[1]).path
                    local absolute_path = vim.fn.fnamemodify(relative_path, ":p")
                    vim.fn.setreg("", absolute_path)
                end,
                ["ctrl-f"] = function(selected)
                    local fzf = require("fzf-lua")
                    local relative_path = fzf.path.entry_to_file(selected[1]).path
                    local absolute_path = vim.fn.fnamemodify(relative_path, ":p")
                    vim.api.nvim_put({ absolute_path }, "c", true, true)
                end,
            },
            -- You can set default options for rg here
            -- For example, to ignore .gitignored files by default
            follow = true,
        },
    },
    config = function(_, opts)
        require("fzf-lua").setup(opts)
        require("fzf-lua").register_ui_select()
    end,
    keys = {
        { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
        { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
        { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Files" },
        { "<leader>fi", "<cmd>FzfLua builtin<cr>", desc = "All Builtins" },
        { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Neovim Keymaps" },
        { "<leader>fm", "<cmd>FzfLua resume<cr>", desc = "Resume" },
        { "<leader>fo", "<cmd>FzfLua commands<cr>", desc = "Neovim Commands" },
        { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
        { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Buffer Symbols" },
    },
}
