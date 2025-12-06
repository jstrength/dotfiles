return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {
        files = {},
        defaults = {
            -- You can set default options for rg here
            -- For example, to ignore .gitignored files by default
            follow = true,
        },
    },
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
