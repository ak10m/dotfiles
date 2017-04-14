" -------------------------------------------------------------------------
" Edit
" -------------------------------------------------------------------------
" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
" クリップボードをWindowsと連携
set clipboard=unnamed
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" バックスペースをWindowsのように使う
set backspace=2
" タブの代わりに空白文字を挿入する
set expandtab
" 新しい行のインデントを現在行と同じにする
set autoindent
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 入力モードで自動的に日本語入力を使わない
set iminsert=0
" 2バイト文字の表示
set ambiwidth=double
" バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin で発動します）
augroup BinaryXXD
    autocmd!
    autocmd BufReadPre  *.bin let &binary =1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END
