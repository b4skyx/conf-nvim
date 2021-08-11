require'hop'.setup()
-- Quick Navigation
vim.api.nvim_set_keymap('n', 'gw', ":HopWord<cr>", {silent = true})
vim.api.nvim_set_keymap('n', 'gl', ":HopLine<cr>", {silent = true})
