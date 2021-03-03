" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'https://github.com/joshdick/onedark.vim.git'

" COC
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

Plug 'neomake/neomake'

" Timber
Plug 'nelsyeung/twig.vim'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Elixir / Erlang
Plug 'elixir-editors/vim-elixir'

" Lazy Git
Plug 'kdheepak/lazygit.nvim'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'taohexxx/lightline-buffer'

" FZF
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }

" TMUX
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'mcchrish/nnn.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'

call plug#end()

