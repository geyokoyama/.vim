" ****************************************
" George Yokoyama <george_y@outlook.com>
" https://georgeeyokoyama.github.io
" ****************************************

" ****************************************
" PLUGIN MANAGER - vim-plug
" https://github.com/junegunn/vim-plug
" ****************************************
call plug#begin('~/.vim/plugged')
call plug#end()

" ****************************************
" EDITOR BEHAVIOR
" ****************************************
"" Required
set nocompatible            " remove vi compatibility

"" Coding Awareness
set wildmenu                " enhanced commandline completion
set number                  " display line number
set expandtab               " tab insert spaces
set tabstop=2               " # of space characters on tab
set shiftwidth=2            " # of space characters on indent
set scrolloff=999           " cursor line is vertically centered
match ErrorMsg '\s\+$'      " hightlight trailing whitespaces

"" Search
set ignorecase              " not case sensitive
set smartcase               " override ignorecase when pattern contains uppercase
set hlsearch                " search result is highlighted
set incsearch               " incremental search

" ****************************************
" LEADER & LOCALLEADER
" ****************************************
let mapleader=' '
let localleader=','

" ****************************************
" CUSTOM MAPPINGS
" ****************************************
"" vimrc
" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"" Insert Mode
" <esc> remap
inoremap jk <esc>

"" Normal Mode
" open previous file
nnoremap <leader>bb :execute "rightbelow vsplit " . bufname("#")<cr>

" ****************************************
" ABBREVIATIONS
" ****************************************
iabbrev @@ george_y@outlook.com
iabbrev comcom https://georgeeyokoyama.github.io
