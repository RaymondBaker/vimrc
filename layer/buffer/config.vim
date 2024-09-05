" Don't parse modelines
set nomodeline

" Work nicely with the system clipboard
" set clipboard=unnamedplus
" Causes terminal to lose focus on laptop
"
set clipboard+=unnamedplus
" Workaround for neovim wl-clipboard interaction
" wl-copy needs to open a window and take focus to copy
" not xclip so we use that for copying
let g:clipboard = {
      \   'name': 'Override with xclip',
      \   'copy': {
      \      '+': 'xclip -sel clip',
      \      '*': 'xclip',
      \    },
      \   'paste': {
      \      '+': 'xclip -o -sel clip',
      \      '*': 'xclip -o',
      \   },
      \   'cache_enabled': 1,
      \ }

" Allow opening multiple files at once
com! -complete=file -nargs=* E silent! exec "!vim --servername " . v:servername . " --remote-tab-silent <args>"
