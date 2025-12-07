return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        sections = {

            lualine_c = {
                {
                    "filename",
                    file_status = true, -- Shows file status (readonly, modified)
                    symbols = {
                        modified = "[MODIFIED]", -- Text to show when the file is modified
                        readonly = "[READONLY]", -- Text to show when the file is readonly
                    },
                    color = function()
                        return (vim.bo.modified or vim.bo.readonly) and { fg = "red" } or nil
                    end,
                },
            },
        },
    },
}
