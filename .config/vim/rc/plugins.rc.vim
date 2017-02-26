"for s:rcpath in split(globpath('~/.vim/rc/plugins', '*.rc.vim'), '\n')
"  echo s:rcpath
"  execute 'source' s:rcpath
"endfor


"if dein#tap('neocomplete.vim') && has('lua') "{{{
"  let g:loaded_deoplete = 1
"  let g:neocomplete#enable_at_startup = 1
"  execute 'autocmd MyAutoCmd User' 'dein#source#'.g:dein#name
"        \ 'source ~/.vim/rc/plugins/neocomplete.rc.vim'
"endif "}}}
"
"if dein#tap('neosnippet.vim') "{{{
"  execute 'autocmd MyAutoCmd User' 'dein#source#'.g:dein#name
"        \ 'source ~/.vim/rc/plugins/neosnippet.rc.vim'
"endif "}}}
"
if dein#tap('unite.vim') "{{{
  execute 'autocmd MyAutoCmd User' 'dein#source#'.g:dein#name
        \ 'source ~/.vim/rc/plugins/unite.rc.vim'
endif "}}}

if dein#tap('vim-rails.vim') "{{{
  execute 'autocmd MyAutoCmd User' 'dein#source#'.g:dein#name
        \ 'source ~/.vim/rc/plugins/vim-rails.rc.vim'
endif "}}}


