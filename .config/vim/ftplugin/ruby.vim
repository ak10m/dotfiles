setlocal expandtab
setlocal tabstop=2 shiftwidth=2 softtabstop=2
setlocal autoindent

if executable('solargraph')
  augroup LspRuby
    au!
    " gem install solargraph
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
  augroup END
endif
