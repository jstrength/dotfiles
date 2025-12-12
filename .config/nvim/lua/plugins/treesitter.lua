return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ensure_installed = { "go", "vue", "typescript", "javascript", "css", "html", "json", "sql", "xml" }
            require("nvim-treesitter").install(ensure_installed)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local bufnr = args.buf
                    local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
                    if not ok or not parser then
                        return
                    end
                    pcall(vim.treesitter.start)
                end,
                desc = "Initialize treesitter for supported file types",
            })
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldlevel = 99
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
    {
        -- Additional text objects for treesitter
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        keys = {
            -- keymaps
            {
                "<leader>a",
                function()
                    require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
                end,
                desc = "Swap next",
            },
            {
                "<leader>A",
                function()
                    require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
                end,
                desc = "Swap previous",
            },
            {
                "]m",
                function()
                    require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
                end,
                desc = "Next function",
            },

            {
                "[m",
                function()
                    require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
                end,
                desc = "Previous function",
            },
        },
    },
}
