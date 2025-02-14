return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debugger continue" })

		-- Dart CLI adapter (recommended)
		-- dap.adapters.dart = {
		-- 	type = "executable",
		-- 	command = "dart", -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
		-- 	args = { "debug_adapter" },
		-- 	-- windows users will need to set 'detached' to false
		-- 	options = {
		-- 		detached = false,
		-- 	},
		-- }
		-- dap.adapters.flutter = {
		-- 	type = "executable",
		-- 	command = "flutter", -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
		-- 	args = { "debug_adapter" },
		-- 	-- windows users will need to set 'detached' to false
		-- 	options = {
		-- 		detached = false,
		-- 	},
		-- }
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

				dapui.setup({
					floating = { border = "rounded" },
					layouts = {
						{
							elements = {
								{ id = "stacks", size = 0.30 },
								{ id = "breakpoints", size = 0.20 },
								{ id = "scopes", size = 0.50 },
							},
							position = "left",
							size = 10,
						},
						{
							elements = {
								{ id = "repl", size = 0.80 },
							},
							position = "bottom",
							size = 15,
						},
					},
				})

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
