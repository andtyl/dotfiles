"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://dougblack.io/words/a-good-vimrc.html#spaces
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" https://github.com/michaeljsmalley/dotfiles/blob/master/vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on

syntax enable
set t_Co=256

" vim-airline
set laststatus=2
let g:airline_theme='light'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" General
"
set number "Line numbers
set cul "Highlight current line
set nowrap "Don't wrap text
set ttimeoutlen=50

" Spaces & tabs
"
set tabstop=4 "Number of visual spaces per TAB
set softtabstop=4 "Number of spaces in tab when editing
set expandtab "Tabs are spaces

" Theme/Colors
let g:base16_shell_path="~/dotfiles/shell/base16-shell/"
let base16colorspace="256"
set background=dark
colorscheme base16-monokai
