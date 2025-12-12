return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        local uname_info = vim.loop.os_uname()

        if uname_info.sysname == "Linux" then
            if string.find(uname_info.release, "WSL") then
                vim.api.nvim_exec2(
                    [[
                      function OpenMarkdownPreview (url)
                        let l:cmd_args = '"--new-window ' . a:url . '"'
                        execute "silent ! powershell.exe -Command start chrome " . shellescape(l:cmd_args)
                      endfunction
                      let g:mkdp_browserfunc = 'OpenMarkdownPreview'
                    ]],
                    {}
                )
            end
        elseif uname_info.sysname == "Darwin" then
            vim.api.nvim_exec2(
                [[
                function OpenMarkdownPreview (url)
                    execute 'silent ! open -a "Google Chrome" -n --args --new-window ' . a:url
                endfunction
                let g:mkdp_browserfunc = 'OpenMarkdownPreview'
                ]],
                {}
            )
        end
    end,
    ft = { "markdown" },
}
