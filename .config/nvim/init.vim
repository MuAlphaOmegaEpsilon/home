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

" Automatically open CocExplorer
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | CocCommand explorer | endif

set wildmenu

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
" Replace all instances under the cursor (S)
nnoremap S :%s/\<<C-R>=expand('<cword>')<CR>\>//g<Left><Left>
" Show documentation in preview window (K)
nmap <silent> K :call <SID>show_documentation()<CR>
" Trigger completion <CTRL+Space>
imap <silent><expr> <C-space> coc#refresh()
" Close PopUpMenu without going back to Normal mode
inoremap <silent><expr> <ESC> pumvisible() ? "\<C-E>" : "\<ESC>"
" Apply currently selected hint inside PopUpMenu (Enter)
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Open file-explorer (CTRL+e)
map <C-e> :CocCommand explorer --toggle<CR>
" Tilde (F12)
imap <F12> ~
" Shift plus simple motion applies selection
imap <S-Left> <ESC>v<Left>
imap <S-Right> <ESC>v<Right>
imap <S-Up> <ESC>v<Up>
imap <S-Down> <ESC>v<Down>
" Map pane switching to more simple keys
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
" Copy selection when in Visual mode (CTRL+c)
vmap <C-c> y<ESC>
" Cut selection when in Visual mode (CTRL+x)
vmap <C-x> d<ESC>
" Cut entire line when in insert mode (Shift+Canc)
imap <S-Del> <ESC>ddi
"Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Normal and Visual mode tabbing/untabbing
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >>
vnoremap <S-Tab> <<
" Insert mode untabbing
inoremap <S-Tab> <C-d>

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
" set shortmess+=c

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  endif
endfunction

" A few settings currently disabled
" set hidden	" Coc recommends the usage of hidden

