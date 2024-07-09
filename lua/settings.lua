---@diagnostic disable

-- Alias
cmd = vim.api.nvim_command

-- Font
vim.o.guifont = "Comic Code:h14"

-- Behavior
vim.o.mouse = "a"
vim.o.encoding = "utf-8"
vim.o.timeoutlen = 500
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.foldmethod = "indent"
vim.o.foldcolumn = "1"
vim.o.conceallevel = 2
vim.o.autoindent = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.shortmess = (vim.o.shortmess or "") .. "c"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.list = true

-- Keep undo history even after file quit
cmd([[
	set noswapfile
	set nobackup
	set nowritebackup
	set undodir=~/.nvim/undodir
	set undofile
	set cursorline
]])

cmd("syntax on")
cmd("filetype plugin on")

-- Vim Interface

vim.o.termguicolors = true
vim.o.hidden = true
vim.o.ruler = true
vim.o.cursorline = true
vim.o.cmdheight = 1
vim.o.showmode = false
vim.o.hlsearch = false
vim.o.bg = "dark"
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.completeopt = "menuone,noselect"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.bo.softtabstop = 4

-- Command Completion

vim.o.wildmenu = true
vim.o.wildmode = "longest,full"

--- Clipboard
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"

-- Disable Default Vim Plugins
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_spec = 0
vim.g.loaded_syncolor = 0

-- Completion Settings
vim.opt.completeopt = { "menu", "menuone", "noselect" }
