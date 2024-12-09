return {
	"nvim-flutter/flutter-tools.nvim",
	commit = "9955c98",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			fvm = true,
			dev_log = {
				enabled = true,
				open_cmd = "tabedit", -- command to use to open the log buffer
				focus_on_open = true,
			},
			debugger = {
				enabled = true,
				register_configurations = function(_)
					require("dap").configurations.dart = {}
					require("dap.ext.vscode").load_launchjs()
				end,
			},
		})

		require("dap").configurations.dart = {}
		require("dap.ext.vscode").load_launchjs()

		require("telescope").load_extension("flutter")
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>fc", "<cmd>Telescope flutter commands<cr>", { desc = "Show all flutter commands" })

		-- Wrap with Widget
		keymap.set("n", "<leader>ww", function()
			vim.lsp.buf.code_action({
				title = "Wrap with Widget",
				apply = true,
				context = {
					diagnostics = {},
					---@diagnostic disable-next-line: assign-type-mismatch
					only = { "refactor.flutter.wrap.generic" },
				},
			})
		end, { desc = "Wrap with Widget" })

		-- Remove Widget
		keymap.set("n", "<leader>wr", function()
			vim.lsp.buf.code_action({
				title = "Remove Widget",
				apply = true,
				context = {
					diagnostics = {},
					---@diagnostic disable-next-line: assign-type-mismatch
					only = { "refactor.flutter.removeWidget" },
				},
			})
		end, { desc = "Remove Widget" })

		-- Wrap with Row
		keymap.set("n", "<leader>wc", function()
			vim.lsp.buf.code_action({
				title = "Wrap with Row",
				apply = true,
				context = {
					diagnostics = {},
					---@diagnostic disable-next-line: assign-type-mismatch
					only = { "refactor.flutter.wrap.row" },
				},
			})
		end, { desc = "Wrap with Row" })

		-- Wrap with Builder
		keymap.set("n", "<leader>wb", function()
			vim.lsp.buf.code_action({
				title = "Wrap with Builder",
				apply = true,
				context = {
					diagnostics = {},
					---@diagnostic disable-next-line: assign-type-mismatch
					only = { "refactor.flutter.wrap.builder" },
				},
			})
		end, { desc = "Wrap with Builder" })

		-- Wrap with Center
		keymap.set("n", "<leader>wc", function()
			vim.lsp.buf.code_action({
				title = "Wrap with Center",
				apply = true,
				context = {
					diagnostics = {},
					---@diagnostic disable-next-line: assign-type-mismatch
					only = { "refactor.flutter.wrap.center" },
				},
			})
		end, { desc = "Wrap with Center" })
	end,
}
