vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2        -- A tab character visually equals 2 spaces
vim.opt.softtabstop = 2    -- In insert mode, a tab keypress equals 2 spaces
vim.opt.shiftwidth = 2     -- Indentation level for auto-indenting
vim.opt.expandtab = true   -- Convert tabs to spaces

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"


