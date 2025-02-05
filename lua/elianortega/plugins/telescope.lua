return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist, --+ custom_actions.open_trouble_qflist,
						},
					},
				},
			})

			-- set keymaps
			local keymap = vim.keymap -- for conciseness
			local builtin = require("telescope.builtin")

			keymap.set("n", "<leader>ff", builtin.buffers, { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>fgg", builtin.live_grep, { desc = "Find string in cwd" })
			keymap.set("n", "<leader>fgs", builtin.grep_string, { desc = "Find string under cursor in cwd" })
			keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find available commands" })
			keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find lsp document symbols" })

			keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

			keymap.set("n", "<C-p>", builtin.git_files, {})

			-- load extensions
			telescope.load_extension("fzy_native")
			telescope.load_extension("noice")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		require = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
