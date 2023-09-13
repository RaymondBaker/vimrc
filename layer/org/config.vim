function! MakeDiaryEntry()
  :exec "e " . "~/vimwiki/diary/" . strftime('%Y-%m-%d_diary') . ".md"
  :put =strftime('*%a %Y-%m-%d %H:%M:%S%z*')
  " doesn't put you into insertmode for some reason
  :normal o
  :normal o
  " go into insert
  :startinsert
endfunction

function! MakeTodoLink()
  return "~/vimwiki/todo/" . strftime('%Y-%m-%d_todo') . ".md"
endfunction

nmap <Leader>ww :e ~/vimwiki/index.md<CR>

nmap <Leader>wi :exec "e " . MakeTodoLink()<CR>
nmap <Leader>w<Leader>w :call MakeDiaryEntry()<CR>

nmap <leader>now :put =strftime('*%a %Y-%m-%d %H:%M:%S%z*')<CR>
