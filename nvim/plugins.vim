if &compatible
set nocompatible
endif

set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
    call dein#begin('~/.local/share/dein')
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/denite.nvim')

    " file drawer
    call dein#add('Shougo/defx.nvim')
    call dein#add('kristijanhusak/defx-git')
    call dein#add('kristijanhusak/defx-icons')

    " colors
    call dein#add('chriskempson/base16-vim')
    " statusline
    call dein#add('itchyny/lightline.vim')
    " autocompletion
    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
    call dein#add('mhinz/vim-startify')
    "call dein#add('tpope/vim-fugitive')
    "call dein#add('junegunn/gv.vim')
    call dein#add('ap/vim-css-color')

    call dein#add('tpope/vim-surround')
    " SYNTAX
    " F#
    call dein#add('kongo2002/fsharp-vim')
    " Elm
    call dein#add('andys8/vim-elm-syntax')
    " React JSX
    call dein#add('mxw/vim-jsx')
    " Typescript syntax highlighting
    call dein#add('HerringtonDarkholme/yats.vim')
    " PHP
    call dein#add('stanangeloff/php.vim')
    call dein#add('jwalton512/vim-blade')
    " ReasonML
    call dein#add('reasonml-editor/vim-reason-plus')
    " Haskell
    call dein#add('neovimhaskell/haskell-vim')
    " Purescript
    call dein#add('raichoo/purescript-vim')
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax on

if dein#check_install()
    call dein#install()
endif
