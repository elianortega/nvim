return {
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
}
