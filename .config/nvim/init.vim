" Highlight related settings
syntax on
colorscheme maze

" Highlight matches when searching
set hlsearch

set fileformat=unix

" Prevent neovim from polluting the filesystem with unwanted extra files
set nobackup nowritebackup noswapfile

" Never allow folding, it sucks
set nofoldenable
set packpath=~/.local/share/nvim/site

" Since lightline is in use, there's no need to show the mode twice
set noshowmode

" Show whitespace characters
set list

" 8 colors terminal, bash based
set t_Co=8

if has("win64")
	set shell=C:/msys64/usr/bin/bash
	set shellcmdflag='-c'
	set shellquote=\"
	set shellslash
endif

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
set wildignore=".git/*,.clangd/*,.cache/*,build/*"
set completeopt=menuone,noinsert,noselect

" Don't show extra message on completion
" set shortmess+=c

" Automatically write file on buffer closing
set autowrite

" Don't wrap line
set nowrap

" Disable left bar containing LSP messages
set signcolumn=no

" Don't redraw during macros and stuff
set lazyredraw

" Improve searching
set ignorecase smartcase

" Improve pane splitting rules
set splitright splitbelow

" Enable display of relative line numbering on the left column
" set number relativenumber

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
nnoremap <silent> <C-h> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-d>	<cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <C-S-f> <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gq    <cmd>lua vim.lsp.buf.format{async=true}<CR>
vnoremap <silent> gq    <cmd>lua vim.lsp.buf.format{async=true}<CR><ESC>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
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


"--- Lightline ---
" Colors						  FOREGROUND BACKGROUND
let s:black_on_red				= [['', 00], ['', 01]] " Black on red
let s:black_on_orange			= [['', 00], ['', 04]] " Black on orange
let s:black_on_yellow			= [['', 00], ['', 03]] " Black on yellow
let s:black_on_green			= [['', 00], ['', 02]] " Black on green
let s:black_on_lightgrey		= [['', 00], ['', 07]] " Black on light grey
let s:black_on_lightblue		= [['', 00], ['', 06]] " Black on light blue
let s:white_on_darkgrey			= [['', 15], ['', 05]] " White on dark grey
let s:lightgrey_on_lightgrey	= [['', 07], ['', 07]] " Light grey on dark grey
let s:lightgrey_on_darkgrey		= [['', 07], ['', 05]] " Light grey on dark grey
let s:blue_on_darkgrey			= [['', 06], ['', 05]] " Blue on dark grey
let s:pink_on_darkgrey			= [['', 09], ['', 05]] " Pink on dark grey
let s:red_on_darkgrey			= [['', 01], ['', 05]] " Red on dark grey
let s:orange_on_darkgrey		= [['', 04], ['', 05]] " Orange on dark grey
let s:green_on_darkgrey			= [['', 02], ['', 05]] " Green on dark grey
let s:yellow_on_black			= [['', 03], ['', 00]] " Green on dark grey

let s:p = {'normal': {}, 'command': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ s:black_on_orange, s:red_on_darkgrey, s:orange_on_darkgrey, s:green_on_darkgrey, s:lightgrey_on_darkgrey ]
let s:p.insert.left     = [ s:black_on_green, s:red_on_darkgrey, s:orange_on_darkgrey, s:green_on_darkgrey, s:lightgrey_on_darkgrey ]
let s:p.command.left    = [ s:black_on_yellow, s:lightgrey_on_darkgrey ]
let s:p.replace.left    = [ s:black_on_red, s:lightgrey_on_darkgrey ]
let s:p.visual.left     = [ s:black_on_lightgrey, s:lightgrey_on_darkgrey ]
let s:p.inactive.left   = [ s:white_on_darkgrey, s:lightgrey_on_darkgrey ]
let s:p.normal.middle   = [ s:lightgrey_on_darkgrey ]
let s:p.inactive.middle = [ s:white_on_darkgrey ]
let s:p.normal.right    = [ s:pink_on_darkgrey, s:blue_on_darkgrey ]
let s:p.inactive.right  = [ s:white_on_darkgrey, s:white_on_darkgrey ]
let s:p.normal.error    = [ s:red_on_darkgrey ]
let s:p.normal.warning  = [ s:orange_on_darkgrey ]
let s:p.tabline.left    = [ s:black_on_lightgrey ]
let s:p.tabline.middle  = [ s:black_on_lightgrey ]
let s:p.tabline.right   = [ s:lightgrey_on_lightgrey ]
let s:p.tabline.tabsel  = [ s:yellow_on_black ]

let g:lightline#colorscheme#maze_lightline#palette = lightline#colorscheme#flatten(s:p)

" Set color to the components:
let g:lightline = {
	\ 'colorscheme': 'maze_lightline',
	\ }
let g:lightline.component = {
			\ 'errors': '%{luaeval("vim.lsp.diagnostic.get_count(0,\"Error\")")}',
			\ 'warnings': '%{luaeval("vim.lsp.diagnostic.get_count(0,\"Warning\")")}',
			\ 'infos': '%{luaeval("vim.lsp.diagnostic.get_count(0,\"Information\")")}',
			\ 'hints': '%{luaeval("vim.lsp.diagnostic.get_count(0,\"Hint\")")}',
			\ 'lineinfo': "%{printf('%d/%d:%d', line('.'),  line('$'), col('.'))}",
	\ }
let g:lightline.active = {
	\ 'left': [ [ 'mode', 'paste' ],
	\			[ 'errors' ],
	\			[ 'warnings' ],
	\			[ 'infos' ],
	\			[ 'hints' ],
	\           [ 'readonly', 'filename', 'modified' ]],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'blue_on_darkgrey' ],
	\            [ 'fileformat', 'fileencoding', 'filetype' ] ]
	\ }
let g:lightline.inactive = {
	\ 'left': [ [ 'filename' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'blue_on_darkgrey' ] ]
	\ }
let g:lightline.tabline = {
	\ 'left': [ [ 'tabs' ] ],
	\ 'right': [ [ 'close' ] ]
	\ }

"--- LUA SETUP ---
lua <<EOF
local lsp = require('lspconfig')
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

require'flutter-tools'.setup{}

-- require'nvim-treesitter.configs'.setup {
	-- ensure_installed = "",
	-- sync_install = false,
	-- highlight = {
		-- enable = true,
		-- additional_vim_regex_highlighting = false,
	-- },
-- }

EOF
