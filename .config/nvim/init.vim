" Highlight related settings
syntax on
colorscheme maze

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

" Better autocompletion
set wildmenu
set wildmode=full
set wildignore=".git/*,.clangd/*,build/*"
set completeopt=menuone,preview,noinsert

" Automatically write file on buffer closing
set autowrite

" Don't wrap line
set nowrap

" Don't redraw during macros and stuff
set lazyredraw

" Highlight current cursor line
" set cursorline

" Improve searching
set ignorecase smartcase

" Improve pane splitting rules
set splitright splitbelow

" Enable display of relative line numbering on the left column
set number relativenumber

" Improve scrolling
set scrolloff=10	" Show N more rows when scrolling up/down
set sidescrolloff=5	" Show N more columns when scrolling left/right

" Show matching parenthesis
set showmatch

" Highlight trailing whitespace
match TrailingWhitespace /\s\+$/

" Enable filetype related features
filetype on
filetype plugin on
filetype indent on

" Map common commands to shortcuts
" Quit
nmap <C-q> :q<CR>
imap <C-q> <ESC><C-q>
" Select all
nmap <C-a> gg V G
imap <C-a> <ESC><C-a>
" Save
nmap <C-s> :w<CR>
imap <C-s> <ESC><C-s>i
" Find
nmap <C-f> :noh<CR>:/
imap <C-f> <ESC><C-f>
" Replace all instances under the cursor
nnoremap S :%s/\<<C-R>=expand('<cword>')<CR>\>/<C-R>=expand('<cword>')<CR>/g<Left><Left>
" Show the nvim documentation of the item under the cursor
nmap H :execute 'h ' .expand('<cword>')<CR>
" Close PopUpMenu without going back to Normal mode
" inoremap <silent><expr> <ESC> pumvisible() ? "\<C-E>" : "\<ESC>"
" Apply currently selected hint inside PopUpMenu (Enter)
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Open file-explorer
map <C-e> :Explore<CR>
" Tilde (F12)
imap <F12> ~
" Shift plus simple arrow motion applies selection
imap <S-Left> <ESC>v<Left>
imap <S-Right> <ESC>v<Right>
imap <S-Up> <ESC>v<Up>
imap <S-Down> <ESC>v<Down>
" Map pane switching to more simple keys
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
" Cut entire line when in insert mode (Shift+Canc)
imap <S-Del> <ESC>ddi
" Normal and Visual mode tabbing/untabbing
"nnoremap <Tab> >>
"nnoremap <S-Tab> <<
vmap <Tab> >
vmap <S-Tab> <
" Tab/untab without killing the selection in vmode
vmap < <gv
vmap > >gv
" Insert mode untabbing
inoremap <S-Tab> <C-d>
" Remove highlight when esc is pressed
nmap <silent><ESC> :noh<CR>
" Language server protocol mappings
nmap gc  <cmd>lua vim.lsp.buf.declaration()<CR>
nmap gd  <cmd>lua vim.lsp.buf.definition()<CR>
nmap K     <cmd>lua vim.lsp.buf.hover()<CR>
nmap gim   <cmd>lua vim.lsp.buf.implementation()<CR>
"nmap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nmap 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap gr    <cmd>lua vim.lsp.buf.references()<CR>
nmap g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

autocmd FileType cpp set formatprg=clang-format-10
" Enable integrated highlight on yank
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("YankRegion", 1000)

let g:netrw_banner=0


"--- C++ enhanced syntax highlighting ---
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
