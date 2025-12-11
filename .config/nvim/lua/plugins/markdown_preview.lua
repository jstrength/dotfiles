return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.api.nvim_exec2(
            [[
            function OpenMarkdownPreview (url)
                execute 'silent ! open -a "Google Chrome" -n --args --new-window ' . a:url
            endfunction
            let g:mkdp_browserfunc = 'OpenMarkdownPreview'
            ]],
            {}
        )
    end,
    ft = { "markdown" },
}
