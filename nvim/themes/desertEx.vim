set termguicolors     " enable true colors support

colorscheme desertEx
let g:lightline = {
      \ 'colorscheme': 'desertEx',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'fugitive' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{FugitiveStatusline()}'
      \ },
      \ }

