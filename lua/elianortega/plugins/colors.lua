function ColorMyPencils(color)
	-- color = color or "tokyonight"
	-- color = color or "rose-pine-moon"
	-- color = color or "catppuccin"
	color = color or "vscode"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"Mofiqul/vscode.nvim",
		priority = 1000,
		config = function()
			local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				-- Enable transparent background
				transparent = false,

				-- Enable italic comment
				italic_comments = true,

				-- Underline `@markup.link.*` variants
				underline_links = true,

				-- Disable nvim-tree background color
				disable_nvimtree_bg = true,

				-- Override colors (see ./lua/vscode/colors.lua)
				color_overrides = {
					-- vscLineNumber = "#FFFFFF",
				},

				group_overrides = {
					Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
				},
			})
			ColorMyPencils()
			require("vscode").load()
		end,
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
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local transparent = true -- set to true if you would like to enable transparency
	--
	-- 		local bg = "#011628"
	-- 		local bg_dark = "#011423"
	-- 		local bg_highlight = "#143652"
	-- 		local bg_search = "#0A64AC"
	-- 		local bg_visual = "#275378"
	-- 		local fg = "#CBE0F0"
	-- 		local fg_dark = "#B4D0E9"
	-- 		local fg_gutter = "#627E97"
	-- 		local border = "#547998"
	--
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			transparent = transparent,
	-- 			styles = {
	-- 				sidebars = transparent and "transparent" or "dark",
	-- 				floats = transparent and "transparent" or "dark",
	-- 			},
	-- 			on_colors = function(colors)
	-- 				colors.bg = bg
	-- 				colors.bg_dark = transparent and colors.none or bg_dark
	-- 				colors.bg_float = transparent and colors.none or bg_dark
	-- 				colors.bg_highlight = bg_highlight
	-- 				colors.bg_popup = bg_dark
	-- 				colors.bg_search = bg_search
	-- 				colors.bg_sidebar = transparent and colors.none or bg_dark
	-- 				colors.bg_statusline = transparent and colors.none or bg_dark
	-- 				colors.bg_visual = bg_visual
	-- 				colors.border = border
	-- 				colors.fg = fg
	-- 				colors.fg_dark = fg_dark
	-- 				colors.fg_float = fg
	-- 				colors.fg_gutter = fg_gutter
	-- 				colors.fg_sidebar = fg_dark
	-- 			end,
	-- 		})
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
