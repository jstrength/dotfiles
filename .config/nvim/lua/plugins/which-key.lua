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
                end
            },
            { "<leader>f", group = "fuzzy finder" },
            { "<leader>t", group = "terminals" },
            { "<leader>x", group = "debug" },
        }
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
