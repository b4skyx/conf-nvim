" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝

let mapleader =" "
let maplocalleader = ";"

" VimWiki Config
let g:vimwiki_list = [{'path': '~/Workspace/VimWiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_auto_header = 0
let g:vimwiki_diary_caption_level = -1

lua << EOF
require("init")
EOF
