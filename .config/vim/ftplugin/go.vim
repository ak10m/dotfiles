setlocal noexpandtab
setlocal tabstop=4 shiftwidth=4

" if executable('gopls')
"   augroup LspGo
"     au!
"     autocmd User lsp_setup call lsp#register_server({
"         \ 'name': 'gopls',
"         \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
"         \ 'whitelist': ['go'],
"         \ 'workspace_config': {'gopls': {
"         \     'staticcheck': v:true,
"         \     'completeUnimported': v:true,
"         \     'caseSensitiveCompletion': v:true,
"         \     'usePlaceholders': v:true,
"         \     'completionDocumentation': v:true,
"         \     'watchFileChanges': v:true,
"         \     'hoverKind': 'SingleLine',
"         \   }},
"         \ })
" 
"     " autocmd FileType go setlocal omnifunc=lsp#complete
"     " autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
"     " autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
"     " autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
"     setlocal omnifunc=lsp#complete
"     nmap <buffer> gd <plug>(lsp-definition)
"     nmap <buffer> ,n <plug>(lsp-next-error)
"     nmap <buffer> ,p <plug>(lsp-previous-error)
"   augroup END
" endif
