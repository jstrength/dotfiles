return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {"leoluz/nvim-dap-go", opts = {}},
        {"rcarriga/nvim-dap-ui", opts = {}, dependencies = "nvim-neotest/nvim-nio" },
        "williamboman/mason.nvim",
    },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")

        vim.keymap.set("n", "<space>eb", dap.toggle_breakpoint, { desc = "toggle_breakpoint" })
        vim.keymap.set("n", "<space>eg", dap.run_to_cursor, { desc = "run_to_cursor" })

        vim.keymap.set("n", "<space>e?", function()
            ui.eval(nil, { enter = true })
        end, {desc = "eval var under cursor"})

        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F6>", dap.step_out)
        vim.keymap.set("n", "<F7>", dap.step_back)
        vim.keymap.set("n", "<F8>", dap.terminate)
        vim.keymap.set("n", "<F9>", dap.step_into)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F12>", dap.restart)

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}
