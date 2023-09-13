" use coc-marksman gd to follow links
":CocInstall @yaegassy/coc-marksman
nmap <buffer> <CR> gd

" Make link entry
xmap <buffer> <Leader>ml S]%a()<ESC>i
" Make reference entry
xmap <buffer> <Leader>mr S]%a[]<ESC>i
