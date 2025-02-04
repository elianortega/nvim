vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

vim.opt.shell = "zsh"

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
opt.hlsearch = false
opt.incsearch = true

-- undo dir settings
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- appearance

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- other
opt.swapfile = false
opt.backup = false

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"
