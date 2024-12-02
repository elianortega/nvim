return {
	"mfussenegger/nvim-dap",
	dependencies = {},
	config = function()
		local dap = require("dap")
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debugger continue" })

		-- Dart CLI adapter (recommended)
		dap.adapters.dart = {
			type = "executable",
			command = "dart", -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
			args = { "debug_adapter" },
			-- windows users will need to set 'detached' to false
			options = {
				detached = false,
			},
		}
		dap.adapters.flutter = {
			type = "executable",
			command = "flutter", -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
			args = { "debug_adapter" },
			-- windows users will need to set 'detached' to false
			options = {
				detached = false,
			},
		}
	end,
}
