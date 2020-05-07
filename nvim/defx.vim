nnoremap <silent>- :Defx<CR>
call defx#custom#option('_', {
            \ 'columns': 'indent:icons:filename:type:git',
            \ 'winwidth': 40,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 1,
            \ 'buffer_name': 'defx',
            \ 'resume': 1,
            \ 'toggle': 1,
            \ 'root_marker': ':',
            \})

call defx#custom#column('git', 'show_ignored', 1)
call defx#custom#column('filename', { 'root_marker_highlight': 'Ignore' })

let g:defx_git#indicators = {
            \ 'Modified'  : '!',
            \ 'Staged'    : '✚',
            \ 'Untracked' : '?',
            \ 'Renamed'   : '»',
            \ 'Unmerged'  : '≠',
            \ 'Ignored'   : 'ⁱ',
            \ 'Deleted'   : '✖',
            \ 'Unknown'   : '*'
            \ }

let g:defx_icons_directory_symlink_icon  = '~>'
let g:defx_icons_directory_icon          = ' +'
let g:defx_icons_root_opened_tree_icon   = ' -'
let g:defx_icons_nested_opened_tree_icon = ' -'
let g:defx_icons_nested_closed_tree_icon = ' +'
let g:defx_icons_enable_syntax_highlight = 0
let g:defx_icons_column_length           = 2
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_mark_icon               = '*'
let g:defx_icons_copy_icon               = ''
let g:defx_icons_move_icon               = ''
let g:defx_icons_parent_icon             = ''
let g:defx_icons_default_icon            = ''

augroup defx_colors
    autocmd!
    autocmd ColorScheme * highlight DefxIconsOpenedTreeIcon guifg=#FFCB6B
    autocmd ColorScheme * highlight DefxIconsNestedTreeIcon guifg=#FFCB6B
    autocmd ColorScheme * highlight DefxIconsClosedTreeIcon guifg=#FFCB6B
augroup END

augroup defx_init
    autocmd!
    autocmd BufWritePost * call defx#redraw() " Redraw on file change
    autocmd FileType defx call s:defx_init()  " Load Settings
augroup END

function! s:defx_init()
    setl nonumber
    setl norelativenumber
    setl listchars=
    setl nofoldenable
    setl foldmethod=manual
    setl signcolumn=no

    " Define Mappings
    nnoremap <silent><buffer><expr> <esc>
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#do_action('open_tree')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> v
                \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
    nnoremap <silent><buffer><expr> s
                \ defx#do_action('multi', [['drop', 'split'], 'quit'])
    nnoremap <silent><buffer><expr> t
                \ defx#do_action('drop', 'tabedit')
    nnoremap <silent><buffer><expr> n
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> <C-r>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> >
                \ defx#do_action('resize', defx#get_context().winwidth + 10)
    nnoremap <silent><buffer><expr> <
                \ defx#do_action('resize', defx#get_context().winwidth - 10)
    nnoremap <silent><buffer><expr> H
                \ defx#do_action('cd', ['..'])
endfunction
