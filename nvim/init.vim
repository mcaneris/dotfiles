let g:config_file_list = [
  \ 'core.vim',
  \ 'plugins.vim',
  \ 'plugins/coc.vim',
  \ 'plugins/lightline.vim',
  \ 'plugins/nnn.vim',
  \ 'plugins/startify.vim',
  \ 'plugins/neomake.vim',
  \ 'mappings.vim',
  \ 'colors.vim'
  \ ]

let g:nvim_config_root = expand('<sfile>:p:h')

for s:fname in g:config_file_list
  execute printf('source %s/core/%s', g:nvim_config_root, s:fname)
endfor
