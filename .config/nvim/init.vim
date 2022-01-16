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

" Make the tabs bar always visible, even when only one tab is present
set showtabline=2

" Persistent undo even after you close a file and re-open it
set undofile

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://goo.gl/vHvyu8 for more info
set timeoutlen=1000

" Tabulation and indentation config
set tabstop=4		" Length of an actual \t character
set shiftwidth=4	" Length to use when shifting text (eg. <<, >> and == commands)
set softtabstop=0	" Length to use in insert mode (0 -> tabstop, -1 -> shiftwidth)
set autoindent		" Reproduce the previous line indentation
set smartindent		" Automatically increase/decrease indentation relative to { } blocks
set cindent			" A stricter smartindent which works better for the C language
set shiftround		" Round tabs to a multiple of shiftwidth
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType svg setlocal shiftwidth=2 tabstop=2

" Better autocompletion
set wildmenu
set wildmode=full
set wildignore=".git/*,.clangd/*,build/*"
set completeopt=menuone,noinsert,noselect

" Don't show extra message on completion
" set shortmess+=c

" Automatically write file on buffer closing
set autowrite

" Don't wrap line
set nowrap

" Don't redraw during macros and stuff
set lazyredraw

" Improve searching
set ignorecase smartcase

" Improve pane splitting rules
set splitright splitbelow

" Enable display of relative line numbering on the left column
set number relativenumber

" Improve scrolling
set scrolloff=10	" Show N more rows when scrolling up/down
set sidescrolloff=5	" Show N more columns when scrolling left/right

" Improve CursorHold responsiveness
set updatetime=300

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
" Replace all instances under the cursor
nnoremap s :%s/<C-R>=expand('<cword>')<CR>/<C-R>=expand('<cword>')<CR>/g<Left><Left>
nnoremap S :%s/\<<C-R>=expand('<cword>')<CR>\>/<C-R>=expand('<cword>')<CR>/g<Left><Left>
" Manually trigger completion
inoremap <silent><expr> <C-Space> completion#trigger_completion()
" Apply currently selected hint inside PopUpMenu (Enter)
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Open file-explorer
map <C-e> :w<CR>:Explore<CR>
" Tilde (F12)
imap <F12> ~
" Disable fast scroll using shift and arrows
nmap <S-Up> <Up>
vmap <S-Up> <Up>
nmap <S-Down> <Down>
vmap <S-Down> <Down>
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
" Cut entire line (Shift+Canc)
nmap <S-Del> <ESC>dd
imap <S-Del> <ESC>ddi
" Comment line out
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv<ESC>
" Normal and Visual mode tabbing/untabbing
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vmap <Tab> >
vmap <S-Tab> <
" Tabs cycling
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabNext<CR>
" Tab/untab without killing the selection in vmode
vmap > >gv
vmap < <gv
" Insert mode untabbing
inoremap <S-Tab> <C-d>
" Remove highlight when esc is pressed
nmap <silent><ESC> :noh<CR>
" Move row up and down
nmap <C-S-Up> :move -2<CR>
" vmap <C-S-Up> :move -2<CR> >gv
imap <C-S-Up> <ESC>:move -2<CR>i
nmap <C-S-Down> :move +1<CR>
" vmap <C-S-Down> dpV >gv
imap <C-S-Down> <ESC>:move +1<CR>i
" Language server protocol mappings
nnoremap <silent> H <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-F> <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gq    <cmd>lua vim.lsp.buf.formatting()<CR>
vnoremap <silent> gq    <cmd>lua vim.lsp.buf.formatting()<CR><ESC>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    :tab split<CR><cmd>lua vim.lsp.buf.definition()<CR>

" Alias Vex so that it always open the new pane on the right
cnoreabbrev Vex Vex!

" Show diagnostic on hover
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })
" Enable integrated highlight on yank
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("YankRegion", 1000)

"--- Netrw ---
let g:netrw_banner=0

"--- Completion neovim ---
" let g:completion_enable_support = 'UltiSnips'
let g:completion_chain_complete_list = {
\ 'default' : {
\   'default': [
\       {'complete_items': ['lsp', 'path', 'snippet']},
\       {'mode': '<c-p>'},
\       {'mode': '<c-n>'}]
\   }
\}

"--- NERDCommenter
let g:NERDSpaceDelims = 1

"--- Ultisnips ---
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips/']

"--- vim-markdown ---
let g:vim_markdown_folding_disabled = 1 " disable folding
let g:vim_markdown_conceal = 0 " do not use conceal feature, the implementation is not so good
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

