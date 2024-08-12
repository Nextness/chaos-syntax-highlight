" Comment
syn region MyComment start='//' end='$'
syn region anotherComment start='---' end='$'
hi def link MyComment Comment
hi def link anotherComment Comment

" Comptime evaluation
" syn region chaosCompileTimeSpace start='#' end='\s'
syn match chaosCompileTimeSpace "#[a-zA-Z0-9]*"
"syn keyword chaosModified

hi def link chaosCompileTime Special
hi def link chaosCompileTimeSpace chaosCompileTime
hi def link chaosModified Special

syn keyword chaosSpecial dynamic
hi def link chaosSpecial Special

" Struct and Procedures
syn keyword chaosDef struct dataArgs enum pub proc interface impl macro
hi def link chaosDef Keyword

" String interpolation
syn region chaosString start='"' end='"'
highlight chaosString ctermfg=DarkCyan guifg=DarkCyan

syn region MyString start='i"' end='"' contains=MyVariable
syn region MySql start='sql"' end='"' contains=MyVariable
syn match MyVariable /{[^}]*}/ contained
highlight MyString ctermfg=DarkCyan guifg=DarkCyan
highlight MySql ctermfg=DarkCyan guifg=DarkCyan
highlight MyVariable ctermfg=White guifg=White


" Keywords within functions
syn keyword chaosAssignment let from import module const local test assert
syn keyword chaosStatement using in as with defer goto label return set break continue fallthrough nothing exitWith orReturn orSet orExitWith likely unlikely volatile
syn keyword chaosConditional if elif else case default try
syn keyword chaosRepeat for while

hi def link chaosAssignment Keyword
hi def link chaosStatement Statement
hi def link chaosConditional Conditional
hi def link chaosRepeat Repeat

" Chaos default types
syn match chaosGenericStructs /\*\?\<[A-Z]\{1\}[a-zA-Z0-9]*\>?\?/
syn match chaosType /\*\?\<\(Type\|Bool\|String\|Rune\|Char\|Array\|Dict\|Nihil\|Literal\|Const\|Async\|Self\)\>?\?/
" syn keyword chaosType Type Bool String Rune Char Array Dict Nihil Literal Const
syn keyword chaosError Error
syn match chaosSignedInts /\*\?\<\(I8\|I16\|I32\|I64\)\>?\?/
" syn keyword chaosSignedInts I8 I16 I32 I64
syn keyword chaosUnsignedInts Byte U8 U16 U32 U64 U128
syn keyword chaosFloats F8 F16 F32 F64
syn keyword chaosComplex C16 C32 C64 C128
syn keyword chaosQuarternion Q32 Q64 Q128 Q256

hi def link chaosGenericStructs Type
hi def link chaosType Type
hi def link chaosError Type
hi def link chaosSignedInts Type
hi def link chaosUnsignedInts Type
hi def link chaosFloats Type
hi def link chaosComplex Type
hi def link chaosQuaternion Type

" Chaos default values
syn keyword chaosBoolean true false
syn keyword chaosIdentifiers null

hi def link chaosBoolean Boolean
hi def link chaosIdentifiers Boolean

syn match chaosMacros "@[a-zA-Z0-9]*"
hi def link chaosMacros Boolean

syn match chaosLiteral /<<[a-zA-Z0-9]*>>/
hi def link chaosLiteral Keyword


" Errors
" syntax region BracketedError start='<' end='>' contains=ErrorNamePart,ErrorPart,DotPart
" syntax match ErrorPart /\<\w\+\>/ contained
" syntax match DotPart /\./ contained
" syntax match ErrorNamePart /\w\+/ contained nextgroup=BracketedError
" highlight BracketedError ctermfg=LightMagenta guifg=LightMagenta
" highlight ErrorNamePart ctermfg=LightMagenta guifg=LightMagenta
" highlight ErrorPart ctermfg=Blue guifg=Blue
" highlight DotPart ctermfg=White guifg=White
