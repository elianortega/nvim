local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local opt = vim.opt

-- remap leader key
keymap.set("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


opt.relativenumber = true
opt.nu = true

-- tabs & indentation
opt.tabstop = 2 -- A tab character visually equals 2 spaces
opt.shiftwidth = 2 -- Indentation level for auto-indenting
opt.softtabstop = 2 -- In insert mode, a tab keypress equals 2 spaces
opt.expandtab = true -- Convert tabs to spaces
opt.autoindent = true -- Copy indent from current line when starting a newone
opt.smartindent = true

opt.wrap = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- Autocmds 
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})


-- Explorer 
keymap.set("n", "<leader>ff", vim.cmd.Ex)

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half up" })

keymap.set("n", "J", "mzJ`z", { desc = "Join lines and restore cursor position" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result, center, and unfold" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result, center, and unfold" })


keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })
keymap.set("n", "Y", "yy", { desc = "Yank entire line" })

keymap.set({ "v" }, "<leader>d", '"_d', { desc = "Delete without saving to clipboard" })


keymap.set({"n", "v"}, [[<c-\>]], "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>", { desc = "Toggle terminal" })
keymap.set({"n"} , "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>", { desc = "Toggle terminal" })
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
keymap.set("n", "<leader>db", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>", { desc = "Toggle breakpoint" })