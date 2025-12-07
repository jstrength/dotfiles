return {
    "jstrength/sessions.nvim",
    dev = false,
    opts = {},
    lazy = false,
    keys = {
        {
            "<leader>sl",
            function()
                require("sessions").load_session()
            end,
            desc = "Load session",
        },
        {
            "<leader>ss",
            function()
                require("sessions").save_session()
            end,
            desc = "Save session",
        },
    },
}
