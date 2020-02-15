" Vim syntax file
" Language:	Chez Scheme

syn match schemeLang "#!chezscheme"

syn keyword schemeSyntax library export import
syn keyword schemeSyntax let-values define-values
syn keyword schemeSyntax case-lambda
syn keyword schemeSyntax when unless
syn keyword schemeSyntax match

syn keyword schemeSyntax syntax-case

syn keyword schemeExtSyntax module
syn keyword schemeExtFunc format

syn keyword schemeFunc box unbox

syn match schemeOther "#%[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
syn match schemeOther "|[^|]\+|"

syn match schemeSymbol "['`][-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

syn region schemeUnquote matchgroup=Delimiter start="#," end=![ \t\[\]()";]!me=e-1 contains=ALL
syn region schemeUnquote matchgroup=Delimiter start="#,@" end=![ \t\[\]()";]!me=e-1 contains=ALL
syn region schemeUnquote matchgroup=Delimiter start="#,(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start="#,@(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start="#,\[" end="\]" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start="#,@\[" end="\]" contains=ALL
syn region schemeQuoted matchgroup=Delimiter start="#['`]" end=![ \t()\[\]";]!me=e-1 contains=ALL
syn region schemeQuoted matchgroup=Delimiter start="#['`](" matchgroup=Delimiter end=")" contains=ALL

hi def link schemeSymbol Type

set lispwords+=library
set lispwords+=let-values
set lispwords+=module
set lispwords+=syntax-rules
set lispwords+=syntax-case
set lispwords+=match
