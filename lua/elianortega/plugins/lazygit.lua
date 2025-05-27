return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
		},
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end,
		keys = {
			{ "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
			{ "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
			{ "<leader>dvf", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
		},
	},
}
