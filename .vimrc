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
let g:airline_theme='codedark'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

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

