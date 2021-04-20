" ****************************************
" George Yokoyama <george_y@outlook.com>
" https://geyokoyama.github.io
" ****************************************

" ----------------------------------------
" PLUGINS
" ----------------------------------------
"" Plugin Manager - vim-plug(junegunn/vim-plug)
" install vim-plug & plugins if vim-plug not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"" Interface
Plug 'joshdick/onedark.vim'               " inspired by Atom's One Dark theme
Plug 'vim-airline/vim-airline'            " improved status bar
Plug 'vim-airline/vim-airline-themes'     " status bar theme

"" Utility
Plug 'mattn/emmet-vim'                    " HTML & CSS snippets
Plug 'easymotion/vim-easymotion'          " easier cursor movement
Plug 'preservim/nerdcommenter'            " easy commenting
Plug 'raimondi/delimitmate'               " automatic closing of brackets, quotes, paranthesis etc
Plug 'tpope/vim-fugitive'                 " git plugin
Plug 'mbbill/undotree'                    " visualize undo branches

"" Language

call plug#end()

" ----------------------------------------
" EDITOR BEHAVIOR
" ----------------------------------------
"" Required
set nocompatible            " remove vi compatibility

"" Coding Awareness
set wildmenu                " enhanced commandline completion
set number                  " display line number
set expandtab               " tab insert spaces
set tabstop=2               " # of space characters on tab
set shiftwidth=2            " # of space characters on indent
set scrolloff=999           " cursor line is vertically centered
set wrap                    " text wrap
set linebreak               " prevent wrap inside word
match VisualNOS '\s\+$'     " highlight trailing whitespaces

"" Search
set ignorecase              " not case sensitive
set smartcase               " override ignorecase when pattern contains uppercase
set hlsearch                " search result is highlighted
set incsearch               " incremental search

"" Temporary Files
" make sure folders exist
if !isdirectory(expand('~/.vim/.backup'))
  call mkdir(expand($HOME."/.vim/.backup"), "p")
endif
if !isdirectory(expand('~/.vim/.swap'))
  call mkdir(expand($HOME."/.vim/.swap"), "p")
endif
if !isdirectory(expand('~/.vim/.undo'))
  call mkdir(expand($HOME."/.vim/.undo"), "p", 0700)
endif

"" Path
set backupdir=.backup,~/.vim/.backup//
set directory=.swap,~/.vim/.swap//
set undodir=.undo,~/.vim/.undo//

"" Enable/disable options
"set backup
"set undofile

" ----------------------------------------
" PLUGIN CONFIGURATION
" ----------------------------------------
"" One Dark
" enable 24-bit color terminal support
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:onedark_terminal_italics=1                  " enable italics
colorscheme onedark

"" vim-airline
let g:airline_powerline_fonts=1                   " status line with symbols
let g:airline#extensions#tabline#enabled=1        " display all buffers at top
let g:airline#extensions#tabline#buffer_nr_show=1 " display buffer #

" ----------------------------------------
" LEADER & LOCALLEADER
" ----------------------------------------
let mapleader=' '
let localleader=','

" ----------------------------------------
" CUSTOM MAPPINGS
" ----------------------------------------
"" Normal Mode
" edit/source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>

" open previous file in vertical split
nnoremap <leader>bb :execute "rightbelow vsplit " . bufname("#")<cr>

" open netrw in current/working directory
nnoremap <leader>dd :Lexplore %:p:h<cr>
nnoremap <leader>da :Lexplore<cr>

" <F5> removes all trailing whitespaces
nnoremap <silent> <F5> :let _save_pos=getpos(".") <Bar>
  \:let _s=@/ <Bar>
  \:%s/\s\+$//e <Bar>
  \:let @/=_s <Bar>
  \:nohl <Bar>
  \:unlet _s <Bar>
  \:call setpos('.', _save_pos) <Bar>
  \:unlet _save_pos<cr>

"" Insert Mode
" <esc> remap
inoremap jk <esc>

" ----------------------------------------
" ABBREVIATIONS
" ----------------------------------------
iabbrev @@ george_y@outlook.com
iabbrev comcom https://georgeeyokoyama.github.io

" ----------------------------------------
" AUTOCOMMANDS
" ----------------------------------------
