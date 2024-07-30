let b:current_syntax = 'markdown'

syn match Header     '^#\{1,6} .*'
syn match Horizontal '^-\{3,}$'
syn match Bold       '\*\*.*\*\*'
syn match Italic     '\*[^*]\+\*'
syn match Link       '\[.*\](.*)'
syn match Url        'http[s]\?:\/\/[a-zA-Z0-9-_.]\+'
syn match List       '^\s*-\s\+.*' contains=Bold,Italic,Link,InlineCode
syn match Quote      '^>.*'
syn match InlineCode '`[^`]\+`'
syn region Code start='```' end='```'

hi def link Header Title
hi def link Horizontal CursorLine
hi Italic gui=Italic
hi Bold gui=Bold
hi def link Link Underlined
hi def link Url Underlined
hi def link List Special
hi Quote gui=reverse
hi def link InlineCode Comment
hi def link Code Comment
