return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				max_lines = 5,
			})
		end,
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate")
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@diagnostic disable-next-line: undefined-doc-name
		---@type Flash.Config
		opts = {
			jump = {
				autojump = true,
			},
			modes = {
				char = {
					jump_labels = true,
					multi_line = false,
				},
			},
		},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n" },           function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			routes = {
				{
					filter = { event = "notify", find = "no information available" },
					opts = { skip = true },
				},
			},
			presets = {
				lsp_doc_border = true,
			},
		},
		dependencies = {
			"muniftanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"eandrju/cellular-automaton.nvim",
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				direction = "float",
				open_mapping = [[<c-\>]],
				float_opts = {
					width = function()
						return math.floor(vim.o.columns * 0.7)
					end,
					height = function()
						return math.floor(vim.o.lines * 0.7)
					end,
				},
			})
		end,
	},
}
