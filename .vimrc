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
"  overall
Bundle 'scrooloose/syntastic'
"  python
Bundle 'klen/python-mode'
Bundle 'lambdalisue/vim-django-support'
Bundle 'davidhalter/jedi-vim'
"  C/C++
Bundle 'Lee-W/c.vim'
Bundle 'vim-jp/cpp-vim'
Bundle 'octol/vim-cpp-enhanced-highlight'
"  Java
Bundle 'initrc/eclim-vundle'
"  Web
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/vim-javascript-syntax'
Bundle 'mattn/emmet-vim'
"  Document
Bundle 'plasticboy/vim-markdown'
" Bundle 'lervag/vim-latex'

" ---utility
Bundle 'Lokaltog/vim-easymotion'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'chusiang/vim-sdcv'
Bundle 'vimspell'

" ---theme
Bundle 'fugalh/desert.vim'
" Bundle 'd11wtq/tomorrow-theme-vim'
" Bundle 'tomasr/molokai'

" ---plugin not installed
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
"set foldenable
"set foldmethod=syntax
"set foldcolumn=0
"nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')
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

" ---Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_python_python_exe = 'python3'
let g:syntastic_python_checkers=['flake8', 'py3kwarn', 'pep8']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" --- ctrlp
" let g:ctrlp_dont_split = 'NERD_tree_2'
" let g:ctrlp_show_hidden = 1

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

" ---python-mode
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_options_max_line_length = 100
au CompleteDone * pclose

" ---jedi-vim
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"
" autocmd FileType python setlocal completeopt-=preview

" ---easymotion
let g:EasyMotion_leader_key = 'f'

" ---vim-spell
set spelllang=en
let spell_auto_type = "txt"
autocmd BufRead *.txt,*.md,*.tex setlocal spell

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
