" -------------------------------------------------------------------------
" Display
" -------------------------------------------------------------------------
" 行番号を表示する
set number
" タブ文字、行末など不可視文字を表示する
set list
" listで表示される文字のフォーマットを指定する
set listchars=tab:»\ ,trail:-,extends:>,precedes:<,nbsp:%
" ファイル内の <Tab> が対応する空白の数
set tabstop=2
" シフト移動幅
set shiftwidth=2
" 入力中のコマンドをステータスに表示する
set showcmd
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 対応する括弧に < > を追加する
set matchpairs& matchpairs+=<:>
" 検索結果文字列のハイライトを有効にする
set hlsearch
"カーソル行の強調表示
set cursorline
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

