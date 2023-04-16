set termguicolors     " enable true colors support

colorscheme ayu-dark
let g:lightline = {
      \ 'colorscheme': 'ayu-dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'fugitive' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{FugitiveStatusline()}'
      \ },
      \ }
