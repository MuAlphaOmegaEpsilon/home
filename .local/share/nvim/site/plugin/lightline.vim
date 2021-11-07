" Colors		 FOREGROUND BACKGROUND
let s:black_on_red = [['', 00], ['', 01]] " Black on red
let s:black_on_orange = [['', 00], ['', 04]] " Black on orange
let s:black_on_yellow = [['', 00], ['', 03]] " Black on yellow
let s:black_on_green = [['', 00], ['', 02]] " Black on green
let s:black_on_lightgrey = [['', 00], ['', 07]] " Black on light grey
let s:black_on_lightblue = [['', 00], ['', 06]] " Black on light blue
let s:white_on_darkgrey = [['', 15], ['', 05]] " White on dark grey
let s:lightgrey_on_lightgrey = [['', 07], ['', 07]] " Light grey on dark grey
let s:lightgrey_on_darkgrey = [['', 07], ['', 05]] " Light grey on dark grey
let s:blue_on_darkgrey  = [['', 06], ['', 05]] " Blue on dark grey
let s:pink_on_darkgrey = [['', 09], ['', 05]] " Pink on dark grey
let s:red_on_darkgrey    = [['', 01], ['', 05]] " Red on dark grey
let s:orange_on_darkgrey  = [['', 04], ['', 05]] " Orange on dark grey
let s:green_on_darkgrey     = [['', 02], ['', 05]] " Green on dark grey
let s:yellow_on_black     = [['', 03], ['', 00]] " Green on dark grey

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
