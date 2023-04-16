set termguicolors     " enable true colors support

let g:seoul256_background = 233 " 233 up to 239
let g:seoul256_srgb = 1
colorscheme seoul256

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'fugitive' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{FugitiveStatusline()}'
      \ },
      \ }
