" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')


" ---utility
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/vimspell', {'for': ['txt', 'md', 'tex']}
Plug 'liangfeng/TaskList.vim'
Plug 'majutsushi/tagbar'
Plug 'fweep/vim-tabber'
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'

" ---file management
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" ---autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  let g:deoplete#enable_at_startup = 1
else
  Plug 'vim-scripts/L9'
  Plug 'othree/vim-autocomplpop'
endif

" ---snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" ---git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'

" ---syntax highlight and detection
" overall
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
" python
Plug 'python-mode/python-mode', {'for': ['python'], 'branch': 'develop'}
Plug 'mitsuhiko/vim-python-combined', {'for': ['python']}
Plug 'psf/black', {'for': ['python'], 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1'}
Plug 'fisadev/vim-isort', {'for': ['python']}
Plug 'Glench/Vim-Jinja2-Syntax', {'for': ['*.html', '*.htm', '*.j2', '*.jinja']}
Plug 'tshirtman/vim-cython', {'for': ['pyx']}
" C/C++
Plug 'Lee-W/c.vim', {'for' : ['cpp', 'c'] }
Plug 'vim-jp/cpp-vim', {'for': ['cpp']}
Plug 'rhysd/vim-clang-format', {'for': ['cpp', 'c']}
" Web
Plug 'othree/html5.vim', {'for': ['*.html', '*.htm']}
Plug 'mattn/emmet-vim', {'for': ['*.html', '*.htm', 'css']}
Plug 'othree/yajs.vim', {'for': ['javascript']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript']}
Plug 'nono/vim-handlebars', {'for': ['*.html', '*.htm', '*.hbs', '*.handlebars']}
Plug 'elzr/vim-json', {'for': ['*.json']}
" YAML
Plug 'stephpy/vim-yaml', {'for': ['*.yml']}
" toml
Plug 'cespare/vim-toml', {'for': ['*.toml']}
" markdown
Plug 'godlygeek/tabular', {'for': ['*.md']}
Plug 'plasticboy/vim-markdown', {'for': ['*.md']}

" ---theme
Plug 'fugalh/desert.vim'
Plug 'ryanoasis/vim-devicons'

" ---plugin not installed
" Plug 'scrooloose/syntastic'
" Plug 'vim-scripts/cscope.vim'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'chusiang/vim-sdcv'
" Plug 'lepture/vim-jinja', {'for': ['*.html', '*.htm', '*.j2', '*.jinja']}

call plug#end()


"---------------------General setting---------------------
syntax on					" syntax highlight
set nu                      " 顯示行號
set cursorline              " 顯示目前的游標位置
set bg=dark                 " 顯示不同的底色色調
set ruler                   " 顯示最後一行的狀態
set hlsearch                " 設定高亮度顯示搜尋結果
set incsearch               " 搜尋時立即跳到符合的pattern
set confirm                 " 操作過程有衝突時，以明確的文字來詢問
set history=30              " 保留 30 個使用過的指令
set t_Co=256                " Explicitly tell Vim that the terminal supports 256 colors
set laststatus=2            " Always show the statusline

set autoindent
set cindent
set smartindent
set shiftwidth=4			" 設定縮排寬度 = 4
set backspace=2				" 可隨時用倒退鍵刪除
set tabstop=4               " 設置Tab寬度
set softtabstop=4           " 設置按退格鍵時可以一次刪除4個空格
set smarttab                " 根據檔案中其他地方的空格來判斷一個tab是多少個空格
set expandtab               " 將Tab鍵自動轉換成空格,真正需要Tab鍵時使用[Ctrl + V + Tab]

" Encoding
set encoding=utf-8
set fileencodings=utf-8,cp950,big5

" Set up tab autocomplete in ex mode
set wildmenu
set wildmode=full

" disable expandtab when editing makefile
autocmd FileType make setlocal noexpandtab

autocmd Filetype html,javascript setlocal ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.html,*.hbs,*.handlebars setlocal filetype=html.jinja ts=2 sts=2 sw=2
autocmd FileType python setlocal omnifunc=python3complete#Complete

"---------------------split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-H> <C-W><C-H>

"---------------------key binding---------------------
" 開始NERDTree
nmap <F2> :NERDTreeToggle<CR>

" 開啟spell checking
nmap <F7> :setlocal spell!<CR>

" Toggle ALE
nmap <F8> :ALEToggle<CR>

" 開啟TaskList
nmap <F9> :ToggleTaskList<CR>

" 開啟tagbar
nmap <F10> :TagbarToggle<CR>

" comment lines
map ` :TComment<CR>
vmap ` :TComment<CR>gv

nmap <C-S-F> :Ag<CR>
inoremap jj <esc>


"---------------------plug-in setting---------------------
" ---vim-spell
set spelllang=en

" ---easymotion
let g:EasyMotion_leader_key = 'f'

" ---tabber
set tabline=%!tabber#TabLine()

" ---TaskList
let g:tlTokenList = ["FIXME", "TODO", "XXX"]

" ---airline
let g:airline_powerline_fonts = 1

" ---fzf
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

nmap <C-P> :FZF<CR>
nmap ; :Buffers<CR>

let g:fzf_buffers_jump = 1

" ---rainbow
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

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column "

" ---ultisnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ---ale
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_python_flake8_options = "--ignore=W503,E501,F632,E203 --max-line-length=88"
let g:ale_python_mypy_options = "--ignore-missing-imports"
let g:ale_python_auto_pipenv = 1
let g:ale_yaml_yamllint_options = "-d relaxed"

" ---python-mode
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_rope = 0
let g:pymode_folding = 1
let g:pymode_options_max_line_length = 88
let g:pymode_lint_sort = ['E', 'W', 'C', 'R', 'I', 'F']

" ---black
autocmd FileType python setlocal completeopt-=preview

" ---c.vim
filetype plugin on
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


" ---vim-polyglot
let g:polyglot_disabled = ['python', 'pyton-compiler']

" ---javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jquery'

" --- vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" ---theme
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

" ---回到上次編輯的地方
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
endif

" git commit max length
autocmd Filetype gitcommit setlocal spell textwidth=80
