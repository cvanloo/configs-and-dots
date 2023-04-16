lua require('colorbuddy').colorscheme('cobalt2')

if (has('termguicolors'))
	set termguicolors
	set t_Co=256
endif

"highlight Normal guibg=none

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
