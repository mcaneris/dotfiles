set termguicolors

" INDENTATION
set shiftwidth=4
set tabstop=4
set expandtab
set clipboard+=unnamedplus

" LINE NUMBERING
set number
augroup numbertoggle
    autocmd!
    autocmd InsertLeave * set relativenumber
    autocmd InsertEnter * set norelativenumber
augroup END
set numberwidth=5

" no swap files
set nobackup
set nowb
set noswapfile

" cursor
" set cursorline
set guicursor=a:blinkon1
" set guicursor=n:hor200-Cursor
set guicursor=v:block-Cursor

" ignore case when searching
set ignorecase

" but if the search string has an
" upper case letter in it,
" the search will be case sensitive
set smartcase

" automatically re-read file if a change
" was detected outside of vim
set autoread

set textwidth=80

set autowrite

" do incremental searching
set incsearch

" display incomplete commands
set showcmd

set autoread
augroup autoreadfiles
    autocmd!
    autocmd CursorHold,CursorHoldI * checktime
    autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk - Buffer reloaded" | echohl None
augroup END
