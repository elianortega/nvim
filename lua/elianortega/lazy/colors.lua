function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	-- {
	--   "erikbackman/brightburn.vim",
	-- },
	-- {
	--   "folke/tokyonight.nvim",
	--   lazy = false,
	--   opts = {},
	--   config = function()
	--     ColorMyPencils()
	--   end,
	-- },
	-- {
	--   "ellisonleao/gruvbox.nvim",
	--   name = "gruvbox",
	--   config = function()
	--     require("gruvbox").setup({
	--       terminal_colors = true, -- add neovim terminal colors
	--       undercurl = true,
	--       underline = false,
	--       bold = true,
	--       italic = {
	--         strings = false,
	--         emphasis = false,
	--         comments = false,
	--         operators = false,
	--         folds = false,
	--       },
	--       strikethrough = true,
	--       invert_selection = false,
	--       invert_signs = false,
	--       invert_tabline = false,
	--       invert_intend_guides = false,
	--       inverse = true, -- invert background for search, diffs, statuslines and errors
	--       contrast = "", -- can be "hard", "soft" or empty string
	--       palette_overrides = {},
	--       overrides = {},
	--       dim_inactive = false,
	--       transparent_mode = false,
	--     })
	--   end,
	-- },
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			local transparent = true -- set to true if you would like to enable transparency

			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				transparent = transparent,
				styles = {
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = transparent and colors.none or bg_dark
					colors.bg_float = transparent and colors.none or bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = transparent and colors.none or bg_dark
					colors.bg_statusline = transparent and colors.none or bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})

			vim.cmd("colorscheme tokyonight")
		end,
	},
	-- {
	--   "rose-pine/neovim",
	--   priority = 1000,
	--   name = "rose-pine",
	--   config = function()
	--     require("rose-pine").setup({
	--       disable_background = true,
	--       styles = {
	--         italic = false,
	--       },
	--     })
	--
	--     ColorMyPencils()
	--   end,
	-- },
}
