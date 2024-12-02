return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			debugger = {
				enabled = true,
				register_configurations = function(_)
					require("dap").configurations.dart = {}
					require("dap.ext.vscode").load_launchjs()
				end,
			},
		})
		require("telescope").load_extension("flutter")
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>fc", "<cmd>Telescope flutter commands<cr>", { desc = "Show all flutter commands" })
	end,
}
