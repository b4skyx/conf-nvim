" Augroup to handle autocmds when reloading :source %
augroup RELOAD
	" Remove all autocmds
	autocmd!

	" Don't show linenumber on term
	autocmd TermOpen * setlocal norelativenumber nonumber
	autocmd FocusGained * checktime

	autocmd BufEnter term://* setlocal nonumber
	" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e
	" Coc autocmd
" 	autocmd CursorHold * silent call CocActionAsync('highlight')
" 	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" 	autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
augroup END

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
au VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
