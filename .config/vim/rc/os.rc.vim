"---------------------------------------------------------------------------
" OS
"---------------------------------------------------------------------------

let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim') ||
      \   (!executable('xdg-open') && system('uname') =~? '^darwin'))

function! IsWindows() abort
  return s:is_windows
endfunction

function! IsMac() abort
  return s:is_mac
endfunction

function! IsLinux() abort
  return !s:is_windows && !s:is_cygwin && !s:is_mac
endfunction
