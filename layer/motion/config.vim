" Number formats, for incrementing
set nrformats=octal,hex

" Use a short timeout for incomplete mappings
set ttimeout
set ttimeoutlen=100

" Highlight the current line
set cursorline

" Ignore full page jumps, since I accidentally hit it when wanting C-v.
nnoremap <C-b> <Nop>

" Go to file in a new tab
nnoremap gF <C-W>gF

" Delete lines without adding them to the yank stack
nnoremap ,d "_d
vnoremap ,d "_d

" Paste from the yank buffer
nnoremap ,p "0p
vnoremap ,p "0p
nnoremap ,P "0P
vnoremap ,P "0P

nnoremap Y y$

" Delete comment character(s) when joining commented lines
set formatoptions+=j

" Move between tabs
nnoremap <silent> <F1> :bprev!<CR>
nnoremap <silent> <F2> :bnext!<CR>
inoremap <silent> <F1> <ESC>:bprev!<CR>
inoremap <silent> <F2> <ESC>:bnext!<CR>

nnoremap <silent> <F3> :buffers<CR>:buffer<SPACE>
inoremap <silent> <F3> :buffers<CR>:buffer<SPACE>

" Move based on display lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
