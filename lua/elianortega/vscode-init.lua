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

require("elianortega.vscode-lazy")
