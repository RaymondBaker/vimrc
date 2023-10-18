" Enable global syntax highlighting
"syntax on

" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green
set conceallevel=2

" Rainbow operators
let g:rainbow_active = 1
let g:rainbow_conf =
\ {
\  'guifgs': ['darkorange3', 'seagreen3', 'deepskyblue', 'darkorchid3', 'forestgreen', 'lightblue', 'hotpink', 'mistyrose1'],
\  'ctermfgs': ['darkgreen', 'cyan', 'lightgreen', 'lightred'],
\  'operators': '_[\,\+\*\-\&\^\!\.\<\>\=\|\?]_',
\  'parentheses':
\  [
\    'start=/(/ end=/)/ fold',
\    'start=/\[/ end=/\]/ fold',
\    'start=/{/ end=/}/ fold'
\  ],
\  'separately':
\  {
\    'jank':
\    {
\      'parentheses':
\      [
\        'start=/(\ze[^;]/ end=/)/ fold',
\        'start=/\[/ end=/\]/ fold',
\        'start=/{/ end=/}/ fold'
\      ],
\    },
\    'cmake': 0,
\  }
\}

" Add a hook to patch the colorscheme
function! FixColorscheme()
    if (g:colors_name == "gruvbox")
        hi Pmenu guibg=#eee8d5 guifg=#586e75 gui=none
        hi PmenuSel guibg=#859900 guifg=#586e75 gui=none
    endif
endfunction

augroup fix_colorscheme
  au!
  au ColorScheme * call FixColorscheme()
augroup END

augroup custom_todo
  au!
  au Syntax * syn match CustomTodo /\v<(TODO|XXX|TIME):/
        \ containedin=.*Comment
augroup END
hi def link CustomTodo Todo

function ToggleColors()
    if (g:colors_name == "gruvbox")
        set background=light
        silent! colorscheme PaperColor
        :AirlineTheme papercolor
    else
        set background=dark
        silent! colorscheme gruvbox
        :AirlineTheme gruvbox
    endif
endfunction


nnoremap <Leader>tc :call ToggleColors()<CR>

" Set colorscheme and trigger hook
set background=dark

let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='medium'
silent! colorscheme gruvbox
