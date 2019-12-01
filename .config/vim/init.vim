if !&compatible
  set nocompatible
endif

let s:rc_dir = resolve(expand('<sfile>:p:h') . '/rc')

function! s:rc(name) abort
  let l:rc_file = s:rc_dir . '/' . a:name . '.rc.vim'
  execute 'source' fnameescape(rc_file)
endfunction

call s:rc('xdg')
call s:rc('encoding')
call s:rc('display')
call s:rc('edit')
call s:rc('search')
call s:rc('mapping')
call s:rc('dein')
call s:rc('theme')
