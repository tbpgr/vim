"カーソルが何行目の何列目に置かれているかを表示する
set ruler
"OSのクリップボードを使用する
set clipboard=unnamed
"タブ文字表示
set list
"listで表示される文字のフォーマットを指定
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
"行番号を表示する
set number
"検索文字の強調表示
set hlsearch
"インクリメンタルサーチ
set incsearch
" 強調表示（色）on or off
syntax on
" タブをスペースに変換
set expandtab
" タブ幅を2に設定
set tabstop=2
" インデント時の幅
set shiftwidth=2
" タブ入力時のタブ幅
set softtabstop=2
" 入力コマンドの表示
set showcmd
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" ステータスラインを表示
" 2に設定するといつでも表示
set laststatus=2


"全角スペース・行末のスペース・タブの可視化
if has("syntax")
    syntax on
 
    " PODバグ対策
    syn sync fromstart
 
    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction
 
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif
