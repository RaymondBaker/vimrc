" Enable global syntax highlighting
"syntax on

" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green
set conceallevel=2

" Rainbow operators
" TODO: find colors that work for light mode
let g:rainbow_active = 0
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

function SetTheme(theme_type)
    if (a:theme_type == "light")
        set background=light
        execute "colorscheme " . g:vim_light_theme
        if exists(":AirlineTheme")
            execute ":AirlineTheme " . g:vim_airline_theme_mapping[g:vim_light_theme]
        else
            let g:airline_theme = g:vim_airline_theme_mapping[g:vim_light_theme]
        endif
    elseif (a:theme_type == "dark")
        set background=dark
        execute "colorscheme " . g:vim_dark_theme
        if exists(":AirlineTheme")
            execute ":AirlineTheme " . g:vim_airline_theme_mapping[g:vim_dark_theme]
        else
            let g:airline_theme = g:vim_airline_theme_mapping[g:vim_dark_theme]
        endif
    else
        echoerr "SetTheme only supports light and dark as inputs"
    endif
endfunction

function ToggleColors()
    if (g:colors_name == g:vim_dark_theme)
        call SetTheme("light")
    else
        call SetTheme("dark")
    endif
endfunction


nnoremap <Leader>tc :call ToggleColors()<CR>

" Set colorscheme and trigger hook

let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='medium'

let g:vim_light_theme = "PaperColor"
let g:vim_dark_theme = "gruvbox"

let g:vim_airline_theme_mapping = {
            \g:vim_light_theme: "papercolor",
            \g:vim_dark_theme: g:vim_dark_theme,
            \}

" Default dark
let s:color_scheme = trim(system("gsettings get org.gnome.desktop.interface color-scheme"), "'\n")
if v:shell_error
    "Revert to system theme matching if this gnome doesn't support color-scheme
    let s:system_theme = trim(system("gsettings get org.gnome.desktop.interface gtk-theme"), "'\n")
    let s:system_light_themes = ["HighContrast", "Adwaita"]

    let g:theme_type = "dark"
    if index(s:system_light_themes, s:system_theme) >= 0  " If item is in the list.
        let g:theme_type = "light"
    endif
else
    if s:color_scheme == "prefer-dark"  " If item is in the list.
        let g:theme_type = "dark"
    elseif s:color_scheme == "prefer-light"  " If item is in the list.
        let g:theme_type = "light"
    elseif s:color_scheme == "default"  " If item is in the list.
        let g:theme_type = "light"
    else
        echoerr "Gnome color-scheme returned" . s:color_scheme . " we onlt support default, prefer-light and prefer-dark as inputs"
    endif
endif

call SetTheme(g:theme_type)
