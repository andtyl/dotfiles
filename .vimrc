set nocompatible 
set backspace=indent,eol,start

" Disable beeping
set visualbell
set t_vb=

" Theme
set termguicolors
syntax enable
set t_Co=256
set background=dark
colorscheme codedark

" vim-airline
set laststatus=2
let g:airline_theme='codedark'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" General
set number "Line number
set relativenumber "Relative line numbers
set cul "Highlight current line
set nowrap "Don't wrap text
set ttimeoutlen=50

" Backup/Swap
set nobackup
set dir=~/.vimtmp

" Spaces & tabs
set tabstop=4 "Number of visual spaces per TAB
set softtabstop=4 "Number of spaces in tab when editing
set expandtab "Tabs are spaces

" key mappings
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" gui
if has("gui_running")
  set lines=40
  set columns=120
endif

