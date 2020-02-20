" Highlight related settings
syntax on
colorscheme maze_colorscheme

" Highlight matches when searching
set hlsearch

" Prevent neovim from polluting the filesystem with unwanted extra files
set nobackup nowritebackup noswapfile

" Since lightline is in use, there's no need to show the mode twice
set noshowmode

" 8 colors terminal, bash based
set t_Co=8
set shell=/bin/bash

" Tabulation and indentation config
set tabstop=4		" Length of an actual \t character
set shiftwidth=4	" Length to use when shifting text (eg. <<, >> and == commands)
set softtabstop=0	" Length to use in insert mode (0 -> tabstop, -1 -> shiftwidth)
set autoindent		" Reproduce the previous line indentation
set smartindent		" Automatically increase/decrease indentation relative to { } blocks
set cindent			" A stricter smartindent which works better for the C language
set shiftround		" Round tabs to a multiple of shiftwidth

" Don't wrap line
set nowrap

" Improve searching
set ignorecase
set smartcase

" Improve pane splitting rules
set splitright splitbelow

" Enable display of relative line numbering on the left column
set number relativenumber

" Improve scrolling
set scrolloff=3		" Show N more rows when scrolling up/down
set sidescrolloff=5	" Show N more columns when scrolling left/right

" Highlight trailing whitespace
match TrailingWhitespace /\s\+$/

" Enable filetype related features
filetype on
filetype plugin on
filetype indent on

" Disable netrw
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

" Map common commands to shortcuts
" Quit (CTRL+q)
nmap <C-q> :q!<CR>
imap <C-q> <C-ESC><C-q>
" Save (CTRL+s)
nmap <C-s> :w<CR>
imap <C-s> <C-ESC><C-s>i
" Paste (CTRL+v)
nmap <C-v> gP
imap <C-v> <C-ESC><C-v>i
" Find (CTRL+f)
nmap <C-f> :noh<CR>:/
imap <C-f> <C-ESC><C-f>
" Map pane switching to more simple keys
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
