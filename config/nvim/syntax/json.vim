let b:current_syntax = 'json'

syn region jsonStringSQError oneline  start=+'+  skip=+\\\\\|\\"+  end=+'+
syn match  jsonKeywordMatch  /"\([^"]\|\\\"\)\+"[[:blank:]\r\n]*\:/ contains=jsonKeyword
syn match  jsonStringMatch   /"\([^"]\|\\\"\)\+"\ze[[:blank:]\r\n]*[,}\]]/ contains=jsonString
syn region jsonString        oneline matchgroup=jsonQuote start=/"/  skip=/\\\\\|\\"/  end=/"/ contains=jsonEscape contained
syn region jsonKeyword       matchgroup=jsonQuote start=/"/  end=/"\ze[[:blank:]\r\n]*\:/ contains=jsonEscape contained
syn match  jsonEscape        "\\["\\/bfnrt]" contained
syn match  jsonEscape        "\\u\x\{4}" contained
syn match  jsonNumber        "-\=\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>\ze[[:blank:]\r\n]*[,}\]]"
syn match  jsonNoise         /\%(:\|,\)/

syn match jsonTrailingCommaError ",\_s*[}\]]"
syn match jsonMissingCommaError  /\("\|\]\|\d\)\zs\_s\+\ze"/
syn match jsonMissingCommaError  /\(\]\|\}\)\_s\+\ze"/
syn match jsonMissingCommaError  /}\_s\+\ze{/
syn match jsonMissingCommaError  /\(true\|false\)\_s\+\ze"/
syn match jsonTripleQuotesError  /"""/
syn match jsonSemicolonError     ";"
syn match jsonNoQuotesError      "\<[[:alpha:]][[:alnum:]]*\>"
syn match jsonCommentError       "\(/\*\)\|\(\*/\)"
syn match jsonCommentError       "//.*"
syn match jsonNumError           "\:\@<=[[:blank:]\r\n]*\zs\.\d\+"
syn match jsonNumError           "-\=\<0\d\.\d*\>"

syn match   jsonPadding "\%^[[:blank:]\r\n]*[_$[:alpha:]][_$[:alnum:]]*[[:blank:]\r\n]*("
syn match   jsonPadding ");[[:blank:]\r\n]*\%$"
syn match   jsonBoolean /\(true\|false\)\(\_s\+\ze"\)\@!/
syn keyword jsonNull    null
syn region  jsonFold    matchgroup=jsonBraces start="{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold
syn region  jsonFold    matchgroup=jsonBraces start="\[" end=/]\(\_s\+\ze"\)\@!/ transparent fold

hi def link jsonPadding	Operator
hi def link jsonString	String
hi def link jsonTest		Label
hi def link jsonEscape	Special
hi def link jsonNumber	Number
hi def link jsonBraces	Delimiter
hi def link jsonNull		Function
hi def link jsonBoolean	Boolean
hi def link jsonKeyword	Label
hi def link jsonQuote		Quote
hi def link jsonNoise		Noise

hi def link jsonTrailingCommaError Error
hi def link jsonMissingCommaError	 Error
hi def link jsonTripleQuotesError	 Error
hi def link jsonSemicolonError		 Error
hi def link jsonStringSQError			 Error
hi def link jsonNoQuotesError			 Error
hi def link jsonCommentError			 Error
hi def link jsonNumError					 Error
