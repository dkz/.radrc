" Vim syntax file
" Language:	Chez Scheme

syn match extSchemeLang "#!chezscheme"

syn keyword extSchemeSyntax library export import
syn keyword extSchemeSyntax let-values define-values
syn keyword extSchemeSyntax case-lambda
syn keyword extSchemeSyntax when unless guard
syn keyword extSchemeSyntax match-case match-lambda
syn keyword extSchemeSyntax assoc-let assoc-bind dispatcher

syn keyword extSchemeSyntax syntax-case

syn keyword extSchemeExtSyntax module
syn keyword extSchemeExtFunc format

syn keyword extSchemeFunc box unbox set-box! box?

syn keyword extSchemeFunc conses

syn match extSchemeOther "#%[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
syn match extSchemeOther "|[^|]\+|"

syn match extSchemeSymbol "['`][-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

syn match extSchemeBox "#&"
syn region extSchemeBox matchgroup=Delimiter start="#&(" end=")" contains=ALL

syn region extSchemeUnquote matchgroup=Delimiter start="#," end=![ \t\[\]()";]!me=e-1 contains=ALL
syn region extSchemeUnquote matchgroup=Delimiter start="#,@" end=![ \t\[\]()";]!me=e-1 contains=ALL
syn region extSchemeUnquote matchgroup=Delimiter start="#,(" end=")" contains=ALL
syn region extSchemeUnquote matchgroup=Delimiter start="#,@(" end=")" contains=ALL
syn region extSchemeUnquote matchgroup=Delimiter start="#,\[" end="\]" contains=ALL
syn region extSchemeUnquote matchgroup=Delimiter start="#,@\[" end="\]" contains=ALL
syn region extSchemeQuoted matchgroup=Delimiter start="#['`]" end=![ \t()\[\]";]!me=e-1 contains=ALL
syn region extSchemeQuoted matchgroup=Delimiter start="#['`](" matchgroup=Delimiter end=")" contains=ALL

hi def link extSchemeLang	PreProc
hi def link extSchemeSyntax	Statement
hi def link extSchemeSymbol Type
hi def link extSchemeFunc	Function
hi def link extSchemeExtSyntax Type
hi def link extSchemeExtFunc PreProc
hi def link extSchemeBox Type

set lispwords+=library
set lispwords+=let-values
set lispwords+=module
set lispwords+=syntax-rules
set lispwords+=syntax-case
set lispwords+=match-case
set lispwords+=assoc-let
set lispwords+=assoc-bind
set lispwords+=guard
