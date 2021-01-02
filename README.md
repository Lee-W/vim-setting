# Vim

# Description
My vim settings

# Installation
1. Clone this repo and copy .vimrc to home directory

    ```sh
    git clone https://github.com/Lee-W/vim-setting.git
    cd vim-setting
    cp .vimrc ~/
    ```
2. Install `ag` and `fzf`
3. Start vi and it will automatically install `vim-plug` (package management for vim)
   It might display plenty of error message since there are settings for plug-in that not yet been installed.
   **You can simply ignore them**
4. Restart vi and install packages
   Enter the command `:PlugInstall` in normal mode after you start vi
5. Restart vi again
6. Done!
7. \(Optional\) Copy the snippets I define into snippets/
    `cp snippets/* ~/.vim/bundle/vim-snippets/snippets/`

# Author
[Lee-W](https://github.com/Lee-W/)
