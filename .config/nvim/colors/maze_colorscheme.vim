set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "maze_colorscheme"

"	Darker			Brighter
"
"	00 Black		08 Grey
"	01 Red			09 Purple
"	02 Orange		10 Pink
"	03 Yellow		11 PastelYellow
"	04 LightGreen	12 DarkGreen
"	05 LightBlue	13 PrussianBlue
"	06 DarkGrey		14 Blue
"	07 LightGrey	15 White

hi Normal		ctermfg=07
hi TrailingWhitespace		ctermbg=04
hi Cursor 					cterm=reverse
hi Visual					cterm=reverse
hi Comment		ctermfg=08

hi Constant		ctermfg=09	"	any constant
hi String		ctermfg=11	"	"Hello world!"
hi Character	ctermfg=02	"	'a'
hi Number		ctermfg=09	" 	1, 2, 3
hi Boolean		ctermfg=09	" 	true, false
hi Float		ctermfg=09	" 	10.3f

hi PreProc		ctermfg=14	"	generic PreProcessor keyword
hi Include		ctermfg=14	"	#include
hi Define		ctermfg=14	"	#define
hi Macro		ctermfg=14	"	same as Define
hi PreCondit	ctermfg=14	"	#if, #else, #endif

hi Identifier	ctermfg=04	"	any variable name
hi Function		ctermfg=13	"	function name

hi Statement	ctermfg=10	"	any statement	
hi Conditional	ctermfg=10	"	if, then, else, endif, switch
hi Repeat		ctermfg=10	"	for, do, while
hi Label		ctermfg=13	"	case, default
hi Operator		ctermfg=13	"	sizeof, +, *
hi Keyword		ctermfg=04	"	any other keyword
hi Exception	ctermfg=10	"	try, catch, throw

hi Type			ctermfg=05	"	int, long, double
hi StorageClass	ctermfg=10	"	static, register, voltatile
hi Structure	ctermfg=10	"	struct, union, enum
hi Typedef		ctermfg=10	"	typedef

hi Special		ctermfg=15	"	any special symbol
hi SpecialChar	ctermfg=15	"	special character in a constant
hi Tag			ctermfg=15	"	CTRL+] can be used on this
hi Delimiter	ctermfg=15	"	character that needs attention
hi SpecialComment ctermfg=15 "	special things inside a comment
hi Debug		ctermfg=15	"	debugging statements

hi Underlined	ctermfg=15 ctermbg=05	"	text that stands out, HTML links

hi SignColumn	ctermbg=06

hi LineNr		ctermfg=00 ctermbg=07
" hi Cursor		ctermfg=
" hi StatusLine		ctermfg=
" hi StatusLineNC	ctermfg=

hi MatchParen	ctermfg=00 ctermbg=07	"	Highlight to apply to matching parenthesis

hi Pmenu		ctermfg=15 ctermbg=06
hi PmenuSel		ctermfg=00 ctermbg=07
hi PmenuSbar	           ctermbg=06
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
hi cppModifier		ctermfg=10	"	inline, virtual, explicit, export, override, final
" hi cppType		ctermfg=	"	nullptr_t, auto
" hi cppStorageClass	ctermfg=	"	mutable, constexpr, decltype, thread_local
" hi cppStructure	ctermfg=	"	class, typename, template, namespace

hi Error		ctermfg=01 ctermbg=06
hi SpellBad		ctermfg=01 ctermbg=06
hi Warning		ctermfg=02 ctermbg=06
hi SpellCap		ctermfg=02 ctermbg=06
hi Todo			ctermfg=03 ctermbg=06

"--- COC.nvim ---
hi CocErrorSign      ctermfg=01 ctermbg=06
hi CocErrorHighlight ctermfg=00 ctermbg=01
hi CocWarningSign    ctermfg=02 ctermbg=06
hi CocWarningHighlight ctermfg=00 ctermbg=02
hi CocHintSign       ctermfg=03 ctermbg=06
hi CocHintHighlight  ctermfg=00 ctermbg=03
hi CocInfoSign       ctermfg=02 ctermbg=06

"--- COC-YANK ---
hi HighlightedyankRegion ctermfg=01 ctermbg=07
