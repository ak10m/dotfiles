setlocal expandtab
setlocal tabstop=2 shiftwidth=2 softtabstop=2
setlocal autoindent

if executable('html-languageserver')
  augroup LspHTML
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'html-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
        \ 'whitelist': ['html'],
        \ })
  augroup END
endif
