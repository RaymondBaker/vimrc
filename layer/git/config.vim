let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" Fast git keybindings
nnoremap <Leader>gs :Git status <CR>
nnoremap <Leader>ga :Git add<SPACE>
nnoremap <Leader>gc :Git commit -m '
nnoremap <Leader>gp :Git push <CR>
