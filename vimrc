" No vi compatibility
set nocompatible

let g:hostname = substitute(system('hostname'), "\n", "", "")
let g:is_nixos = system('uname -a') =~ "NixOS"
let g:lightweight = g:hostname == "nixums"
let g:python3_host_prog='/usr/bin/python3'

" Set space to nop so leader doesn't move key
nnoremap <SPACE> <Nop>
"not sure why but mapleader needs to be set here to work
let mapleader = "\<Space>"

source $HOME/.vim/layer/all-packages.vim

filetype plugin indent on
