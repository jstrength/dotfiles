-- Disable the default keybinds {{{
for _, bind in ipairs({ "grn", "gra", "gri", "grr", "grt" }) do
    pcall(vim.keymap.del, "n", bind)
end
-- }}}

vim.lsp.config("*", {
    root_markers = { ".git" },
})
vim.lsp.config("rust_analyzer", {})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            -- https://go.dev/gopls/editor/vim
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                ignoredError = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
})

local vue_language_server_path = vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = { "vue" },
    configNamespace = "typescript",
}
vim.lsp.config("vtsls", {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

vim.lsp.config("asm", {
    cmd = { "asm-lsp" },
    -- Filetypes to automatically attach to.
    filetypes = { "asm" },
})
vim.lsp.enable("asm")

-- Create keybindings, commands, inlay hints and autocommands on LSP attach {{{
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local fzf = require("fzf-lua")

        local bufnr = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end
        ---@diagnostic disable-next-line need-check-nil
        if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
            -- vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
        end
        ---@diagnostic disable-next-line need-check-nil
        if client.server_capabilities.definitionProvider then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end

        -- -- nightly has inbuilt completions, this can replace all completion plugins
        -- if client:supports_method("textDocument/completion", bufnr) then
        --   -- Enable auto-completion
        --   vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
        -- end

        --- Disable semantic tokens
        ---@diagnostic disable-next-line need-check-nil
        client.server_capabilities.semanticTokensProvider = nil

        -- All the keymaps
        -- stylua: ignore start
        local keymap = vim.keymap.set
        local lsp = vim.lsp
        local opts = { silent = true }
        local function opt(desc, others)
            return vim.tbl_extend("force", opts, { desc = desc }, others or {})
        end
        keymap("n", "<C-k>", lsp.buf.signature_help, opts)
        -- disable the default binding first before using a custom one
        pcall(vim.keymap.del, "n", "K", { buffer = ev.buf })
        keymap("n", "K", function() lsp.buf.hover({ border = "single", max_height = 30, max_width = 120 }) end,
            opt("Toggle hover"))
        keymap("n", "<Leader>lF", vim.cmd.FormatToggle, opt("Toggle AutoFormat"))
        keymap("n", "<Leader>lI", vim.cmd.Mason, opt("Mason"))
        keymap("n", "<Leader>lh", function() lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({})) end,
            opt("Toggle Inlayhints"))
        keymap("n", "<Leader>li", vim.cmd.LspInfo, opt("LspInfo"))
        keymap("n", "<Leader>ll", lsp.codelens.run, opt("Run CodeLens"))
        keymap("n", "<Leader>lr", lsp.buf.rename, opt("Rename"))

        keymap("n", "<Leader>la", fzf.lsp_code_actions, opt("Code Action"))
        keymap("n", "gl", fzf.lsp_document_symbols, opt("Open diagnostic"))
        keymap("n", "gi", fzf.lsp_implementations, opt("Go to implementation"))
        keymap("n", "gd", fzf.lsp_definitions, opt("Go to definition"))
        keymap("n", "gr", fzf.lsp_references, opt("Show References"))
        keymap("n", "<Leader>lS", fzf.lsp_workspace_symbols, opt("Workspace Symbols"))
        keymap("n", "<Leader>ls", fzf.lsp_document_symbols, opt("Document Symbols"))
        keymap({'n', 'i', 'v'}, "<C-f>", fzf.complete_path, opt("Complte Path"))

        -- diagnostic mappings
        keymap("n", "<Leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, opt("Next Diagnostic"))
        keymap("n", "<Leader>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end,
            opt("Prev Diagnostic"))
        keymap("n", "<Leader>dq", vim.diagnostic.setloclist, opt("Set LocList"))
        keymap("n", "<Leader>dv", function()
            vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
        end, opt("Toggle diagnostic virtual_lines"))
        -- stylua: ignore end
    end,
})
-- }}}
--
