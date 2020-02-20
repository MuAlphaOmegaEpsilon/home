set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "maze_colorscheme"

hi Normal		ctermfg=07
hi TrailingWhitespace		ctermbg=04
hi Cursor					cterm=reverse
hi Visual					cterm=reverse
hi Comment		ctermfg=08

hi Constant		ctermfg=13	"	any constant
hi String		ctermfg=11	"	"Hello world!"
hi Character	ctermfg=11	"	'a'
hi Number		ctermfg=13	"	1, 2, 3
hi Boolean		ctermfg=13	"	true, false
hi Float		ctermfg=13	"	10.3f

hi PreProc		ctermfg=12	"	generic PreProcessor keyword
hi Include		ctermfg=12	"	#include
hi Define		ctermfg=12	"	#define
hi Macro		ctermfg=12	"	same as Define
hi PreCondit	ctermfg=12	"	#if, #else, #endif

hi Identifier	ctermfg=02	"	any variable name
hi Function		ctermfg=14	"	function name

hi Statement	ctermfg=09	"	any statement
hi Conditional	ctermfg=09	"	if, then, else, endif, switch
hi Repeat		ctermfg=09	"	for, do, while
hi Label		ctermfg=14	"	case, default
hi Operator		ctermfg=14	"	sizeof, +, *
hi Keyword		ctermfg=02	"	any other keyword
hi Exception	ctermfg=09	"	try, catch, throw

hi Type			ctermfg=06	"	int, long, double
hi StorageClass	ctermfg=09	"	static, register, voltatile
hi Structure	ctermfg=09	"	struct, union, enum
hi Typedef		ctermfg=09	"	typedef

hi Special		ctermfg=15	"	any special symbol
hi SpecialChar	ctermfg=15	"	special character in a constant
hi Tag			ctermfg=15	"	CTRL+] can be used on this
hi Delimiter	ctermfg=15	"	character that needs attention
hi SpecialComment ctermfg=15 "	special things inside a comment
hi Debug		ctermfg=15	"	debugging statements

hi Underlined	ctermfg=15 ctermbg=05	"	text that stands out, HTML links

hi SignColumn	ctermbg=05

hi LineNr		ctermfg=00 ctermbg=07
" hi Cursor		ctermfg=
" hi StatusLine		ctermfg=
" hi StatusLineNC	ctermfg=

hi MatchParen	ctermfg=00 ctermbg=07	"	Highlight to apply to matching parenthesis

hi Pmenu		ctermfg=15 ctermbg=05
hi PmenuSel		ctermfg=00 ctermbg=07
hi PmenuSbar	           ctermbg=05
hi PmenuThumb	           ctermbg=07

" C
" hi cConstant	ctermfg=	"	__PRETTY_FUNCTION__
" hi cOperator	ctermfg=	"	static_assert

" C++
" hi cppAccess		ctermfg=	"	public, protected, private
" hi cppCast		ctermfg=	"	static_cast, const_cast
" hi cppExceptions	ctermfg=	"	throw, try, catch
" hi cppOperator	ctermfg=	"	typeid, and, bitor, xor_eq
" hi cppStatement	ctermfg=	"	new, delete, this, friend, using
hi cppModifier		ctermfg=09	"	inline, virtual, explicit, export, override, final
" hi cppType		ctermfg=	"	nullptr_t, auto
" hi cppStorageClass	ctermfg=	"	mutable, constexpr, decltype, thread_local
" hi cppStructure	ctermfg=	"	class, typename, template, namespace

hi Error		ctermfg=01 ctermbg=05
hi SpellBad		ctermfg=01 ctermbg=05
hi Warning		ctermfg=04 ctermbg=05
hi SpellCap		ctermfg=04 ctermbg=05
hi Todo			ctermfg=03 ctermbg=05

"--- COC.nvim ---
hi CocErrorSign      ctermfg=01 ctermbg=05
hi CocErrorHighlight ctermfg=00 ctermbg=01
hi CocWarningSign    ctermfg=04 ctermbg=05
hi CocWarningHighlight ctermfg=00 ctermbg=04
hi CocHintSign       ctermfg=03 ctermbg=05
hi CocHintHighlight  ctermfg=00 ctermbg=03
hi CocInfoSign       ctermfg=04 ctermbg=05

"--- COC-YANK ---
hi HighlightedyankRegion ctermfg=01 ctermbg=07
