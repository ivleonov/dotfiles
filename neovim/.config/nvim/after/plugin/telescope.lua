-- Currently is disabled in favor of fzf.vim
vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope git_files<CR>", {})
-- vim.api.nvim_set_keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", {})
-- Search for word under cursor in current dir using exact match
-- vim.api.nvim_set_keymap("n", "<leader>*", ":Telescope grep_string word_match=-w search=<C-R><C-W><CR>", {})
-- vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope git_files<CR>", {})
