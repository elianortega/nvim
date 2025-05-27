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
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
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
	{
		"MTDL9/vim-log-highlighting",
	},
	{
		"m00qek/baleia.nvim",
		version = "*",
		config = function()
			vim.g.baleia = require("baleia").setup({})

			-- Command to colorize the current buffer
			vim.api.nvim_create_user_command("ColorLogs", function()
				vim.g.baleia.once(vim.api.nvim_get_current_buf())
			end, { bang = true })

			-- Command to show logs
			vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })
		end,
	},
}
