if &compatible
    set nocompatible
endif

set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
    call dein#begin('~/.local/share/dein')
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/denite.nvim')
    call dein#add('mcchrish/nnn.vim')
    " colors
    call dein#add('chriskempson/base16-vim')
    " statusline
    call dein#add('itchyny/lightline.vim')
    " autocompletion
    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
    call dein#add('mhinz/vim-startify')
    call dein#add('tpope/vim-fugitive')
    call dein#add('junegunn/gv.vim')
    call dein#add('ap/vim-css-color')
    "Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'easymotion/vim-easymotion'
    "Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    "Plug 'ntpeters/vim-better-whitespace'
    "Plug 'ryanoasis/vim-devicons'
    "Plug 'junegunn/limelight.vim'
    "Plug 'junegunn/goyo.vim'

    call dein#add('tpope/vim-surround')
    " SYNTAX
    " React JSX
    call dein#add('mxw/vim-jsx')
    " Typescript syntax highlighting
    call dein#add('HerringtonDarkholme/yats.vim')
    " PHP
    call dein#add('stanangeloff/php.vim')
    call dein#add('jwalton512/vim-blade')
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif
