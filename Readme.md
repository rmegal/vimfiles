# My Vim Configuration

I got the idea for this from @noopkat and used her vim-setup.sh script as a pattern for the update-files.ps1 script found here. Building my script using PowerShell was natural for me since I work almost exclusively on Windows and use PowerShell daily.

## Plugins

* PProvost/vim-ps1
* airblade/vim-gitgutter
* dracula/vim
* drewtempelmeyer/palenight.vim
* kien/ctrlp.vim
* leafgarland/typescript-vim
* neoclide/vim-jsx-improve
* posva/vim-vue
* scrooloose/nerdtree
* terryma/vim-multiple-cursors
* tpope/vim-abolish
* tpope/vim-dispatch
* tpope/vim-pathogen
* vim-airline/vim-airline
* vim-airline/vim-airline-themes
* vim-syntastic/syntastic

## Install

* Clone to Home directory \($env:USERPROFILE on Windows\)

    ```
    git clone --recursive https://github.com/rmegal/vimfiles.git
    ```

    or

    ```
    git clone --recursive https://github.com/rmegal/vimfiles.git
    cd vimfiles
    git submodule init
    git submodule update
    ```

* Copy \_vimrc to Home directory
* Optionally run `.\update-files.ps1` to pick up changes in submodules.

## Manage Plugins

The script only supports plugins found on github at this point. Edit `$plugins` variable in `update-files.ps1` script. Add `user\project-name` without trailing `.git`.

## Miscellaneous

I'm including my vimrc file here as a convenience. It must also be copied to the Home directory.

