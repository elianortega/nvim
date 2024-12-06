return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		vim.keymap.set("n", "<Leader>dui", dapui.toggle, { desc = "Toggle debugger UI" })

		dapui.setup({
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.5,
						},
						{
							id = "breakpoints",
							size = 0.25,
						},
						-- {
						-- 	id = "stacks",
						-- 	size = 0.25,
						-- },
						-- {
						-- 	id = "watches",
						-- 	size = 0.25,
						-- },
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 10,
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
}
