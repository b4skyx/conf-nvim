---@diagnostic disable: undefined-global, unused-local
-- GLOBAL KEYMAPPINGS

-- Alias
keymap=vim.api.nvim_set_keymap

-- Clipboard remaps

vim.cmd([[
	vnoremap  <leader>y  "+y
	nnoremap  <leader>Y  "+yg_
	nnoremap  <leader>y  "+y
	nnoremap  <leader>yy  "+yy
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P
]])

-- Easy Navigation
vim.cmd([[
  map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

	map <C-Up> <C-w><Up>
	map <C-Down> <C-w><Down>
  map <C-Left> <C-w><Left>
	map <C-Right> <C-w><Right>

	nnoremap c "_c
]])

-- resizing with arrows
vim.cmd([[
  nnoremap <silent> <C-S-Up>    :resize -2<CR>
  nnoremap <silent> <C-S-Down>  :resize +2<CR>
  nnoremap <silent> <C-S-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-S-Right> :vertical resize +2<CR>
]])

-- Buffer delete
keymap('n', '<leader>x', ':bdelete!<CR>', {noremap=true, silent=true})

-- Toggle search highlighting
keymap('n', '<leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- Alias Replace all to S
keymap('', 'S', ':%s//g<Left><Left>', {noremap = true, silent = false})

-- Keep selection after shifting characters
keymap('v', '<', '<gv', {noremap=true, silent=true})
keymap('v', '>', '>gv', {noremap=true, silent=true})

-- Spell-check set to <leader>o, 'o' for 'orthography':
keymap('', '<leader>o',  ':setlocal spell! spelllang=en_us<CR>', {noremap=false, silent=false})

-- UndoTree toggle
keymap('', '<F5>', ':UndotreeToggle<CR>', {noremap=true, silent=true})
