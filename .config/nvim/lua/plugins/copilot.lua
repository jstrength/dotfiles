return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
    },
    {
        "saghen/blink.cmp",
        optional = true,
        dependencies = { "fang2hou/blink-copilot" },
        opts = {
            sources = {
                default = { "copilot" },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
        },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            model = "gpt-4.1", -- AI model to use
            temperature = 0.1, -- Lower = focused, higher = creative
            window = {
                layout = "vertical", -- 'vertical', 'horizontal', 'float'
                width = 0.5, -- 50% of screen width
            },
            auto_insert_mode = true, -- Enter insert mode when opening
        },
    },
}
