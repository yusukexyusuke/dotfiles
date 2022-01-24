"------------------------------------
" neobundle.vim
"------------------------------------
set nocompatible " viとの互換なし
syntax on
filetype off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))

" Markdown
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" Markdown syntax
" NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'godlygeek/tabular'
" NeoBundle 'joker1007/vim-markdown-quote-syntax'
" NeoBundle 'rcmdnk/vim-markdown'

" slim
NeoBundle 'slim-template/vim-slim'

" color schema
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'

" Align : 高機能整形・桁揃えプラグイン
NeoBundle 'Align'

" ステータスラインをリッチにする
NeoBundle 'Lokaltog/vim-powerline'

" vimproc : vimから非同期実行。vimshelleで必要
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" 閉じ括弧の自動補完
NeoBundle 'Townk/vim-autoclose'

" neocomplcacheのsinpet補完
NeoBundle 'Shougo/neosnippet'

" grep.vim : 外部のgrep利用。:Grepで対話形式でgrep :Rgrepは再帰
NeoBundle 'grep.vim'

" vimの正規表現をrubyやperlの正規表現な入力でできる
NeoBundle 'eregex.vim'

" quickrun.vim : 編集中のファイルを簡単に実行できるプラグイン
NeoBundle 'thinca/vim-quickrun'

" vim-ruby : VimでRubyを扱う際の最も基本的な拡張機能
NeoBundle 'vim-ruby/vim-ruby'

" rails.vim
" NeoBundle 'tpope/vim-rails'

" NERDTree : ツリー型エクスプローラ
NeoBundle 'The-NERD-tree'

" minibufexpl.vim : タブエディタ風にバッファ管理ウィンドウを表示
" NeoBundle 'minibufexpl.vim'

" coffee script
NeoBundle 'kchmck/vim-coffee-script'

" unite.vim
NeoBundle 'Shougo/unite.vim'

" Unite.vimで最近使ったファイルを表示できるようにする
" NeoBundle 'Shougo/neomru.vim'

" vimfiler
NeoBundle 'Shougo/vimfiler'

" vimshell
NeoBundle 'Shougo/vimshell.git'

" surround.vim : テキストを括弧で囲む／削除する
NeoBundle 'tpope/vim-surround'

" zencoding-vim
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/emmet-vim'

" vim-endwise
NeoBundle 'tpope/vim-endwise'

" vim-abolish
NeoBundle 'tpope/vim-abolish'

" 絞り込み検索
NeoBundle "ctrlpvim/ctrlp.vim"

NeoBundle "posva/vim-vue"

filetype plugin indent on " Required!

" 自動保存する
NeoBundle '907th/vim-auto-save'
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Installation check.
NeoBundleCheck

"------------------------------------
" 折りたたみ
"------------------------------------
set foldmethod=syntax
let perl_fold=1
set foldlevel=100 "Don't autofold anything"

"------------------------------------
" matchit.vim
"------------------------------------
source $VIMRUNTIME/macros/matchit.vim

"------------------------------------
" Encode
"------------------------------------
set fileformats=unix,dos,mac " 改行コード
set encoding=utf-8 " デフォルトエンコーディング
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc  " ワイルドカードで表示するときに優先度を低くする拡張子

set noundofile
" set undodir=$HOME/.vim/swaps

"------------------------------------
" Basic
"------------------------------------
let mapleader="," " <Leader>キー
set scrolloff=5 " スクロール時の余白確保
set textwidth=0 " 自動で折り返しをしない
set autoread " 自動読み直し
set hidden " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start "バックスペースキーで削除できるものを指定
"set formatoptions=lmoq "テキスト整形オプション，マルチバイト系を追加
set vb t_vb= " ビープ音を鳴らさない
set browsedir=buffer " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末で止まらないようにする
set showcmd " コマンドをステータス行に表示
set showmode " 現在のモードを表示
set modelines=0 " モードラインは無効

"------------------------------------
" Show
"------------------------------------
set title " タイトルを表示する
set ruler " ルーラーを表示
set laststatus=2 " 常にステータラスラインを表示
set showmatch " 対応する括弧をハイライト
set number " 行番号表示
set list " 不可視文字表示
set listchars=tab:>-,trail:-,extends:>,precedes:<
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=red guibg=darkgray
match ZenkakuSpace /　/
"set cursorline " カーソル行をハイライト
set ttyfast " 高速ターミナル接続を行う

"------------------------------------
" Color
"------------------------------------
syntax enable " ハイライト on
" colorscheme molokai " colorscheme
colorscheme hybrid

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

"------------------------------------
" Clipboard
"------------------------------------
"set clipboard=unnamed " コピーしたものがレジスタにも入るようにする
"set clipboard=autoselect " ビジュアルモードで選択したテキストが、クリップボードに入るようにする
set clipboard+=autoselect,unnamed " clipboard

"------------------------------------
" Backup
"------------------------------------
set nobackup " バックアップなし
set noswapfile " スワップファイルを作らない

"------------------------------------
" Indentation
"------------------------------------
set autoindent " 自動でインデント
"set smartindent " 新しい行のインデントを現在行と同じ数に
"set smarttab

"------------------------------------
" Markdown
" joker1007/vim-markdown-quote-syntaxをインストールしてる場合は以下の設定を利用
"------------------------------------
" let g:vim_markdown_liquid=1
" let g:vim_markdown_frontmatter=1 " 1にすると先頭のYAMLブロックをきちんとYAMLとしてハイライトしてくれるのでLiquid/Octopressを使うときには 非常に便利です。
" let g:vim_markdown_math=1 " Latex的な$x=y$とかをハイライトしてくれます
" au BufRead,BufNewFile *.{txt,text} set filetype=markdown

let g:markdown_fenced_languages = [
\  'slim',
\  'zsh',
\  'coffee',
\  'css',
\  'html',
\  'erb=eruby',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'sass',
\  'xml',
\  'php'
\]

"------------------------------------
" Filetype Setting
"------------------------------------
if has("autocmd")
	autocmd FileType * set formatoptions-=ro " 改行時にコメントしない

	" expandtab = et タブ文字を空白に展開する
	" tabstop = ts ファイル内の <Tab> が対応する空白の数
	" softtabstop = sts タブキーを押したときに挿入される空白の量
	" shiftwidth = sw 自動インデントの各段階に使われる空白の数

	"autocmd FileType php        setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType php        setlocal ts=2 sts=2 sw=2 "et
	autocmd FileType c          setlocal ts=4 sw=4 noexpandtab cindent
	autocmd FileType java       setlocal ts=4 sts=4 sw=4 et
	autocmd FileType sh         setlocal ts=2 sts=2 sw=2 et
	autocmd FileType svg        setlocal ts=2 sts=2 sw=2 et
	autocmd FileType sql        setlocal ts=2 sts=2 sw=2 et
	autocmd FileType scss       setlocal ts=2 sts=2 sw=2 et
	autocmd FileType coffee     setlocal ts=2 sts=2 sw=2 et nowrap
	autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 et
	autocmd FileType html,xhtml,css,javascript,vue      setlocal ts=2 sts=2 sw=2 et nowrap

	autocmd BufNewFile,BufRead *.html  setlocal ft=xhtml
	autocmd BufNewFile,BufRead *.scss  setlocal ft=scss
	autocmd BufRead,BufNewFile *.coffee setlocal ft=coffee
	autocmd BufNewFile,BufRead *.sass  setfiletype sass

	" for rails
	autocmd BufNewFile,BufRead app/*/*.erb    setlocal ft=eruby fenc=utf-8
	autocmd BufNewFile,BufRead app/**/*.rb    setlocal ft=ruby  fenc=utf-8
	autocmd BufNewFile,BufRead app/**/*.yml   setlocal ft=ruby  fenc=utf-8
	autocmd BufNewFile,BufRead *.cap          setlocal ft=ruby  fenc=utf-8
	autocmd FileType ruby,slim,haml,eruby,sass,mason setlocal ts=2 sts=2 sw=2 et nowrap

	" for Cake PHP
	autocmd BufNewFile,BufRead *.ctp set filetype=php

	" for Node.js
	autocmd BufNewFile,BufRead *.ejs set filetype=javascript

	" for markdown
	autocmd BufNewFile,BufRead .{md,mdwn,mkd,mkdn,mark} set filetype=markdown
	autocmd FileType markdown hi! def link markdownItalic LineNr
	autocmd FileType markdown       setlocal ts=2 sts=2 sw=2 et
	nnoremap <silent> <C-o> :PrevimOpen<CR> " Ctrl-pでプレビュー
	set syntax=markdown " markdownのハイライトを有効にする
	" let g:previm_open_cmd = 'open -a Chrome'

	" for coffeescript
	autocmd FileType coffee setlocal nowrap
	"autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
endif


"------------------------------------
" Search
"------------------------------------
set incsearch " インクリメンタルサーチ
" set ignorecase " 大文字小文字無視
set smartcase " 大文字は区別する
set hlsearch " 検索文字をハイライト
nmap \q :nohlsearch<CR>
nnoremap <silent> <ESC><ESC> :noh<CR>

"------------------------------------
" Complete
"------------------------------------
set wildmenu " コマンド補完を強化
set wildchar=<tab> " コマンド補完開始キー
set wildmode=list:longest " リスト表示
set history=1000 " コマンド・検索パターン履歴数
"set complete+=k " 補完に辞書ファイル追加

"------------------------------------
" Buffer
"------------------------------------
noremap <Space> :bn!<CR>
noremap <S-Space> :bp!<CR>
:com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn " ウィンドウレイアウトを崩さないでバッファを閉じる

"------------------------------------
" Window
"------------------------------------
" nnoremap sh <C-w>h
" nnoremap sj <C-w>j
" nnoremap sk <C-w>k
" nnoremap sl <C-w>l
" nnoremap sH <C-w>H
" nnoremap sJ <C-w>J
" nnoremap sK <C-w>K
" nnoremap sL <C-w>L
nnoremap <C-a>h <C-w>h
nnoremap <C-a>j <C-w>j
nnoremap <C-a>k <C-w>k
nnoremap <C-a>l <C-w>l

" height
nnoremap + <C-w>+
nnoremap - <C-w>-
" width
nnoremap ) <C-w>>
nnoremap ( <C-w><LT>

"------------------------------------
" Other
"------------------------------------
nnoremap <silent><Space>j :Explore<CR> " ファイラー起動

" .vimrcや.gvimrcを編集するためのKey-mappingを定義する
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" insert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>
" インサートモードでもhjklで移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" インサートモードのjjでEsc
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> <esc>

map ap "0p

" 0, 9で行頭、行末へ
nmap 0 ^
nmap 9 $

" ビジュアルモード時vで行末まで選択
vnoremap v $h

" 保存時に行末の空白を除去する
function! s:remove_dust()
    let cursor = getpos(".")
    %s/\s\+$//ge " 保存時に行末の空白を除去する
    %s/\t/  /ge " 保存時にtabを2スペースに変換する
    call setpos(".", cursor)
    unlet cursor
endfunction
" autocmd BufWritePre * call <SID>remove_dust()

"------------------------------------
" php setting
"------------------------------------
let php_sql_query = 1 " SQLをハイライトする
let php_htmlInStrings = 1 " HTMLをハイライト
let php_noShortTags = 1 " ショートタグ「< ?」はハイライトしないようにする
"let php_folding = 1 " クラスと関数の折りたたむ

"------------------------------------
" Align
"------------------------------------
" Alignを日本語環境で使用するための設定
let g:Align_xstrlen = 3

"------------------------------------
" NERDTree
"------------------------------------
nnoremap <Leader>e :NERDTreeToggle<CR>

"------------------------------------
" neosnippet
"------------------------------------
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

" ------------------------------------
" grep.vim
"------------------------------------
" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git'
let Grep_Skip_Files = '*.bak *~'

"------------------------------------
" MiniBufExplorer
"------------------------------------
" 表示トグル
" nnoremap <Leader>m :TMiniBufExplorer<CR>
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBuffs = 1

"------------------------------------
" quickrun.vim
"------------------------------------
" 初期化
let g:quickrun_config = {}
" runnerにvimprocを設定
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config._ = {'runner/vimproc/updatetime' : 100}
" 横分割をするようにする
let g:quickrun_config={'*': {'split': ''}}
" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする

set splitbelow
set splitright

" PHPUnit
augroup PHPUnitQuickRun
  autocmd!
  autocmd BufWinEnter,BufNewFile *test.php set filetype=phpunit
augroup END

let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter/buffer/split'] = 'vertical 35'
let g:quickrun_config['phpunit']['command'] = 'phpunit'
let g:quickrun_config['phpunit']['cmdopt'] = ''
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'
let g:quickrun_config['phpunit']['output_filetype'] = 'phpunit-result'

" RSpec
let g:quickrun_config['rspec'] = {}
let g:quickrun_config['rspec']['outputter/buffer/split'] = 'vertical 35'
"let g:quickrun_config['rspec']['output_filetype'] = 'rspec-result'

" bundleを利用する設定(railsで実行)
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': 'bundle exec %c %s',
  \ 'outputter/buffer/filetype': 'rspec-result'
  \}

" 通常の設定(rubyで実行)
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': '%c %s',
  \ 'outputter/buffer/filetype': 'rspec-result'
  \}

function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

" CoffeeScript
"let g:quickrun_config.coffee = {'command': 'coffee'}

" reference
" http://subtech.g.hatena.ne.jp/cho45/20061010/1160459376
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
"
" need 'set enc=utf-8' and
" below shell environment variable for UTF-8 characters
" export __CF_USER_TEXT_ENCODING='0x1F5:0x08000100:14'
"
" Vim(Mac)
if has('mac') && !has('gui')
    nnoremap <silent> <Space>y :.w !pbcopy<CR><CR>
    vnoremap <silent> <Space>y :w !pbcopy<CR><CR>
    nnoremap <silent> <Space>p :r !pbpaste<CR>
    vnoremap <silent> <Space>p :r !pbpaste<CR>
" GVim(Mac & Win)
else
    noremap <Space>y "+y
    noremap <Space>p "+p
endif

"------------------------------------
" unite.vim
"------------------------------------
" The prefix key.
" <Nop>は割当をなくす
nnoremap    [unite]   <Nop>
" nmap    <Leader>f [unite]
nmap    <Space>u [unite]

" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" 最近使ったファイルの一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" 最近使ったファイルとバッファ
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 全部
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"------------------------------------
" copypath
"------------------------------------
function CopyPath()
    let @*=expand('%:p')
endfunction

function CopyFileName()
    let @*=expand('%:t')
endfunction

command! -nargs=0 CopyPath     call CopyPath()
command! -nargs=0 CopyFileName call CopyFileName()

nnoremap <silent>cp :CopyPath<CR>
nnoremap <silent>cf :CopyFileName<CR>

"------------------------------------
" zen-conding 
"------------------------------------
let g:user_emmet_leader_key='mm'
" }}}


" Shougo/vimfiler {{{
let g:vimfiler_as_default_explorer = 1
" セーフモードの設定
let g:vimfiler_safe_mode_by_default = 0
" VimFiler を起動
nnoremap <Space>f :<C-u>VimFiler<CR>
" 現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>f :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
" }}} / Shougo/vimfiler

" ノーマルモード時だけ ; と : を入れ替える
" nnoremap ; :
" nnoremap : ;
