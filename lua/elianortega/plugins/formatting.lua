return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		-- Ensure .arb files are treated as JSON
		vim.filetype.add({
			extension = {
				arb = "json",
			},
		})

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			-- formatters = {
			-- 	prettier = {
			-- 		command = "prettier",
			-- 		args = function(params)
			-- 			-- Add custom arguments for .arb files
			-- 			return {}
			-- 			-- if vim.fn.expand("%:e") == "arb" then
			-- 			-- 	return { "--parser", "json" }
			-- 			-- end
			-- 			-- Default arguments for other file types
			-- 		end,
			-- 		stdin = true,
			-- 	},
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
