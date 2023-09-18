let s:vimWikiDir = "~/vimwiki/"
let s:dailyLogDir = s:vimWikiDir . "daily_log/"
let s:todoDir = s:vimWikiDir . "todo/"

function! GetWikiIndexFile()
  " for some reason referencing s:vimWikiDir in the noremap didn't work
  return s:vimWikiDir . "index.md"
endfunction

function! AddIndexEntry(indexFile, filename)
  " Generate entry and make filename relative for it
  echo a:filename
  echo s:vimWikiDir
  let l:indexEntry = "- [" . strftime('%a %B %d %Y') . "](" . a:filename . ")"
  :call writefile([l:indexEntry], expand(a:indexFile), "a")
endfunction

function! MakeDailyLogEntry()
  let l:filename = strftime('%Y-%m-%d_worklog') . ".md"
  let l:fileLoc = s:dailyLogDir . l:filename

  if !filereadable(expand(l:fileLoc))
    echo l:filename . " doesn't exist making entry for it"
    :call AddIndexEntry(s:dailyLogDir . "index.md", l:filename)
  endif

  :exec "e " . l:fileLoc
  :w
  :normal G
  :normal o
  :put =strftime('**%a %Y-%m-%d %H:%M:%S%z**')
  " doesn't put you into insertmode for some reason
  :normal o
  :normal o
  " go into insert
  :startinsert
endfunction

function! MakeTodoLink()
  return s:todoDir . strftime('%Y-%m-%d_todo') . ".md"
endfunction

noremap <Leader>ww :exec "e " . GetWikiIndexFile()<CR>
noremap <Leader>wt :exec "e " . MakeTodoLink()<CR>
noremap <Leader>wd :call MakeDailyLogEntry()<CR>
noremap <Leader>wc :bd ~/vimwiki/*<C-a><CR>
