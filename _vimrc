vim9script
# The following command starts VIM in full screen
# au GUIEnter * simalt ~x

# Make vim behave like Winodws app (e.g. Use CUA keystrokes for clipboard: CTRL-X, CTRL-C, CTRL-V and CTRL-z)
source $VIMRUNTIME/mswin.vim

# set runtimepath^=~/.vim/bundle/ctrlp.vim
# set runtimepath^=~/.vim/bundle/vim-airline/plugin/airline.vim

#============================================================
# radarmeegs settings
#============================================================
syntax on
filetype on
filetype indent on
filetype plugin on
au BufRead,BufNewFile *.xaml setfiletype xml

if (has("termguicolors"))
  set termguicolors
endif

g:gitgutter_git_executable = "C:\\Program Files\\Git\\bin\\git.exe"
g:gitgutter_grep = ""

# g:dracula_italic=0
# g:palenight_terminal_italics=1


set background=dark
# colorscheme palenight
packadd! dracula # This is necessary when using Vim 8's |packages| feature
colorscheme dracula

set smartindent
set clipboard=unnamed # use os clipboard
set shiftwidth=4 # number of spaces when shift indenting
set tabstop=4 # number of visual spaces per tab
set softtabstop=4 # number of spaces in tab when editing
set expandtab # tab to spaces
set number # show line numbers
set cursorline  # highlight current line
set showmatch # highlight matching [{()}]
set incsearch # search as characters are entered
set ignorecase smartcase # ignore case and be smart about it
set hlsearch # highlight matches
g:ctrlp_working_path_mode = "r"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/* # lol
g:ctrlp_show_hidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif # autoquit if only nerdtree is open
# set noswapfile
g:jsx_ext_required = 0

highlight Normal guifg=White guibg=Black
highlight Cursor guifg=Black guibg=Orange
highlight CursorLine guibg=Grey20 # Highlight the line the cursor is on (Megal change)

set nowrap # turn off wrap
set textwidth=0 # keep lines from splitting during editing
set scrolloff=0 # use entire window for scroll commands

set guioptions+=m  # Show menu bar
set guioptions-=T # No toolbar

# set guifont=Consolas:h13:cANSI # Consolas 13 point, ansi character set 
# set guifont=Cascadia\ Code:h12:cANSI
set guifont=CaskaydiaCove\ NF:h12:cANSI

# The following 3 lines enables the use of the Fira Code font.
# Note: Fira Code (Chocolatey package firacode-ttf) broken starting in gVim 8.2.0796 - 20200520, megal
# set renderoptions=type:directx
# set encoding=utf-8
# set guifont=Fira\ Code:h11

# airline
g:airline_theme = "dracula"
g:airline#extensions#tabline#enabled = 0 
g:airline#extensions#branch#enabled = 1 
g:airline_left_sep = ' > '
g:airline_right_sep = ' < '
g:airline_section_warning = '' 
g:airline_section_y = '' 
g:airline_section_x = '' 
set laststatus=2 # for airline
#============================================================
# Mappings
#============================================================
# ctrl-p plugin shortcut
g:ctrlp_map = "<c-p>"
g:ctrlp_cmd = "CtrlP"

# move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

# Nerd Tree toggling
map <C-b> :NERDTreeToggle<CR>

# move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

# Ensure Ctrl-F is mapped to pagedown
if has("gui")
  unmap <C-F>
  iunmap <C-F>
  cunmap <C-F>
endif

# Use ESC key to turn off incremental search highlighting
nnoremap <esc> :noh<return><esc>

$macros = '$HOME\OneDrive\Documents\vimmacros'

# Restore Screen Size: Tip 1569 https://vim.fandom.com/wiki/Restore_screen_size_and_position
if has("gui_running")
  :def ScreenFilename(): string
    if has("amiga")
      return "s:.vimsize"
    elseif has("win32")
      return $HOME .. "\\_vimsize"
    else
      return $HOME .. "/.vimsize"
    endif
  :enddef

  :def ScreenRestore()
    # Restore window size (columns and lines) and position
    # from values stored in vimsize file.
    # Must set font first so columns and lines are based on font size.
    var f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      var vim_instance = (g:screen_size_by_vim_instance == 1 ? (v:servername) : "GVIM")
      for line in readfile(f)
        var sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=" .. sizepos[1] .. " lines=" .. sizepos[2]
          silent! execute "winpos " .. sizepos[3] .. " " .. sizepos[4]
          return
        endif
      endfor
    endif
  :enddef

  :def ScreenSave()
    # Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      var vim_instance = (g:screen_size_by_vim_instance == 1 ? (v:servername) : "GVIM")
      var data = vim_instance .. ' ' .. &columns .. ' ' .. &lines .. ' ' 
          ..  (getwinposx() < 0 ? 0 : getwinposx()) .. ' '
          ..  (getwinposy() < 0 ? 0 : getwinposy())
      var f = ScreenFilename()
      var lines = []
      if filereadable(f)
        lines = readfile(f)
        call filter(lines, "v:val !~ '^" .. vim_instance .. "\\>'")
        call add(lines, data)
      else
        lines = [data]
      endif
      call writefile(lines, f)
    endif
  :enddef

  if !exists('g:screen_size_restore_pos')
    g:screen_size_restore_pos = 1
  endif

  if !exists('g:screen_size_by_vim_instance')
    g:screen_size_by_vim_instance = 1
  endif

  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif

# switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l

set noruler
set noshowmode
set hidden

