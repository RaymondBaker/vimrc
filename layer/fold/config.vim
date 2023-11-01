function! MyFoldText()
    let line = getline(v:foldstart)
    let l:fold_line_cnt = v:foldend - v:foldstart

    " winwidth(0) get char width of current window

    let line_text = substitute(line, '^"{\+', '', 'g')
    let l:justified_pos = winwidth(0)*3/4
    let l:left_fill_amt = l:justified_pos - len(line_text)
    let l:fold_line_hint_text = '(' . l:fold_line_cnt . ' Lines)'
    let l:right_fill_amt = winwidth(0) - l:left_fill_amt - len(l:fold_line_hint_text)


    return line_text . repeat('.', l:left_fill_amt) . l:fold_line_hint_text . repeat('.', l:right_fill_amt)
endfunction

set foldtext=MyFoldText()
