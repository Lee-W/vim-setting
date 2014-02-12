#Vim

#Description
My vim plugins and settings.
The snippets directory is for saving snippets that I add.

#Installation
1. Clone this repo and copy .vimrc to home directory
        `git clone https://github.com/Lee-W/vim-setting.Git`  
        `cd vim-setting`  
        `cp .vimrc ~/`  
2. Start vi and it will automatically install `vundle` (a package management plugin for vim)  
It might display plenty of error message since there are some setting for plugin that you have not installed.  
You can simply ignore them  
3. Restart vi and install packages  
enter the command below in normal mode after you start vi  
        `:BundleInstall`
4. Restart vi again  
5. Done!  
6. \(Optional\) Copy the snippets I define into snippets/  
        `cp snippets/* ~/.vim/bundle/vim-snippets/snippets/`

#What is in this vimrc? (Plug-in List)
###File management
- nerdtree  
    `<F2>`
- ctrlp.vim  
    `ctrl` `p`

###Auto Complete
- L9  
    needed plugin for vim-autocomplete
- vim-autocomplpop
- neocomplcache

###snippets
- vim-addon-mw-utils
- tlib_vim
- vim-snipmate
- vim-snippets

###Git
- vim-gitgutter
- vim-fugitive

###developement
- vim-autoclose  
    自動補上成對的符號 e.g. {}
- cscope.vim
- tcomment_vim  
    *`* : comment all the selected words
- vim-airline
- rainbow_parentheses.vim  
    讓多層的括號以不同的顏色顯示
- indentLine  
    用直線標註同indent的區塊
- vim-trailing-whitespace  
    標註每行最後面沒用到的空白
- tagbar  
    `<F10>`
- vim-indent-object  
    `v` `i` `{` : 選取大括號內的文字  
    `v` `i` `i` : 選取同indent內的文字  
    `v` `a` `i` : 選取同indent內的文字,同時包含上一級  

###syntax
- c.vim
    加強C/C++的各種功能  
    在github上沒有最新版,目前是下載vim.org的最新版\(version 6.1\) 放在我的github上，必須手動更新  
    `<F9>` : compile  
- cpp-vim  
    strengthen c++ syntax highlight
- python-syntax  
    strengthen python syntax highlight
- vim-markdown  
    markdown syntax highlight
- html5.vim  
    html5 syntax highlight
- vim-css3-syntax  
    css 3 syntax highlight
- vim-javascript-syntax  
    javascript syntax highlight
- syntastic  
    automatically check syntax error
- pyflakes  
    strengthen python sytax checking
- pythoncomplete  
    strengthen python auto completion
    it might support only python 2 since the last update time for this repo is 2011

###tool
- vim-multiple-cursors  
    如同sublime支援多重游標
    主要用法是在normal mode按ctrl + n ，再選取，最後再按一次ctrl + n
- vim-sdcv  
    use sdcv to search vocabulary
    `<F3>` : search

###theme
- tomorrow-theme-vim  
    this is a mirror for vundle/neobundle user and will not update as the original author update
- molokai
- desert

###not using
- vim-easymotion
- vimwiki

#Author
[Lee-W](https://github.com/Lee-W/)
