" STARTUP

" turn off tmux statusline on vim startup.
"autocmd VimEnter,VimLeave * silent !tmux set status off
let g:startify_custom_header = []
augroup TerminalBehavior
    autocmd!
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nowrap winfixwidth laststatus=0 noruler signcolumn=no noshowmode
    autocmd TermOpen * startinsert
    autocmd TermClose * set laststatus=2 showmode ruler
augroup END

nnoremap <silent><leader>\           :call ToggleTerminalDrawer()<CR>
tnoremap <silent><leader>\ <C-\><C-n>:call ToggleTerminalDrawer()<CR>

let g:terminal_drawer = { 'win_id': v:null, 'buffer_id': v:null }
function! ToggleTerminalDrawer() abort
    if win_gotoid(g:terminal_drawer.win_id)
        hide
        set laststatus=2 showmode ruler
    else
        botright new
        if !g:terminal_drawer.buffer_id
            call termopen($SHELL, {"detach": 0})
            let g:terminal_drawer.buffer_id = bufnr("")
        else
            exec "buffer" g:terminal_drawer.buffer_id
            call RemoveEmptyBuffers()
        endif

        exec "resize" float2nr(&lines * 0.25)
        setlocal laststatus=0 noshowmode noruler
        setlocal nobuflisted
        echo ''
        startinsert!
        let g:terminal_drawer.win_id = win_getid()

        tnoremap <buffer><Esc> <C-\><C-n>
        nnoremap <buffer><silent><Esc> :q<cr>
        nnoremap <buffer><silent> q :q<CR>
    endif
endfunction

function! ToggleLazyGit()
    echo "Loaded Lazygit"
    call ToggleTerm('lazygit')
endfunction

nnoremap <silent><leader>l :call ToggleLazyGit()<cr>
nnoremap <silent><leader>l <C-\><C-n>:call ToggleLazyGit()<CR>

function! CreateCenteredFloatingWindow()
    let width  = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.8)
    let top    = ((&lines - height) / 2) - 1
    let left   = (&columns - width) / 2
    let opts   = { 'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal' }
    let top    = "╭" . repeat("─", width - 2) . "╮"
    let mid    = "│" . repeat(" ", width - 2) . "│"
    let bot    = "╰" . repeat("─", width - 2) . "╯"
    let lines  = [top] + repeat([mid], height - 2) + [bot]
    let s:buf  = nvim_create_buf(v:false, v:true)

    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    call InvertBackground()

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, CreatePadding(opts))
    autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf
    autocmd BufWipeout <buffer> call ResetBackground()
endfunction

function! CreatePadding(opts)
    let a:opts.row    += 1
    let a:opts.height -= 2
    let a:opts.col    += 2
    let a:opts.width  -= 4
    return a:opts
endfunction

function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        bwipeout!
    endif
endfunction

function! OnTermExit(job_id, code, event) dict
    if a:code == 0
        bwipeout!
    endif
endfunction

function! InvertBackground()
    hi InactiveWindow guibg=#181818
    hi ActiveWindow   guibg=#2C323C
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

function! ResetBackground()
    hi ActiveWindow   guibg=#181818
    hi InactiveWindow guibg=#181818
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

function! RemoveEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        silent exe 'bw ' . join(buffers, ' ')
    endif
endfunction

