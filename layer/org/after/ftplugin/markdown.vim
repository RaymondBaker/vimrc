" use coc-marksman gd to follow links
":CocInstall @yaegassy/coc-marksman

" Get this working so links don't need to be exact
"nmap <buffer> <CR> F[f]gd
nmap <buffer> <CR> gd

" Make link entry
xmap <buffer> <Leader>ml S]%a()<ESC>i
" Make reference entry
xmap <buffer> <Leader>mr S]%a[]<ESC>i


function! ToggleCheckBox()
  let l:line = getline('.')
  if match(l:line, '\s*-\s\+\[\s*x\s*]') != -1
    let l:line = substitute(l:line, '\[\s*x\s*\]', '[ ]', '')
  elseif match(l:line, '\s*-\s\+\[\s*]') != -1
    let l:line = substitute(l:line, '\[\s*\]', '[x]', '')
  else
    return
  endif
  call setline('.', l:line)
endfunction

noremap <buffer> <Leader>tt :call ToggleCheckBox()<CR>
noremap <buffer> <Leader>mc o-<Space>[<Space>]<Space>

" Align table
nmap <buffer> <Leader>at :TableFormat<CR>
