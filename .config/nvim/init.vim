" Disable TrueColor support, since the colorscheme is meant for 16 colors only
set notermguicolors

" Highlight related settings
syntax on
colorscheme maze

" Highlight matches when searching
set hlsearch

set fileformat=unix

" Enable system clipboard interoperability
set clipboard=unnamedplus

" Prevent neovim from polluting the filesystem with unwanted extra files
set nobackup nowritebackup noswapfile

" Never allow folding, it sucks
set nofoldenable
set packpath=~/.local/share/nvim/site

" Automatically change current working dir on new file opening
set autochdir

" Disable mouse usage
set mouse=

" Show whitespace characters
set list

" 8 colors terminal, bash based
set t_Co=8

let g:netrw_banner=0 " Pressing I will toggle the banner
let g:netrw_sort_by="name"
let g:netrw_sort_sequence="[\\/]$"
let g:netrw_wiw=1

if has("win64")
	set shell=C:/msys64/usr/bin/bash
	set shellcmdflag='-c'
	set shellquote=\"
	set shellslash
endif

" Make the tabs bar always visible, even when only one tab is present
set showtabline=2

set laststatus=3
set showcmdloc=statusline

" set noshowmode
set cmdheight=0

" Persistent undo even after you close a file and re-open it
set undofile

" Wrap at word boundaries when wrapmode is enabled
set linebreak

" Quality of life when navigating using arrows and deleting with backspace:
" this allows neovim to go to the previous/next line when going beyond line
" boundaries
set whichwrap+=<,>,[,]
set backspace=indent,eol,start

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://goo.gl/vHvyu8 for more info
set timeoutlen=1000

set statusline=%#Moden#%{mode()=='n'?'\ \ NORMAL\ ':''}
set statusline+=%#Modei#%{mode()=='i'?'\ \ INSERT\ ':''}
set statusline+=%#Modev#%{mode()=='v'?'\ \ VISUAL\ ':''}
set statusline+=%#Modev#%{mode()=='\<C-V>'?'\ \ VBLOCK\ ':''}
set statusline+=%#Modes#%{mode()=='s'?'\ \ S-CHAR\ ':''}
set statusline+=%#Modes#%{mode()=='S'?'\ \ S-LINE\ ':''}
set statusline+=%#ModeR#%{mode()=='R'?'\ \ REPLACE\ ':''}
set statusline+=%{mode()=='Rv'?'\ \ VREPLACE\ ':''}
set statusline+=%#Normal#\ %f%m\ %{&filetype}\ %{&fenc}\ %{&ff}%=Ln\ %l/%L\(%p%%)\ Col\ %v

" Tabulation and indentation config
set tabstop=4     " Length of an actual \t character
set shiftwidth=4  " Length to use when shifting text (eg. <<, >> and == commands)
set softtabstop=0 " Length to use in insert mode (0 -> tabstop, -1 -> shiftwidth)
set autoindent    " Reproduce the previous line indentation
set smartindent   " Automatically increase/decrease indentation relative to { } blocks
set cindent       " A stricter smartindent which works better for the C language
set shiftround    " Round tabs to a multiple of shiftwidth

" Enable filetype related features
filetype on
filetype plugin on
filetype indent on

" Filetype based configuration
 autocmd FileType text setlocal wrap
 autocmd FileType markdown setlocal wrap
 autocmd FileType html setlocal shiftwidth=2 tabstop=2
 autocmd FileType css setlocal shiftwidth=2 tabstop=2
 autocmd FileType svg setlocal shiftwidth=2 tabstop=2
 autocmd FileType,BufNewFile,BufRead openscad setlocal formatprg=clang-format
 autocmd FileType,BufNewFile,BufRead openscad :call system('openscad ' . expand('%:p') . ' &')
 autocmd BufWinLeave openscad :call system('killall openscad')
" Fix issue with statusline disappearing on certain mode changes
 autocmd ModeChanged * lua vim.schedule(function() vim.cmd('redraw') end)

" Better autocompletion
set wildmenu
set wildmode=full
set wildignore=".git/*,.clangd/*,.cache/*,build/*"
set completeopt=menuone,noinsert,noselect

" Don't show extra message on completion
" set shortmess+=c

" Automatically write file on buffer closing
set autowrite

" Don't wrap lines automatically
set nowrap

" Disable left bar containing LSP messages
set signcolumn=no

" Don't redraw during macros and stuff
set lazyredraw

" Improve searching
set ignorecase smartcase

" Improve pane splitting rules
set splitright splitbelow

" Improve scrolling
set scrolloff=10    " Show N more rows when scrolling up/down
set sidescrolloff=5 " Show N more columns when scrolling left/right

" Improve CursorHold responsiveness
 set updatetime=300

" Highlight trailing whitespace
match TrailingWhitespace /\s\+$/

" Map common commands to shortcuts
" Quit
nmap <C-c> :q<CR>
imap <C-c> <ESC><C-c>
" Select all
nmap <C-a> gg V G
imap <C-a> <ESC><C-a>
" Save
nmap <C-s> :w<CR>
imap <C-s> <ESC><C-s>i
" Replace all instances under the cursor
nnoremap s :%s/<C-R>=expand('<cword>')<CR>/<C-R>=expand('<cword>')<CR>/g<Left><Left>
nnoremap S :%s/\<<C-R>=expand('<cword>')<CR>\>/<C-R>=expand('<cword>')<CR>/g<Left><Left>
" Open file-explorer
map <C-e> :tabnew<CR>:Explore<CR>
" Tilde (F12)
imap <F12> ~
" Move up and down visual (soft) lines instead of hard lines
" This is especially useful when wrapmode is enabled
noremap <silent> <Up> gk
inoremap <silent> <Up> <C-o>gk
noremap <silent> <Down> gj
inoremap <silent> <Down> <C-o>gj
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
nnoremap <silent> <C-h>   <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-d>   <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <C-S-f> <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gq    gggqG
" nnoremap <silent> gq    <cmd>lua vim.lsp.buf.format{async=true}<CR>
" vnoremap <silent> gq    <cmd>lua vim.lsp.buf.format{async=true}<CR><ESC>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nmap <silent> <C-LeftMouse> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    :tab split<CR><cmd>lua vim.lsp.buf.definition()<CR>

" Alias Vex so that it always open the new pane on the right
cnoreabbrev Vex Vex!

" Enable integrated highlight on yank
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("YankRegion", 1000)

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

"--- LUA SETUP ---
lua <<EOF
local lsp = require'lspconfig'
local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
    	['<C-f>'] = cmp.mapping.scroll_docs(4),
    	['<C-Space>'] = cmp.mapping.complete(),
    	['<C-e>'] = cmp.mapping.abort(),
    	['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	experimental = {
		ghost_text = true
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		-- { name = 'ultisnips' },
	}
})
lsp.clangd.setup { cmd = { 'clangd', '--background-index', '--function-arg-placeholders', '--header-insertion=never', '--clang-tidy' } }
lsp.cmake.setup {}
lsp.openscad_ls.setup {}

-- require'nvim-treesitter.configs'.setup {
	-- ensure_installed = "",
	-- sync_install = false,
	-- highlight = {
		-- enable = true,
		-- additional_vim_regex_highlighting = false,
	-- },
-- }

EOF
