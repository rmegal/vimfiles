" The following command starts VIM in full screen
au GUIEnter * simalt ~x

" Make vim behave like Winodws app (e.g. Use CUA keystrokes for clipboard: CTRL-X, CTRL-C, CTRL-V and CTRL-z)
source $VIMRUNTIME/mswin.vim

"============================================================
" Start pathogen
"============================================================
execute pathogen#infect()
call pathogen#helptags()

" set runtimepath^=~/.vim/bundle/ctrlp.vim
" set runtimepath^=~/.vim/bundle/vim-airline/plugin/airline.vim

"============================================================
" radarmeegs settings
"============================================================
syntax on
filetype on
filetype indent on
filetype plugin on
au BufRead,BufNewFile *.xaml setfiletype xml

if (has("termguicolors"))
  set termguicolors
endif

" let g:dracula_italic=0
" let g:palenight_terminal_italics=1


set background=dark
" colorscheme palenight
packadd! dracula " This is necessary when using Vim 8's |packages| feature
colorscheme dracula

set smartindent
set clipboard=unnamed " use os clipboard
set shiftwidth=4 " number of spaces when shift indenting
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tab to spaces
set number " show line numbers
set cursorline  " highlight current line
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set ignorecase smartcase " ignore case and be smart about it
set hlsearch " highlight matches
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/* " lol
let g:ctrlp_show_hidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open
" set noswapfile
let g:jsx_ext_required = 0

highlight Normal guifg=White guibg=Black
highlight Cursor guifg=Black guibg=Orange
highlight CursorLine guibg=Grey20 " Highlight the line the cursor is on (Megal change)

set nowrap " turn off wrap
set textwidth=0 " keep lines from splitting during editing
set scrolloff=0 " use entire window for scroll commands

set guioptions+=m  " Show menu bar
set guioptions-=T " No toolbar

set guifont=Consolas:h13:cANSI " Consolas 15 point, ansi character set 

" airline
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ' > '
let g:airline_right_sep = ' < '
let g:airline_section_warning = '' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 
set laststatus=2 " for airline
"============================================================
" Mappings
"============================================================
" ctrl-p plugin shortcut
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" Nerd Tree toggling
map <C-b> :NERDTreeToggle<CR>

" move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Ensure Ctrl-F is mapped to pagedown
if has("gui")
  unmap <C-F>
  iunmap <C-F>
  cunmap <C-F>
endif

" Use ESC key to turn off incremental search highlighting
nnoremap <esc> :noh<return><esc>

let $macros = 'C:\Users\Ray\Documents\vimmacros'

" switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l

set noruler
set noshowmode
set hidden

