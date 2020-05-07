let mapleader = " "
inoremap jk <ESC>

noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap <Up> <Nop>

nnoremap ; :

noremap k j
noremap j k

nnoremap <C-k> <C-w>j
nnoremap <C-j> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <PageDown> <Nop>
nnoremap <PageUp> <Nop>

" refmt
nnoremap <silent> gf :! refmt --in-place %<CR>
