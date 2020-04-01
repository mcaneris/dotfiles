" STARTUP

" turn off tmux statusline on vim startup.
autocmd VimEnter,VimLeave * silent !tmux set status off
let g:startify_custom_header = []
