set termguicolors     " enable true colors support

colorscheme bloop_nvim
let g:lightline = {
      \ 'colorscheme': 'bloop_nvim',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'fugitive' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{FugitiveStatusline()}'
      \ },
      \ }
