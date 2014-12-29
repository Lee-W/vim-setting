"---------------------Vundle---------------------
set nocompatible	" not compatible with the old-fashion vi mode
filetype off		" required!

" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'


"---------------------Vundle plugin-list---------------------
" ---file management
Bundle 'scrooloose/nerdtree'

" ---autocomplete
Bundle 'vim-scripts/L9'
Bundle 'othree/vim-autocomplpop'

" ---snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

" ---git
Bundle 'airblade/vim-gitgutter'

" ---developement
Bundle 'Townk/vim-autoclose'
Bundle 'cscope.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'bling/vim-airline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'majutsushi/tagbar'
Bundle 'michaeljsmith/vim-indent-object'

" ---syntax highlight and detection
Bundle 'Lee-W/c.vim'
Bundle 'vim-jp/cpp-vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/vim-javascript-syntax'
Bundle 'scrooloose/syntastic'
Bundle 'klen/python-mode'
Bundle 'lambdalisue/vim-django-support'
" Bundle 'hdima/python-syntax'
" Bundle 'pythoncomplete'
" Bundle 'kevinw/pyflakes'

" ---tool
Bundle 'terryma/vim-multiple-cursors'
Bundle 'chusiang/vim-sdcv'

" ---theme
" Bundle 'd11wtq/tomorrow-theme-vim'
" Bundle 'tomasr/molokai'
Bundle 'fugalh/desert.vim'

" ---plugin not installed
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'vimwiki'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'kien/ctrlp.vim'
" Bundle 'tpope/vim-fugitive'

"---------------------General setting---------------------
syntax on					"syntax highlight
set nu                      "顯示行號
set cursorline              "顯示目前的游標位置
set bg=dark                 "顯示不同的底色色調
set ruler                   "顯示最後一行的狀態
set hlsearch                "設定高亮度顯示搜尋結果
set confirm                 "操作過程有衝突時，以明確的文字來詢問
set history=50              "保留 100 個使用過的指令
set t_Co=256                " Explicitly tell Vim that the terminal supports 256 colors

set autoindent				"自動縮排
set cindent                 "設置C/C++方式自動對齊
set smartindent             "設定 smartindent
set shiftwidth=4			"設定縮排寬度 = 4
set backspace=2				"可隨時用倒退鍵刪除
set tabstop=4               "設置Tab寬度
set softtabstop=4           "設置按退格鍵時可以一次刪除4個空格
set smarttab                "根據檔案中其他地方的空格來判斷一個tab是多少個空格
set expandtab               "將Tab鍵自動轉換成空格,真正需要Tab鍵時使用[Ctrl + V + Tab]
autocmd FileType make setlocal noexpandtab
"not to use expandtab when editing makefile


"---------------------Encoding---------------------
set encoding=utf-8
set fileencodings=utf-8,cp950

"---------------------Status line---------------------
set laststatus=2   " Always show the statusline

"---------------------folding---------------------
"set foldenable
"set foldmethod=syntax
"set foldcolumn=0
"nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')
"就可以使用空白鍵來折疊程式碼


"---------------------key binding---------------------
" 開始NERDTree
nmap <F2> :NERDTreeToggle<CR>
" 在單字上按下F2就能開啟sdcv查詢
nmap <F3> :call SearchWord()<CR>
" 關閉syntax偵錯
nmap <F8> :SyntasticToggleMode<CR>
" 開啟tagbar
autocmd Filetype python nnoremap <F9> :w<CR> :!python3 % <CR>
autocmd Filetype cs nnoremap <F9> :w <CR> :!gmcs % -pkg:dotnet <CR>

nmap <F10> :TagbarToggle<CR>

" comment lines with cmd+/
map ` :TComment<cr>
vmap ` :TComment<cr>gv


"---------------------plug-in setting---------------------
" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column "

" ---Stntastic
let g:syntastic_check_on_open = 0
let g:syntastic_python_python_exe = 'python3'
let g:syntastic_python_checkers=['flake8', 'py3kwarn']

" ---python-syntax
let python_highlight_all = 1

" --- ctrlp
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_show_hidden = 1

" --- vim-markdown
let g:vim_markdown_folding_disabled=1       "disable folding
let g:vim_markdown_initial_foldlevel=1     "set the initial foldlevel

" --- rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare

" ---neocomplcache
let g:neocomplcache_enable_at_startup = 1

" ---c.vim
filetype plugin on
"disable the header when creatin a C/C++ file
let g:C_InsertFileHeader = 'no'
let g:C_CFlags = '-g -O0 -c'
let g:C_LFlags = '-g -O0'

" ---vim-javascript-sng/vim-airline
au FileType javascript call JavaScriptFold()

" ---python-mode

let g:pymode_python = 'python3'
let g:pymode_motion = 1
let g:pymode_options_max_line_length = 80 
let g:pymode_rope = 0


" ---theme
" colorscheme Tomorrow-Night-Eighties
" colorscheme molokai
colorscheme desert

"---------------------other---------------------
" ---set paste
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
