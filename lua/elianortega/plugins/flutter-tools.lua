return {
	{
		"f-person/pubspec-assist-nvim",
	},
	{
		"akinsho/pubspec-assist.nvim",
		requires = "plenary.nvim",
		config = function()
			require("pubspec-assist").setup()
		end,
	},
	{
		"nvim-flutter/flutter-tools.nvim",
		commit = "9955c98",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			-- Get Flutter SDK path using 'which flutter' from fvm
			local executable = require("flutter-tools.executable")
			local path = require("plenary.path") -- Plenary's path helper

			-- Fetch the paths
			executable.get(function(paths)
				if not paths or not paths.flutter_sdk or not paths.dart_sdk then
					print("Error: Unable to determine Flutter or Dart SDK paths.")
					return
				end

				local flutter_sdk_path = paths.flutter_sdk

				print(flutter_sdk_path)
				-- Add custom paths to be excluded from analysis
				local excluded_folders = {
					vim.fn.expand("~/.pub-cache"), -- Default pub-cache
					path:new(flutter_sdk_path, "packages"):absolute(), -- Flutter packages directory
					path:new(flutter_sdk_path, ".pub-cache"):absolute(), -- Flutter .pub-cache
				}

				print(excluded_folders)

				local flutter_tools = require("flutter-tools")
				flutter_tools.setup({
					fvm = true,
					lsp = {
						color = {
							enabled = true,
							background = false,
							background_color = { r = 19, g = 17, b = 24 },
							foreground = false,
							virtual_text = true,
							virtual_text_str = "■",
						},
						settings = {
							analysisExcludedFolders = excluded_folders,
						},
					},
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
			end)

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
					title = "Wrap with Column",
					apply = true,
					context = {
						diagnostics = {},
						---@diagnostic disable-next-line: assign-type-mismatch
						only = { "refactor.flutter.wrap.column" },
					},
				})
			end, { desc = "Wrap with Center" })
		end,
	},
}
