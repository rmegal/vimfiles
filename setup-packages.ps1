<#
 # I used this script to move to Vim's package manager from Pathogen
 #>

# short-circuit
return

git submodule deinit bundle/ctrlp.vim
git rm bundle/ctrlp.vim
rd .git/modules/bundle/ctrlp.vim -r -fo
git submodule add https://github.com/kien/ctrlp.vim.git pack\my-plugins\start\ctrlp.vim

git submodule deinit bundle/syntastic
git rm bundle/syntastic
rd .git/modules/bundle/syntastic -r -fo
git submodule add https://github.com/vim-syntastic/syntastic.git pack\my-plugins\start\syntastic

git submodule deinit bundle/vim-dispatch
git rm bundle/vim-dispatch
rd .git/modules/bundle/vim-dispatch -r -fo
git submodule add https://github.com/tpope/vim-dispatch.git pack\my-plugins\start\vim-dispatch

git submodule deinit bundle/vim-ps1
git rm bundle/vim-ps1
rd .git/modules/bundle/vim-ps1 -r -fo
git submodule add https://github.com/PProvost/vim-ps1.git pack\my-plugins\start\vim-ps1

git submodule deinit bundle/vim-airline
git rm bundle/vim-airline
rd .git/modules/bundle/vim-airline -r -fo
git submodule add https://github.com/vim-airline/vim-airline.git pack\my-plugins\start\vim-airline

git submodule deinit bundle/vim-airline-themes
git rm bundle/vim-airline-themes
rd .git/modules/bundle/vim-airline-themes -r -fo
git submodule add https://github.com/vim-airline/vim-airline-themes.git pack\my-plugins\start\vim-airline-themes

git submodule deinit bundle/nerdtree
git rm bundle/nerdtree
rd .git/modules/bundle/nerdtree -r -fo
git submodule add https://github.com/scrooloose/nerdtree.git pack\my-plugins\start\nerdtree

git submodule deinit bundle/vim-pathogen
git rm bundle/vim-pathogen
rd .git/modules/bundle/vim-pathogen -r -fo
# git submodule add https://github.com/tpope/vim-pathogen.git pack\my-plugins\start\vim-pathogen

git submodule deinit bundle/vim-multiple-cursors
git rm bundle/vim-multiple-cursors
rd .git/modules/bundle/vim-multiple-cursors -r -fo
git submodule add https://github.com/terryma/vim-multiple-cursors.git pack\my-plugins\start\vim-multiple-cursors

git submodule deinit bundle/vim-gitgutter
git rm bundle/vim-gitgutter
rd .git/modules/bundle/vim-gitgutter -r -fo
git submodule add https://github.com/airblade/vim-gitgutter.git pack\my-plugins\start\vim-gitgutter

git submodule deinit bundle/typescript-vim
git rm bundle/typescript-vim
rd .git/modules/bundle/typescript-vim -r -fo
git submodule add https://github.com/leafgarland/typescript-vim.git pack\my-plugins\start\typescript-vim

git submodule deinit bundle/vim-jsx-improve
git rm bundle/vim-jsx-improve
rd .git/modules/bundle/vim-jsx-improve -r -fo
git submodule add https://github.com/neoclide/vim-jsx-improve.git pack\my-plugins\start\vim-jsx-improve

git submodule deinit bundle/vim-vue
git rm bundle/vim-vue
rd .git/modules/bundle/vim-vue -r -fo
git submodule add https://github.com/posva/vim-vue.git pack\my-plugins\start\vim-vue

git submodule deinit bundle/palenight.vim
git rm bundle/palenight.vim
rd .git/modules/bundle/palenight.vim -r -fo
# git submodule add https://github.com/drewtempelmeyer/palenight.vim.git pack\my-plugins\start\palenight.vim

git submodule deinit bundle/vim-abolish
git rm bundle/vim-abolish
rd .git/modules/bundle/vim-abolish -r -fo
git submodule add https://github.com/tpope/vim-abolish.git pack\my-plugins\start\vim-abolish

git submodule deinit bundle/dracula
git rm bundle/dracula
rd .git/modules/bundle/dracula -r -fo
git submodule add https://github.com/dracula/vim.git pack\my-plugins\start\dracula

