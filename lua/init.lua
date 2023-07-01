-- Load Defaults
require('settings')
require('keymappings')

-- vim.o.shell="C:/tools/cygwin/bin/fish.exe"
-- vim.o.shell = "C:/Users/T1181AY/AppData/Local/Programs/Git/bin"
vim.o.shellpipe="|"
vim.o.shellredir=">"
vim.o.shellcmdflag="-i -l -c"

if vim.g.neovide then
	vim.o.guifont = "Comic Code:h14"
	vim.g.neovide_refresh_rate = 120
	vim.g.neovide_scroll_animation_length = 0
end

-- Lazypath Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
