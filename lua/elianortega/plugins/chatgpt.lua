return {
	"jackMort/ChatGPT.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim", -- optional
		"nvim-telescope/telescope.nvim",
	},
	cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTRun", "ChatGPTEditWithInstructions" },
	config = function()
		require("chatgpt").setup({
			api_key_cmd = "op read op://Private/chatgpt.nvim/password",
		})
	end,
}
