return {
  "christoomey/vim-tmux-navigator",
  vim.keymap.set('n', '<C-w>h', ':TmuxNavigateLeft<CR>'),
  vim.keymap.set('n', '<C-w>j', ':TmuxNavigateDown<CR>'),
  vim.keymap.set('n', '<C-w>k', ':TmuxNavigateUp<CR>'),
  vim.keymap.set('n', '<C-w>l', ':TmuxNavigateRight<CR>'),
}
