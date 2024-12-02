vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "Q", "<nop>", { desc = "Disable the Q letter" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half up" })

keymap.set("n", "J", "mzJ`z", { desc = "Join lines and restore cursor position" })

keymap.set("n", "n", "nzzzv", { desc = "Next search result, center, and unfold" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result, center, and unfold" })
keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP server" })

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace selection without overwriting clipboard" })

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })
keymap.set("n", "Y", "yy", { desc = "Yank entire line" })

keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without saving to clipboard" })

keymap.set("n", "Q", "<nop>", { desc = "Disable Q (no-op)" })
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item and center" })
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item and center" })
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item and center" })
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item and center" })

keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Search and replace word under cursor" }
)

-- keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

