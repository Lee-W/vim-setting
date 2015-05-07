"---------------------Vundle---------------------
set nocompatible	" not compatible with the old-fashion vi mode
filetype off		" required!

" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim/
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'


"---------------------Vundle plugin-list---------------------
" ---utility
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chusiang/vim-sdcv'
Plugin 'vimspell'

" ---file management
Plugin 'scrooloose/nerdtree'

" ---autocomplete
Plugin 'vim-scripts/L9'
Plugin 'othree/vim-autocomplpop'

" ---snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" ---git
Plugin 'airblade/vim-gitgutter'

" ---developement
Plugin 'Townk/vim-autoclose'
Plugin 'cscope.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'majutsushi/tagbar'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'rizzatti/dash.vim'

" ---syntax highlight and detection
"  overall
Plugin 'scrooloose/syntastic'
"  python
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
"  C/C++
Plugin 'Lee-W/c.vim'
Plugin 'vim-jp/cpp-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
"  Java
Plugin 'adragomir/javacomplete'
"  Web
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/vim-javascript-syntax'
Plugin 'mattn/emmet-vim'
"  Document
Plugin 'plasticboy/vim-markdown'


" ---theme
Plugin 'fugalh/desert.vim'
" Plugin 'd11wtq/tomorrow-theme-vim'
" Plugin 'tomasr/molokai'

" ---plugin not installed
" Plugin 'vimwiki'
" Plugin 'kien/ctrlp.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'lervag/vim-latex'

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

autocmd FileType make setlocal noexpandtab
"disable expandtab when editing makefile


"---------------------Encoding---------------------
set encoding=utf-8
set fileencodings=utf-8,cp950,big5

"---------------------Status line---------------------
set laststatus=2   " Always show the statusline

"---------------------folding---------------------
" set foldenable
" set foldmethod=syntax
" set foldcolumn=0
" nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')
"就可以使用空白鍵來折疊程式碼


"---------------------key binding---------------------
" 開始NERDTree
nmap <F2> :NERDTreeToggle<CR>

" 在單字上按下F3就能開啟sdcv查詢
nmap <F3> :call SearchWord()<CR>

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
" let g:syntastic_python_python_exe = 'python3'
" let g:syntastic_python_checkers=['flake8', 'py3kwarn', 'pep8']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

" --- javacomplete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java map <leader>b :call javacomplete#GoToDefinition()<CR>

" ---neocomplcache
let g:neocomplcache_enable_at_startup = 1

" ---c.vim
filetype plugin on
"disable the header when creatin a C/C++ file
let g:C_InsertFileHeader = 'no'
let g:C_CFlags = '-g -O0 -c'
let g:C_LFlags = '-g -O0'

" ---clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortBlocksOnASingleLine" : "false",
            \ "AllowShortFunctionsOnASingleLine" : "false",
            \ "AllowShortLoopsOnASingleLine" : "false",
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

" ---python-mode
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_options_max_line_length = 100
let g:pymode_rope = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pylint']
" au CompleteDone * pclose

" ---jedi-vim
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#force_py_version = 3
let g:jedi#completions_command = "<leader>a"
let g:jedi#show_call_signatures = 0
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#rename_command = "<leader>r"
" autocmd FileType python setlocal completeopt-=preview

" ---easymotion
let g:EasyMotion_leader_key = 'f'

" ---emmet-vim
autocmd filetype html,css EmmetInstall
" let g:user_emmet_install_global = 0


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

" ---開啟滑鼠
" if has('mouse')
"     set mouse=a
" endif
