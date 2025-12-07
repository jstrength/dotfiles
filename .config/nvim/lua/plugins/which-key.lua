return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        spec = {
            {
                "<leader>b",
                group = "buffers",
                expand = function()
                    return require("which-key.extras").expand.buf()
                end,
            },
            { "<leader>d", group = "diagnostics" },
            { "<leader>f", group = "fuzzy finder" },
            { "<leader>g", group = "git" },
            { "<leader>l", group = "lsp" },
            { "<leader>n", group = "notifications" },
            { "<leader>t", group = "terminals" },
            { "<leader>x", group = "debug" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,

            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
