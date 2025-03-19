local js_based_languages = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vue",
}

return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local dap_ext_vscode = require("dap.ext.vscode")
		local dap_virtual_text = require("nvim-dap-virtual-text")

		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debugger continue" })

		-- # Sign
		vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "🟧", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = "🟩", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "🈁", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "⬜", texthl = "", linehl = "", numhl = "" })

		-- # DAP Virtual Text
		dap_virtual_text.setup({
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			show_stop_reason = true,
			commented = false,
			only_first_definition = true,
			all_references = false,
			filter_references_pattern = "<module",
			virt_text_pos = "eol",
			all_frames = false,
			virt_lines = false,
			virt_text_win_col = nil,
		})

		-- ## DAP `launch.json`
		dap_ext_vscode.load_launchjs(nil, {
			["python"] = {
				"python",
			},
			["pwa-node"] = {
				"javascript",
				"typescript",
			},
			["node"] = {
				"javascript",
				"typescript",
			},
			["cppdbg"] = {
				"c",
				"cpp",
			},
			["dlv"] = {
				"go",
			},
		})

		--- Gets a path to a package in the Mason registry.
		--- Prefer this to `get_package`, since the package might not always be
		--- available yet and trigger errors.
		---@param pkg string
		---@param path? string
		local function get_pkg_path(pkg, path)
			pcall(require, "mason")
			local root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
			path = path or ""
			local ret = root .. "/packages/" .. pkg .. "/" .. path
			return ret
		end

		require("dap").adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
					"${port}",
				},
			},
		}

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				-- Debug single nodejs files
				{
					type = "pwa-node",
					name = "Launch file",
					request = "launch",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				-- Debug nodejs processes (make sure to add --inspect when you run the process)
				{
					type = "pwa-node",
					request = "attach",
					name = "Auto Attach",
					cwd = vim.fn.getcwd(),
					protocol = "inspector",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
				},
				-- Divider for the launch.json derived configs
				{
					name = "----- ↓ launch.json configs ↓ -----",
					type = "",
					request = "launch",
				},
			}
		end
	end,
	dependencies = {
		{ "theHamsta/nvim-dap-virtual-text" },
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
			config = function()
				local dap = require("dap")
				local dapui = require("dapui")

				vim.keymap.set("n", "<Leader>dt", dapui.toggle, { desc = "Toggle debugger UI" })
				vim.keymap.set("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>", {
					noremap = true,
					desc = "Toggle debugger UI",
				})

				-- # DAP UI
				dapui.setup({
					icons = { expanded = "▾", collapsed = "▸" },
					expand_lines = vim.fn.has("nvim-0.7"),
					layouts = {
						{
							elements = {
								-- Elements can be strings or table with id and size keys.
								{ id = "scopes", size = 0.25 },
								"breakpoints",
								"stacks",
								"watches",
							},
							size = 40,
							position = "right",
						},
						{
							elements = {
								{ id = "repl", size = 0.5 },
								{ id = "console", size = 0.5 },
							},
							size = 10,
							position = "bottom",
						},
					},
					floating = {
						max_height = nil, -- These can be integers or a float between 0 and 1.
						max_width = nil, -- Floats will be treated as percentage of your screen.
						border = "rounded", -- Border style. Can be "single", "double" or "rounded"
						mappings = {
							close = { "q", "<Esc>" },
						},
					},
					windows = { indent = 1 },
					render = {
						max_type_length = nil,
					},
				})

				dap.listeners.after.event_initialized["dapui_config"] = function()
					vim.cmd("tabfirst|tabnext")
					dapui.open()
				end

				dap.listeners.before.attach.dapui_config = function()
					dapui.open()
				end
				dap.listeners.before.launch.dapui_config = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated.dapui_config = function()
					dapui.close()
				end
				dap.listeners.before.event_exited.dapui_config = function()
					dapui.close()
				end
			end,
		},
	},
}
