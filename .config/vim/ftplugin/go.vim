autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=4
autocmd FileType go setlocal shiftwidth=4

autocmd FileType go nmap <Space>gr <Plug>(go-run)
autocmd FileType go nmap <Space>gb <Plug>(go-build)
autocmd FileType go nmap <Space>gt <Plug>(go-test)
autocmd FileType go nmap <Space>gc <Plug>(go-coverage)
autocmd FileType go nmap <Space>gd <Plug>(go-doc)
autocmd FileType go nmap <Space>gi <Plug>(go-imports)
autocmd FileType go nmap <Space>gm <Plug>(go-implements)
