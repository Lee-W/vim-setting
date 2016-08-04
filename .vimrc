" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"---------------------vim-plug
call plug#begin('~/.vim/plugged')

" ---utility
Plug 'Lokaltog/vim-easymotion'
Plug 'vimspell', {'for': ['txt', 'md', 'tex']}
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-repeat'

" ---file management
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" ---autocomplete
Plug 'vim-scripts/L9'
Plug 'othree/vim-autocomplpop'

" ---snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" ---git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ---developement
Plug 'Townk/vim-autoclose'
Plug 'cscope.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'fweep/vim-tabber'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'

" ---syntax highlight and detection
"  overall
Plug 'scrooloose/syntastic'
"  python
Plug 'klen/python-mode', {'for': ['python']}
Plug 'davidhalter/jedi-vim', {'for': ['python']}
Plug 'jmcomets/vim-pony/'
Plug 'lepture/vim-jinja'
Plug 'Glench/Vim-Jinja2-Syntax'
"  C/C++
Plug 'Lee-W/c.vim', {'for' : ['cpp', 'c'] }
Plug 'vim-jp/cpp-vim', {'for': ['cpp']}
Plug 'rhysd/vim-clang-format', {'for': ['cpp', 'c']}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp']}
"  Web
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mattn/emmet-vim'
" octave
Plug 'octave.vim'

" ---theme
Plug 'fugalh/desert.vim'
" Plug 'd11wtq/tomorrow-theme-vim'
" Plug 'tomasr/molokai'

" ---plugin not installed
" Plug 'itchyny/lightline.vim'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'chusiang/vim-sdcv'
" Plug 'lervag/vim-latex'
"
call plug#end()


"---------------------General setting---------------------
syntax on					"syntax highlight
set nu                      "顯示行號
set cursorline              "顯示目前的游標位置
set bg=dark                 "顯示不同的底色色調
set ruler                   "顯示最後一行的狀態
set hlsearch                "設定高亮度顯示搜尋結果
set confirm                 "操作過程有衝突時，以明確的文字來詢問
set history=50              "保留 50 個使用過的指令
set t_Co=256                "Explicitly tell Vim that the terminal supports 256 colors

set autoindent				"自動縮排
set cindent                 "設置C/C++方式自動對齊
set smartindent             "設定 smartindent
set shiftwidth=4			"設定縮排寬度 = 4
set backspace=2				"可隨時用倒退鍵刪除
set tabstop=4               "設置Tab寬度
set softtabstop=4           "設置按退格鍵時可以一次刪除4個空格
set smarttab                "根據檔案中其他地方的空格來判斷一個tab是多少個空格
set expandtab               "將Tab鍵自動轉換成空格,真正需要Tab鍵時使用[Ctrl + V + Tab]
set incsearch               "搜尋時立即跳到符合的pattern

" Set up tab autocomplete in ex mode
set wildmenu
set wildmode=full

" disable expandtab when editing makefile
autocmd FileType make setlocal noexpandtab

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm setlocal ts=2 sts=2 sw=2

"---------------------split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"---------------------Encoding---------------------
set encoding=utf-8
set fileencodings=utf-8,cp950,big5

"---------------------Status line---------------------
set laststatus=2   " Always show the statusline

"---------------------key binding---------------------
" 開始NERDTree
nmap <F2> :NERDTreeToggle<CR>

" 開啟spell checking
nmap <F7> :setlocal spell!<cr>

" 關閉syntax偵錯
nmap <F8> :SyntasticToggleMode<CR>

" 開啟tagbar
nmap <F10> :TagbarToggle<CR>

" comment lines
map ` :TComment<cr>
vmap ` :TComment<cr>gv


"---------------------plug-in setting---------------------
" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column "

" ---vim-spell
set spelllang=en
autocmd BufRead *.txt,*.md,*.tex setlocal spell

" ---Syntastic
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["python"] }
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc+'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_html_tidy_ignore_errors = ['trimming empty <']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" --- rainbow
let g:rainbow_active = 1
   let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['red', 'lightblue', 'lightyellow', 'green', 'darkmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/',
    \                           'start=/\[/ end=/\]/',
    \                           'start=/{/ end=/}/ fold',
    \                           'start=/(/ end=/)/ containedin=vimFuncBody',
    \                           'start=/\[/ end=/\]/ containedin=vimFuncBody',
    \                           'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" ---UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ---c.vim
filetype plugin on
"disable the header when creatin a C/C++ file
let g:C_InsertFileHeader = 'no'
let g:C_CFlags = '-g -O0 -c'
let g:C_LFlags = '-g -O0'

" ---clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortLoopsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

" ---python-mode
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_options_max_line_length = 119
let g:pymode_rope = 0
let g:pymode_lint_checkers = ['pyflakes', 'pylint', 'pep8']
let g:pymode_lint_ignore = "C0111, W0621, E501"
" au CompleteDone * pclose

" ---jedi-vim
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
let g:jedi#force_py_version = 3
let g:jedi#completions_command = "<leader>a"
" let g:jedi#show_call_signatures = 0
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#rename_command = "<leader>r"
" autocmd FileType python setlocal completeopt-=preview

" ---easymotion
let g:EasyMotion_leader_key = 'f'

" ---emmet-vim
autocmd filetype html,css,htmlm4 EmmetInstall
" let g:user_emmet_install_global = 0

" ---tabber
set tabline=%!tabber#TabLine()

" ---javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jquery'

" ---theme
colorscheme desert
" colorscheme Tomorrow-Night-Eighties
" colorscheme molokai

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

" ---回到上次編輯的地方
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
endif

" git commit
autocmd Filetype gitcommit setlocal spell textwidth=72
