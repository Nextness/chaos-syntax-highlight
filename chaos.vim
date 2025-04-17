syntax sync minlines=100

let g:chaos_default_theme = 'gruber-darker'

let s:chaos_control_flow_list = ['if', 'elif', 'else', 'try', 'orSet', 'orReturn', 'orExitWith', 'exitWith', 'return', 'set', 'case', 'break', 'fallthrough', 'catch', 'defer', 'goto', 'label', 'while']
let s:chaos_keywords_list = ['let', 'for', 'inline', 'proc', 'assert', 'return', 'exitWith', 'import', 'using', 'module', 'type', 'builds', 'struct', 'global', 'flaw', 'alias', 'do', 'distinct', 'scaffold', 'enum', 'iota', 'label', 'goto', 'enumArray', 'default', 'in', 'range']
let s:chaos_primitive_types_list = ['String', 'Char', 'Bool', 'U64', 'I64', 'Array', 'Void', 'Map']
let s:chaos_comptime_directives_list = ['if', 'elif', 'else', 'case', 'break', 'noArguments', 'scope', 'do', 'tag', 'redacted', 'overload', 'notImplemented', 'compiler', 'let', 'extern', 'partial', 'proc', 'for', 'inline', 'type']

function! s:chaos_single_line_comment()
    syntax region ChaosSingleLineComment start='//' end='$'
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosSingleLineComment guifg=#565f73
    else
        highlight ChaosSingleLineComment guifg=#ffffff
    endif
endfunction

function! s:chaos_multi_line_comment()
    syntax region ChaosMultilineComment start='/\*\*' end='\*\*/'
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosMultilineComment guifg=#565f73
    else
        highlight ChaosMultilineComment guifg=#ffffff
    endif
endfunction

function! s:chaos_procedures()
    " TODO: Improve this match to make it easier to read - it looks like shit
    syntax match ChaosProcedures /?\?[a-z]\{1\}[a-zA-Z0-9]*\ze\(\[[^]]*\]\)\?\s*(/
    syntax match ChaosProceduresContained /?\?[a-z]\{1\}[a-zA-Z0-9]*\ze\(\[[^]]*\]\)\?\s*(/ contained
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosProcedures guifg=#96a6c8
        highlight ChaosProceduresContained guifg=#4e74c7
    else
        highlight ChaosProcedures guifg=#ffffff
    endif
endfunction

function! s:chaos_string_literal()
    syntax region ChaosStringLiteral start='«' end='»' contains=ChaosStringInterpolationVariable
    syntax match ChaosStringInterpolationVariable /{[^}]*}/ contained
    syntax region ChaosStringLiteralContained start='«' end='»' contains=ChaosStringInterpolationVariableContained contained
    syntax match ChaosStringInterpolationVariableContained /{[^}]*}/ contained

    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight link ChaosStringLiteral String
        highlight link ChaosStringInterpolationVariable Normal
        highlight ChaosStringLiteralContained guifg=#54bd09
        highlight link ChaosStringInterpolationVariableContained Normal
    else
        highlight ChaosStringLiteral guifg=#ffffff
        highlight ChaosStringInterpolationVariable guifg=#ffffff
    endif
endfunction

function! s:chaos_character_literal()
    syntax match ChaosCharacterLiteral /"[a-zA-Z ]\{1\}/
    syntax match ChaosCharacterLiteralContained /"[a-zA-Z ]\{1\}/ contained
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight link ChaosCharacterLiteral String
        highlight ChaosCharacterLiteralContained guifg=#54bd09
    else
        highlight ChaosCharacterLiteral guifg=#ffffff
    endif
endfunction

function! s:chaos_structs()
    syntax match ChaosStructs /\(\.\.\.\)\?\(&\|*\)\?\<[A-Z]\{1\}[a-zA-Z0-9]*\>\(?\|!\)\?/
    syntax match ChaosStructsContained /\(\.\.\.\)\?\(&\|*\)\?\<[A-Z]\{1\}[a-zA-Z0-9]*\>\(?\|!\)\?/ contained
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosStructs guifg=#95a99f
        highlight ChaosStructsContained guifg=#446956
    else
        highlight ChaosStructs guifg=#ffffff
    endif
endfunction

function! s:chaos_errors()
    syntax match ChaosError /[a-z]\{1\}[a-zA-Z0-9]*!/
    syntax match ChaosErrorContained /[a-z]\{1\}[a-zA-Z0-9]*!/ contained
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosError guifg=#9e95c7
        highlight ChaosErrorContained guifg=#8771eb
    else
        highlight ChaosError guifg=#ffffff
    endif
endfunction

function! s:chaos_control_flow()
    execute 'syntax match ChaosControlFlow /\<\(' . join(s:chaos_control_flow_list, '\|') . '\)\>/'
    execute 'syntax match ChaosControlFlowContained /\<\(' . join(s:chaos_control_flow_list, '\|') . '\)\>/ contained'
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosControlFlow guifg=#ffdd33
        highlight ChaosControlFlowContained guifg=#dbba14
    else
        highlight ChaosControlFlow guifg=#ffffff
    endif
endfunction

function! s:chaos_keywords()
    execute 'syntax match ChaosKeywords /\<\(' . join(s:chaos_keywords_list, '\|') . '\)\>/'
    execute 'syntax match ChaosKeywordsContained /\<\(' . join(s:chaos_keywords_list, '\|') . '\)\>/ contained'
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosKeywords guifg=#ffdd33
        highlight ChaosKeywordsContained guifg=#dbba14
    else
        highlight ChaosKeywords guifg=#ffffff
    endif
endfunction

function! s:chaos_primitive_types()
    execute 'syntax match ChaosPrimitiveTypes /\(\.\.\.\)\?\(&\|*\)\?\(?\?\)\<\(' . join(s:chaos_primitive_types_list, '\|') . '\)\>\(!\?\)/'
    execute 'syntax match ChaosPrimitiveTypesContained /\(\.\.\.\)\?\(&\|*\)\?\(?\?\)\<\(' . join(s:chaos_primitive_types_list, '\|') . '\)\>\(!\?\)/ contained'
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosPrimitiveTypes guifg=#84b59d
        highlight ChaosPrimitiveTypesContained guifg=#4fb382
    else
        highlight ChaosPrimitiveTypes guifg=#ffffff
    endif
endfunction

function! s:chaos_other_literals()
    " TODO: fix this to make sure that uninitialized variables have the
    " correct highlight
    " let s:three_dots = '\.\.\.'
    let s:literals = 'null\|true\|false'
    let s:literals_str = '\<' . s:literals . '\>'
    execute 'syntax match ChaosOtherLiterals /' . s:literals_str . '/'
    execute 'syntax match ChaosOtherLiteralsContained /' . s:literals_str . '/ contained'
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosOtherLiterals guifg=#f7b665
        highlight ChaosOtherLiteralsContained guifg=#ff8d00
    else
        highlight ChaosOtherLiterals guifg=#ffffff
    endif
endfunction

function! s:chaos_comptime_directives()
    execute 'syntax match ChaosComptimeDirective /#\<\(' . join(s:chaos_comptime_directives_list, '\|') . '\)\>/'
    if exists('g:colors_name') && g:colors_name == g:chaos_default_theme
        highlight ChaosComptimeDirective guifg=#f43841
    else
        highlight ChaosComptimeDirective guifg=#ffffff
    endif
endfunction

function! s:chaos_comptime_procs()
    syntax region ChaosComptimeProcs
        \ start=/^\s*\(#proc\|#for\|#type\|#inline\)/
        \ end=/^}/
        \ contains=
            \ ChaosComptimeDirective,
            \ ChaosKeywordsContained,
            \ ChaosControlFlowContained,
            \ ChaosPrimitiveTypesContained,
            \ ChaosProceduresContained,
            \ ChaosStructsContained,
            \ ChaosCharacterLiteralContained,
            \ ChaosStringLiteralContained,
            \ ChaosStringInterpolationVariableContained,
            \ ChaosErrorContained,
            \ ChaosOtherLiteralsContained
        \ transparent keepend extend
endfunction

call s:chaos_single_line_comment()
call s:chaos_multi_line_comment()
call s:chaos_procedures()
call s:chaos_string_literal()
call s:chaos_character_literal()
call s:chaos_structs()
call s:chaos_errors()
call s:chaos_control_flow()
call s:chaos_keywords()
call s:chaos_primitive_types()
call s:chaos_other_literals()
call s:chaos_comptime_directives()
call s:chaos_comptime_procs()

