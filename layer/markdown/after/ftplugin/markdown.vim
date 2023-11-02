setlocal spell
" English dictionary, ignoring East Asian characters.
setlocal spelllang=en,cjk
setlocal textwidth=120

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

" Callback: Fold level <- next line indent
function! TodoListFoldMethod(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
endfunction

function! SetMarkdownFolding()
endfunction

function! SetFolding()
    let s:filename=expand('%:t')
    if match(s:filename, 'todo.*\.md') >= 0
        let g:vim_markdown_folding_disabled = 1
        setlocal foldmethod=expr
        setlocal foldexpr=TodoListFoldMethod(v:lnum)
    else
        let g:vim_markdown_folding_disabled = 0
    endif
endfunction


autocmd BufEnter * call SetFolding()
