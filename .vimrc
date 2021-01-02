" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Plugin Installation

" ----utility
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/vimspell', {'for': ['txt', 'md', 'tex']}
Plug 'majutsushi/tagbar'
Plug 'fweep/vim-tabber'
Plug 'liangfeng/TaskList.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-expand-region'

" ----file management
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" ----autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'zchee/deoplete-jedi'
  let g:deoplete#enable_at_startup = 1
else
  Plug 'vim-scripts/L9'
  Plug 'othree/vim-autocomplpop'
endif

" ----snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" ----test
Plug 'vim-test/vim-test'

" ---git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'

" ----syntax highlight and detection
" --------overall
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
" --------python
Plug 'python-mode/python-mode', {'for': ['python'], 'branch': 'develop'}
Plug 'mitsuhiko/vim-python-combined', {'for': ['python']}
Plug 'psf/black', {'for': ['python'], 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1'}
Plug 'fisadev/vim-isort', {'for': ['python']}
Plug 'Glench/Vim-Jinja2-Syntax', {'for': ['html', '*.j2', '*.jinja']}
Plug 'tshirtman/vim-cython', {'for': ['*.pyx']}
" --------C/C++
Plug 'Lee-W/c.vim', {'for' : ['cpp', 'c'] }
Plug 'vim-jp/cpp-vim', {'for': ['cpp']}
Plug 'rhysd/vim-clang-format', {'for': ['cpp', 'c']}
" --------Web
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
Plug 'othree/yajs.vim', {'for': ['javascript']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript']}
Plug 'nono/vim-handlebars', {'for': ['html', '*.hbs', '*.handlebars']}
Plug 'elzr/vim-json', {'for': ['json']}
" --------YAML
Plug 'stephpy/vim-yaml', {'for': ['yaml']}
" --------toml
Plug 'cespare/vim-toml', {'for': ['*.toml']}
" --------markdown
Plug 'godlygeek/tabular', {'for': ['markdown']}
Plug 'plasticboy/vim-markdown', {'for': ['markdown']}

" ----theme
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" ----plugin not installed
" Plug 'chusiang/vim-sdcv'
" Plug 'lepture/vim-jinja', {'for': ['html', '*.j2', '*.jinja']}

call plug#end()


" General setting
syntax on					" syntax highlight
set nu                      " show line number
set cursorline              " show the location of cursor
set background=dark
set ruler
set hlsearch                " highlight serach reslt
set incsearch               " jump to the matching string when typing
set confirm
set history=30              " keep the latest 30 used commands
set t_Co=256                " Explicitly tell Vim that the terminal supports 256 colors
set laststatus=2            " always show the statusline

set autoindent
set cindent
set smartindent
set shiftwidth=4
set backspace=2
set tabstop=4
set softtabstop=4
set smarttab
set expandtab               " covert tab to space, you can use [Ctrl + V + Tab] if tab is needed

" ----Encoding
set encoding=utf-8
set fileencodings=utf-8,cp950,big5

" ----Set up tab autocomplete in ex mode
set wildmenu
set wildmode=full

" ----disable expandtab when editing makefile
autocmd FileType make setlocal noexpandtab

" ----file type specific setting
autocmd Filetype html,javascript setlocal ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead html,*.hbs,*.handlebars setlocal filetype=html.jinja ts=2 sts=2 sw=2
autocmd FileType python setlocal omnifunc=python3complete#Complete

" ----split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-H> <C-W><C-H>

" key binding
" ----toggle NERDTree
nmap <F2> :NERDTreeToggle<CR>

" ----toggl TaskList
nmap <F3> :ToggleTaskList<CR>

" ----toggle spell checking
nmap <F7> :setlocal spell!<CR>

" ----toggle ALE
nmap <F8> :ALEToggle<CR>

" ----toogle tagbar
nmap <F10> :TagbarToggle<CR>

" ----tcomment
map ` :TComment<CR>
vmap ` :TComment<CR>gv

" ----vim-test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" ---ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ----other bindings
nmap <C-S-F> :Ag<CR>
inoremap jj <esc>

" plug-in setting

" ----utility

" --------easymotion
let g:EasyMotion_leader_key = 'f'

" --------fzf
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

nmap <C-P> :FZF<CR>
nmap ; :Buffers<CR>

let g:fzf_buffers_jump = 1

" --------vim-spell
set spelllang=en

" --------tabber
set tabline=%!tabber#TabLine()

" --------TaskList
let g:tlTokenList = ["FIXME", "TODO", "XXX"]

" --------airline
let g:airline_powerline_fonts = 1

" ----file management
" --------nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']  "ignore files in NERDTree
let NERDTreeShowHidden=1

" ----snippets
" --------ultisnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ----git
" --------vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column "

" ----syntax highlight and detection
" --------ale
let g:ale_linters = {
\   "python": ["flake8", "mypy", "bandit"],
\}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = "never"
let g:ale_linters_explicit = 1
let g:ale_python_bandit_options = "-iii -lll -s=B322"
let g:ale_python_flake8_options = "--ignore=W503,E501,F632,E203 --max-line-length=88"
let g:ale_python_mypy_options = "--ignore-missing-imports"
let g:ale_python_auto_pipenv = 1
let g:ale_yaml_yamllint_options = "-d relaxed"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 6

" --------python-mode
let g:pymode_python = "python3"
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_folding = 1
let g:pymode_options_max_line_length = 88
" let g:pymode_lint_sort = ['E', 'W', 'C', 'R', 'I', 'F']

" --------black
autocmd FileType python setlocal completeopt-=preview

" --------vim-isort
let g:vim_isort_config_overrides = {
    \ "profile": "black",
\ }
let g:vim_isort_python_version = 'python3'

" --------c.vim
filetype plugin on
let g:C_InsertFileHeader = 'no'
let g:C_CFlags = '-g -O0 -c'
let g:C_LFlags = '-g -O0'

" --------clang-format
let g:clang_format#style_options = {
    \ "AccessModifierOffset" : -4,
    \ "AllowShortIfStatementsOnASingleLine" : "false",
    \ "AllowShortLoopsOnASingleLine" : "false",
    \ "AlwaysBreakTemplateDeclarations" : "true",
    \ "Standard" : "C++11",
    \ "BreakBeforeBraces" : "Stroustrup"
\ }

" --------javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jquery'

" --------vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_toc_autofit = 1

" --------theme
colorscheme gruvbox
" colorscheme desert

" Other Configuration
" ----set paste
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

" ----back to the the last editing location
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
endif

" ----git commit max length
autocmd Filetype gitcommit setlocal spell textwidth=88
