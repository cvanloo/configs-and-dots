if (has('termguicolors'))
	set termguicolors
endif

colorscheme xcodedarkhc
"colorscheme xcodedark
"colorscheme xcodewwdc
"highlight Normal guibg=none

augroup vim-colors-xcode
    autocmd!
augroup END

autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic

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
