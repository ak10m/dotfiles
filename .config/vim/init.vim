"---------------------------------------------------------------------------
" ak10m's vimrc
"---------------------------------------------------------------------------

if !&compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

"---------------------------------------------------------------------------
" RC
"---------------------------------------------------------------------------

let s:vim_rc_dir = resolve(expand('<sfile>:p:h') . '/rc')

function! s:rc(name) abort "{{{
  let rcpath = s:vim_rc_dir . '/' . a:name . '.rc.vim'
  execute 'source' fnameescape(rcpath)
endfunction"}}}


call s:rc('os')
call s:rc('xdg')

call s:rc('dein')
call s:rc('plugins')

call s:rc('encoding')
call s:rc('filetype')
call s:rc('display')
call s:rc('edit')
call s:rc('search')
call s:rc('mapping')


"---------------------------------------------------------------------------
" Theme
"---------------------------------------------------------------------------

if has("syntax")
  syntax on
  set background=dark
  "colorschem dracula
  "colorschem hybrid
  "colorschem railscasts
  "colorschem molokai
  "colorschem solarized
endif
