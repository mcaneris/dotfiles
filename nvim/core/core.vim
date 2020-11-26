syntax on
filetype plugin indent on

set softtabstop=4 shiftwidth=4 noexpandtab 
" default register
set clipboard+=unnamedplus

" Line Numbering
set number relativenumber
set numberwidth=4
highlight CursorLineNr ctermfg=yellow

set textwidth=80

" no swap files
set nobackup
set nowb
set noswapfile

" set cursorline
set guicursor=a:blinkon1

" search
set ignorecase
set smartcase

" automatically re-read file if a change
" was detected outside of vim
set autoread
set autowrite

" do incremental searching
set incsearch

" display incomplete commands
set showcmd

set autoread

set hidden
set showtabline=2

set mouse=a
