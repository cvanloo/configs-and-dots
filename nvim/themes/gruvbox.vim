let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=0

if (has('termguicolors'))
	set termguicolors
endif

colorscheme gruvbox
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'fugitive', 'wpm' ] ]
      \ },
      \ 'component': {
      "\   'fugitive': '%{FugitiveStatusline()}',
      "\   'wpm': '%{WpmStatusLine()}'
      \ },
      \ }
