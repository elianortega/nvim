function ColorMyPencils(color)
	color = color or "tokyonight"
	-- color = color or "rose-pine-moon"
	-- color = color or "catppuccin"
	-- color = color or "vscode"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	-- {
	-- 	"Mofiqul/vscode.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local c = require("vscode.colors").get_colors()
	-- 		require("vscode").setup({
	-- 			-- Enable transparent background
	-- 			transparent = false,
	--
	-- 			-- Enable italic comment
	-- 			italic_comments = true,
	--
	-- 			-- Underline `@markup.link.*` variants
	-- 			underline_links = true,
	--
	-- 			-- Disable nvim-tree background color
	-- 			disable_nvimtree_bg = true,
	--
	-- 			-- Override colors (see ./lua/vscode/colors.lua)
	-- 			color_overrides = {
	-- 				-- vscLineNumber = "#FFFFFF",
	-- 			},
	--
	-- 			group_overrides = {
	-- 				Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
	-- 			},
	-- 		})
	-- 		ColorMyPencils()
	-- 		require("vscode").load()
	-- 	end,
	-- },
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			ColorMyPencils()
		end,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local transparent = true -- set to true if you would like to enable transparency
	-- 		require("catppuccin").setup({
	-- 			transparent_background = transparent,
	-- 			term_colors = true,
	-- 			dim_inactive = {
	-- 				enabled = true,
	-- 				percentage = 0.1,
	-- 			},
	-- 		})
	-- 		ColorMyPencils()
	-- 	end,
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	priority = 1000,
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			disable_background = true,
	-- 			styles = {
	-- 				italic = false,
	-- 			},
	-- 		})
	--
	-- 		ColorMyPencils()
	-- 	end,
	-- },
}
