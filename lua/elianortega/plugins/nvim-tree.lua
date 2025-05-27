return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
					natural_order = true,
					is_always_hidden = function(name, _)
						return name == ".." or name == ".git"
					end,
				},
				float = {
					padding = 2,
					max_width = 90,
					max_height = 0,
				},
				win_options = {
					wrap = true,
					winblend = 0,
				},
				keymaps = {
					["<C-c>"] = false,
					["q"] = "actions.close",
				},
			})

			local keymap = vim.keymap
			keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local nvimtree = require("nvim-tree")
			local api = require("nvim-tree.api")

			-- recommended settings from nvim-tree documentation
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- custom on_attach with lefty/righty behavior
			local custom_on_attach = function(bufnr)
				local opts = { buffer = bufnr }

				api.config.mappings.default_on_attach(bufnr)

				local lefty = function()
					local node = api.tree.get_node_under_cursor()
					if node.nodes and node.open then
						api.node.open.edit()
					else
						api.node.navigate.parent()
					end
				end

				local righty = function()
					local node = api.tree.get_node_under_cursor()
					if node.nodes and not node.open then
						api.node.open.edit()
					end
				end

				vim.keymap.set("n", "h", lefty, opts)
				vim.keymap.set("n", "<Left>", lefty, opts)
				vim.keymap.set("n", "l", righty, opts)
				vim.keymap.set("n", "<Right>", righty, opts)
			end

			nvimtree.setup({
				on_attach = custom_on_attach,
				view = {
					side = "right",
					width = 48,
					relativenumber = true,
				},
				update_focused_file = {
					enable = true,
				},
				renderer = {
					indent_markers = {
						enable = true,
					},
					icons = {
						glyphs = {
							folder = {
								arrow_closed = "",
								arrow_open = "",
							},
						},
					},
				},
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
				filters = {
					custom = { ".DS_Store" },
				},
				git = {
					ignore = false,
				},
			})

			local keymap = vim.keymap
			keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
			keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Focus file in explorer" })
			keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
			keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
		end,
	},
}
