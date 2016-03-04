" Vundle 
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Syntax
" if has('gui_running')
"     colorscheme peacocks-in-space 
"     set guifont=Office\ Code\ Pro:h16
"     set linespace=5
" endif

set t_Co=256 
set background=dark
colorscheme onedark
syntax enable

" Indentation
set tabstop=4               " Visual tab size
set softtabstop=4           " Tab size when using spaces
set expandtab               " Transform tabs to spaces
set shiftwidth=4            " Tab size when auto indenting
set shiftround              " Round indent to nearest multiple of 4

" UI
set number              " Display line numbers
set showcmd             " Show command in the bottom bar
set wildmenu            " Autocomplete in bottom bar
set lazyredraw          " Redraw less for performance
" set showmatch         " Highlight matching brackets
" set cursorline        " Highlight the current line

" File types
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.md set filetype=markdown

" Move backups to their own folder instead of using a ~ suffix
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Disable arrows because I'm a masochist
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>

" Backspace options
set backspace=indent,eol,start

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Plugins
Plugin 'othree/yajs.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required:w

nmap <c-R> :CtrlPBufTag<cr>
nmap <c-E> :CtrlPMRUFiles<cr>
set wildignore+=*/node_modules/*

set incsearch
set hlsearch
