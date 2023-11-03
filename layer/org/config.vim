let s:vimWikiDir = "~/vimwiki/docs/"
let s:dailyLogDir = s:vimWikiDir . "daily-log/"
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
  let l:filename = strftime('log-%Y-%m-%d') . ".md"
  let l:fileLoc = s:dailyLogDir . l:filename
  let l:workLogExists = filereadable(expand(l:fileLoc))

  if !l:workLogExists
    echo l:filename . " doesn't exist making entry for it"
    :call AddIndexEntry(s:dailyLogDir . "index.md", l:filename)
  endif

  :exec "e " . l:fileLoc
  if !l:workLogExists
    :w
    "Get rid of default empty line
    " since :put starts on the next line
    :normal dd
  endif
  :normal G
  if l:workLogExists
    :normal o
  endif
  :put =strftime('**%a %Y-%m-%d %H:%M:%S%z**')
  " doesn't put you into insertmode for some reason
  :normal o
  :normal o
  " go into insert
  :startinsert
endfunction

function! MakeNewTodo()
  " Read contents of old todo and remove checked off items
  " assumes new todo file is in the current buffer
  " grep -v 'index.md' will remove daily-logs-index.md and todo-index.md from the results
  let l:lastTodoFile = substitute(system('ls ' . s:todoDir . ' -t | grep -v index.md | head -n 1'), '\n\+$', '', '')

  :exec "r " . s:todoDir . l:lastTodoFile
  " Get rid of extra lines :r Adds and old Header
  :normal gg
  :normal dd
  :normal dd
  :put =strftime('# TODO %a %Y-%m-%d')
  :normal gg
  :normal dd
  :normal o
  " Remove old completed checks
  " :g/\s*-\s\+\[x\]/d
  " For now do this manually
  " I think a better approach would be to delete all sub checks if top is done

  " remove uncompleted checks for last todo
  " edit this first so mtime is before the new todo
  " fixes issues with grabbing the latest todo
  :exec "e " . l:lastTodoFile
  :normal gg
  while search('^-\s*\[\s\]')
    :normal dd
    let l:line = getline('.')
    let l:line_num = line(".")
    while match(l:line, '^\s\s*') >= 0
        :normal dd
        if l:line_num > line(".")
            " we're at the end of the file
            break
        endif
        let l:line_num = line(".")
        let l:line = getline('.')
    endwhile
  endwhile
  :w
  :bd

  " remove completed checks
  :normal gg
  while search('^-\s*\[x\]')
    :normal dd
    let l:line = getline('.')
    let l:line_num = line(".")
    while match(l:line, '^\s\s*') >= 0
        :normal dd
        if l:line_num > line(".")
            " we're at the end of the file
            break
        endif
        let l:line_num = line(".")
        let l:line = getline('.')
    endwhile
  endwhile
  :w


endfunction


function! MakeTodoEntry()
  let l:filename = strftime('todo-%Y-%m-%d') . ".md"
  let l:fileLoc = s:todoDir . l:filename
  let l:todoFileExists = filereadable(expand(l:fileLoc))

  :exec "e " . l:fileLoc

  if !l:todoFileExists
    echo l:filename . " doesn't exist making entry for it"
    :call AddIndexEntry(s:todoDir . "index.md", l:filename)
    :call MakeNewTodo()
  endif

  " go to bottom since that where checkmarks are
  :normal G
endfunction

noremap <Leader>ww :exec "e " . GetWikiIndexFile()<CR>
noremap <Leader>wt :call MakeTodoEntry()<CR>
noremap <Leader>wc :bd ~/vimwiki/*<C-a><CR>
