function! MakeDiaryLink()
  return "~/vimwiki/diary/" . strftime('%Y-%m-%d_diary') . ".md"
endfunction

function! MakeTodoLink()
  return "~/vimwiki/todo/" . strftime('%Y-%m-%d_todo') . ".md"
endfunction

nmap <Leader>ww :e ~/vimwiki/index.md<CR>

nmap <Leader>wi :exec "e " . MakeTodoLink()<CR>
nmap <Leader>w<Leader>w :exec "e " . MakeDiaryLink()<CR>

nmap <leader>now :put =strftime('*%a %Y-%m-%d %H:%M:%S%z*')<CR>
