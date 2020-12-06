" Colors		 FOREGROUND BACKGROUND
let s:mode_rpl = [['', 00], ['', 01]] " Black on red
let s:mode_nrm = [['', 00], ['', 04]] " Black on orange
let s:mode_cmd = [['', 00], ['', 03]] " Black on yellow
let s:mode_ins = [['', 00], ['', 02]] " Black on green
let s:mode_vsl = [['', 00], ['', 07]] " Black on light grey
let s:mode_tab = [['', 00], ['', 06]] " Black on light blue
let s:mode_ict = [['', 15], ['', 05]] " White on dark grey
let s:file_inf = [['', 07], ['', 05]] " Light grey on dark grey
let s:middle   = [['', 07], ['', 05]] " Light grey on dark grey
let s:percent  = [['', 06], ['', 05]] " Blue on dark grey
let s:position = [['', 09], ['', 05]] " Pink on dark grey
let s:error    = [['', 01], ['', 05]] " Red on dark grey
let s:warning  = [['', 04], ['', 05]] " Orange on dark grey
let s:info     = [['', 03], ['', 05]] " Green on dark grey

let s:p = {'normal': {}, 'command': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ s:mode_nrm, s:error, s:warning, s:info, s:file_inf ]
let s:p.insert.left     = [ s:mode_ins, s:error, s:warning, s:info, s:file_inf ]
let s:p.command.left    = [ s:mode_cmd, s:file_inf ]
let s:p.replace.left    = [ s:mode_rpl, s:file_inf ]
let s:p.visual.left     = [ s:mode_vsl, s:file_inf ]
let s:p.tabline.left    = [ s:mode_tab, s:file_inf ]
let s:p.inactive.left   = [ s:mode_ict, s:file_inf ]
let s:p.normal.middle   = [ s:middle ]
let s:p.tabline.middle  = [ s:middle ]
let s:p.inactive.middle = [ s:mode_ict ]
let s:p.normal.right    = [ s:position, s:percent ]
let s:p.tabline.right   = [ s:position, s:percent ]
let s:p.inactive.right  = [ s:mode_ict, s:mode_ict ]
let s:p.normal.error    = [ s:error ]
let s:p.normal.warning  = [ s:warning ]
let s:p.tabline.tabsel  = [ s:mode_vsl ]

let g:lightline#colorscheme#maze_lightline#palette = lightline#colorscheme#flatten(s:p)

" Set color to the components:
let g:lightline = {
	\ 'colorscheme': 'maze_lightline',
	\ }
let g:lightline.component = {
	\ 'errors': '%{luaeval("vim.lsp.diagnostic.get_count(\"Error\")")}',
	\ 'warnings': '%{luaeval("vim.lsp.diagnostic.get_count(\"Warning\")")}',
	\ 'infos': '%{luaeval("vim.lsp.diagnostic.get_count(\"Information\")")}',
	\ 'hints': '%{luaeval("vim.lsp.diagnostic.get_count(\"Hint\")")}',
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
	\            [ 'percent' ],
	\            [ 'fileformat', 'fileencoding', 'filetype' ] ]
	\ }
let g:lightline.inactive = {
	\ 'left': [ [ 'filename' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ] ]
	\ }
let g:lightline.tabline = {
	\ 'left': [ [ 'tabs' ] ],
	\ 'right': [ [ 'close' ] ]
	\ }
