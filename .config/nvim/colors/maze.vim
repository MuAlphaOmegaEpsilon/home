set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "maze"

hi Normal		ctermfg=07	cterm=none
hi TrailingWhitespace		ctermbg=04
hi Cursor					cterm=reverse
hi Visual					cterm=reverse
hi Comment		ctermfg=08

hi Constant		ctermfg=13	cterm=none "	any constant
hi String		ctermfg=11	cterm=none "	"Hello world!"
hi Character	ctermfg=11	cterm=none "	'a'
hi Number		ctermfg=13	cterm=none "	1, 2, 3
hi Boolean		ctermfg=13	cterm=none "	true, false
hi Float		ctermfg=13	cterm=none "	10.3f

hi PreProc		ctermfg=09	cterm=none "	generic PreProcessor keyword
hi Include		ctermfg=09	cterm=none "	#include
hi Define		ctermfg=09	cterm=none "	#define
hi Macro		ctermfg=09	cterm=none "	same as Define
hi PreCondit	ctermfg=09	cterm=none "	#if, #else, #endif

hi Identifier	ctermfg=15	cterm=none "	any variable name
hi Function		ctermfg=02	cterm=none "	function name

hi Statement	ctermfg=09	cterm=none "	any statement
hi Conditional	ctermfg=09	cterm=none "	if, then, else, endif, switch
hi Repeat		ctermfg=09	cterm=none "	for, do, while
hi Label		ctermfg=14	cterm=none "	case, default
hi Operator		ctermfg=07	cterm=none "	sizeof, +, *
hi Exception	ctermfg=09	cterm=none "	try, catch, throw
hi Keyword		ctermfg=07	cterm=none "	any other keyword

hi Type			ctermfg=06	cterm=none "	int, long, double
hi StorageClass	ctermfg=09	cterm=none "	static, register, volatile
hi Structure	ctermfg=09	cterm=none "	struct, union, enum
hi Typedef		ctermfg=09	cterm=none "	typedef

hi Special		ctermfg=15	cterm=none "	any special symbol
hi SpecialChar	ctermfg=15	cterm=none "	special character in a constant
hi Tag			ctermfg=15	cterm=none "	CTRL+] can be used on this
hi Delimiter	ctermfg=15	cterm=none "	character that needs attention
hi SpecialComment ctermfg=15 cterm=none "	special things inside a comment
hi Debug		ctermfg=15	cterm=none "	debugging statements

hi Underlined	ctermfg=15 ctermbg=05	"	text that stands out, HTML links

hi SignColumn	ctermbg=07

hi LineNr		ctermfg=00 ctermbg=07
hi CursorLine	cterm=none ctermbg=05

hi DiffAdd		ctermfg=02 ctermbg=05
hi DiffChange	ctermfg=04 ctermbg=05
hi DiffDelete	ctermfg=01 ctermbg=05

hi MatchParen	ctermfg=15 ctermbg=00	"	Highlight to apply to matching parenthesis
hi YankRegion	ctermfg=03 ctermbg=07

hi Pmenu		ctermfg=15 ctermbg=05
hi PmenuSel		ctermfg=00 ctermbg=07
hi PmenuSbar	           ctermbg=05
hi PmenuThumb	           ctermbg=07

" C
hi link cConstant Constant	"	__PRETTY_FUNCTION__
hi link cOperator Function	"	static_assert

" C++
" hi cppAccess		ctermfg=	"	public, protected, private
" hi cppExceptions	ctermfg=	"	throw, try, catch
hi cppModifier		ctermfg=09	cterm=none "	inline, virtual, explicit, export, override, final
hi cppStorageClass	ctermfg=09	cterm=none "	mutable, constexpr, decltype, thread_local
hi cppStructure		ctermfg=14	cterm=none "	class, typename, template, namespace
hi link cppStatement Statement	"	new, delete, this, friend, using
hi link cppType	Type			"	nullptr_t, auto
hi link cppOperator	Function	"	typeid, and, bitor, xor_eq
hi link cppCast Function		"	static_cast, const_cast

hi Error		ctermfg=01 ctermbg=05
hi SpellBad		ctermfg=01 ctermbg=05
hi Warning		ctermfg=04 ctermbg=05
hi SpellCap		ctermfg=04 ctermbg=05
hi Todo			ctermfg=03 ctermbg=05

"--- nvim-lsp ---
hi LspDiagnosticsSignError				ctermfg=00 ctermbg=01
hi LspDiagnosticsSignWarning			ctermfg=00 ctermbg=04
hi LspDiagnosticsSignHint				ctermfg=00 ctermbg=03
hi LspDiagnosticsSignInformation		ctermfg=00 ctermbg=04
hi LspDiagnosticsFloatingError			ctermfg=01
hi LspDiagnosticsFloatingWarning		ctermfg=04
hi LspDiagnosticsFloatingHint			ctermfg=03
hi LspDiagnosticsFloatingInformation	ctermfg=04
hi LspDiagnosticsVirtualTextError		ctermfg=01
hi LspDiagnosticsVirtualTextWarning		ctermfg=04
hi LspDiagnosticsVirtualTextHint    	ctermfg=03
hi LspDiagnosticsVirtualTextInformation	ctermfg=04
hi LspReferenceText			ctermbg=03
hi LspReferenceRead			ctermbg=03
hi LspReferenceWrite		ctermbg=03


"--- treesitter ---
hi def RED ctermfg=01
hi link TSConstant Constant
hi link TSConstBuiltin Constant
hi link TSConstMacro Macro
hi link TSInclude Include
hi link TSFunction Function
hi link TSMethod Function
hi link TSFuncBuiltin Function
hi link TSFuncMacro Macro
hi link TSKeyword StorageClass
hi link TSKeywordOperator Function
hi link TSParameter Identifier
hi link TSParameterReference Identifier
hi link TSField Constant
hi link TSProperty Identifier
hi link TSType Type
hi link TSNamespace Type
" hi link TSVariable Normal
hi link TSAttribute Label
" hi link TSError Error
hi TSVariableBuiltin ctermfg=04 cterm=none
