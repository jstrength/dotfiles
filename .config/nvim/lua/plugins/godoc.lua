return {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
        -- { "nvim-telescope/telescope.nvim" }, -- optional
        -- { "folke/snacks.nvim" }, -- optional
        -- { "echasnovski/mini.pick" }, -- optional
        { "ibhagwan/fzf-lua" }, -- optional
        {
            "nvim-treesitter/nvim-treesitter",
            opts = {
                ensure_installed = { "go" },
            },
        },
    },
    ft = "go",
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
    cmd = { "GoDoc" },                                                 -- optional
    keys = {
        { '<leader>fd', '<cmd>GoDoc<cr>', desc = 'Go docs', ft = "go" }
    },
    opts = {
        picker = {
            type = "fzf_lua",
        }
    }
}
