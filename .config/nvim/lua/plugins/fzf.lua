return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	opts = {
		files = {},
		defaults = {
			-- You can set default options for rg here
			-- For example, to ignore .gitignored files by default
			follow = true,
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>FzfLua global<cr>", desc = "Files, Buffers, etc." },
		{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
		{ "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Neovim Commands" },
		{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Neovim Commands" },
		{ "<leader>fi", "<cmd>FzfLua builtin<cr>", desc = "All Builtins" },
	},
}
