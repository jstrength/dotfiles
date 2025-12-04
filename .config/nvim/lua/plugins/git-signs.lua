return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    keys = {
        { "<leader>gb", "<cmd>Gitsigns blame<cr>",                                               desc = "Blame" },
        { "<leader>gd", "<cmd>Gitsigns diffthis<cr>",                                            desc = "Diff file" },
        { "<leader>gl", "<cmd>Gitsigns blame_line<cr>",                                          desc = "Blame line" },
        { "<leader>gn", function() require('gitsigns').nav_hunk('next', { preview = true }) end, desc = "Next hunk" },
        { "<leader>gN", function() require('gitsigns').nav_hunk('prev', { preview = true }) end, desc = "Previous hunk" },
        { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                                          desc = "Reset hunk" },
        { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",                                          desc = "Stage hunk" },
        { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>",                                     desc = "Undo stage hunk" },
    }
}
