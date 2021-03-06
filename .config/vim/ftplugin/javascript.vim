setlocal expandtab
setlocal tabstop=2 shiftwidth=2 softtabstop=2
setlocal autoindent

if executable('typescript-language-server')
  augroup LspJavascript
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'javascript support using typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
        \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact'],
        \ })
  augroup END
endif
