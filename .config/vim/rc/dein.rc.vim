"---------------------------------------------------------------------------
" dein.vim config
"---------------------------------------------------------------------------

let g:dein#install_progress_type = 'title'
let s:cache_home      = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir        = s:cache_home . '/dein'
let s:dein_repo_dir   = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:dein_toml       = fnamemodify(expand('<sfile>'), ':h').'/../dein.toml'
let s:dein_lazy_toml  = fnamemodify(expand('<sfile>'), ':h').'/../dein_lazy.toml'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(expand(s:dein_repo_dir))
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  "set runtimepath^=fnamemodify(expand(s:dein_repo_dir), ':h')
  let &runtimepath = s:dein_repo_dir .",". &runtimepath
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:dein_toml,      { 'lazy': 0 })
  call dein#load_toml(s:dein_lazy_toml, { 'lazy': 1 })
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
