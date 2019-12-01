"---------------------------------------------------------------------------
" XDG Base Directory
"---------------------------------------------------------------------------

function! s:mkdir_p(path) abort
  if !isdirectory(a:path)
    call mkdir(a:path, "p")
  endif
endfunction

if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME = resolve(expand('$HOME/.cache'))
endif
call s:mkdir_p($XDG_CACHE_HOME)

if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME = resolve(expand('$HOME/.config'))
endif
call s:mkdir_p($XDG_CONFIG_HOME)

if empty($XDG_DATA_HOME)
  let $XDG_DATA_HOME = resolve(expand('$HOME/.local/share'))
endif
call s:mkdir_p($XDG_DATA_HOME)

call s:mkdir_p($XDG_CACHE_HOME . "/vim/swap")
set directory=$XDG_CACHE_HOME/vim/swap/

call s:mkdir_p($XDG_CACHE_HOME . "/vim/backup")
set backupdir=$XDG_CACHE_HOME/vim/backup/
" Double slash does not actually work for backupdir, here's a fix
" au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')

" see :help persistent-undo
call s:mkdir_p($XDG_CACHE_HOME . "/vim/undo")
set undodir=$XDG_CACHE_HOME/vim/undo/
set undofile

set viminfo+=n$XDG_CACHE_HOME/vim/viminfo

set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after
