" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝

" https://github.com/b4skyx/neovim-config

let mapleader =" "
let maplocalleader = "\\"


" Vim-Plug init
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading b4skyx/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/b4skyx/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" Vim-Plug Plugins

call plug#begin('~/.config/nvim/plugged')
Plug 'b4skyx/serenade'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'thepogsupreme/mountain.nvim'

Plug 'nvim-lua/plenary.nvim'

Plug 'junegunn/fzf.vim', {'on': '#VimEnter'}

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-tree.lua', {'on': 'NvimTreeToggle'}
Plug 'liuchengxu/vista.vim', {'on': 'Vista'}
Plug 'mbbill/undotree' , {'on': 'UndotreeToggle'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}

Plug 'phaazon/hop.nvim'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'b3nj5m1n/kommentary'

Plug 'lewis6991/gitsigns.nvim'
Plug 'vimwiki/vimwiki'

" Comment coc and uncomment the ones below if you'd like to use nvim lsp
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall', 'on': '#CursorHold'}

" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'onsails/lspkind-nvim'
" Plug 'windwp/nvim-autopairs', {'on': '#CursorHold'}

Plug 'sheerun/vim-polyglot', {'on': []}
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

" Sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" VimWiki Config
let g:vimwiki_list = [{'path': '/data/sync/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_auto_header = 0
let g:vimwiki_diary_caption_level = -1

" Make nvim load the lua directory
lua << EOF
require("init")
EOF
let g:seoul256_background = 234
