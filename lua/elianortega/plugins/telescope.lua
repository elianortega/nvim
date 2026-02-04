return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim", -- live grep with args
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			local telescopeConfig = require("telescope.config")
			-- Clone the default Telescope configuration
			local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

			-- I want to search in hidden/dot files.
			table.insert(vimgrep_arguments, "--hidden")
			-- I don't want to search in the `.git` directory.
			table.insert(vimgrep_arguments, "--glob")
			table.insert(vimgrep_arguments, "!**/.git/*")

			telescope.setup({
				defaults = {
					vimgrep_arguments = vimgrep_arguments,
					path_display = { "smart" },
					mappings = {
						n = {
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --+ custom_actions.open_trouble_qflist,
						},
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --+ custom_actions.open_trouble_qflist,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-n>"] = actions.cycle_history_next,
						},
					},
				},
				pickers = {
					find_files = {
						-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					},
				},
			})

			-- set keymaps
			local keymap = vim.keymap -- for conciseness
			local builtin = require("telescope.builtin")

			keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Fuzzy find help tags" })
			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
			keymap.set(
				"n",
				"<leader>fgg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				{ desc = "Find string in cwd" }
			)
			keymap.set("n", "<leader>fgs", builtin.grep_string, { desc = "Find string under cursor in cwd" })
			keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find available commands" })
			keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find lsp document symbols" })

			keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

			keymap.set("n", "<C-p>", builtin.git_files, {})

			-- load extensions
			telescope.load_extension("fzy_native")
			telescope.load_extension("noice")
			telescope.load_extension("live_grep_args")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
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
