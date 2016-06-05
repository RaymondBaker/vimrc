function! Init_lisp()
  " Disable paredit
  let g:paredit_mode = 0
  let g:paredit_electric_return = 0

  " Run sbcl from slimv
  let g:slimv_swank_cmd = '! urxvt -e sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp &'
endfunction!
call SubscribeInit("lisp", "Init_lisp")
