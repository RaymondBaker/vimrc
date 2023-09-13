function! MakeDiaryEntry()
  :exec "e " . "~/vimwiki/diary/" . strftime('%Y-%m-%d_diary') . ".md"
  :normal G
  :normal o
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

noremap <Leader>ww :e ~/vimwiki/index.md<CR>

noremap <Leader>wt :exec "e " . MakeTodoLink()<CR>
noremap <Leader>wd :call MakeDiaryEntry()<CR>
