if (has('termguicolors'))
	set termguicolors
endif

set background=dark

"let g:gruvbox_material_palette = 'mix' " original, mix, material
let g:gruvbox_material_background = 'medium' " hard, medium, soft
"let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_bold = 1
"let g:gruvbox_material_enable_italic = 1
"let g:gruvbox_material_transparent_background = 1
"let g:gruvbox_material_menu_selection_background = 'orange' " grey, red, orange, yellow, green, aqua, blue, purple
let g:gruvbox_material_spell_foreground = 'colored' " none, colored
"let g:gruvbox_material_ui_contrast = 'low' " low, high
let g:gruvbox_material_statusline_style = 'default' " default, mix, original

colorscheme gruvbox-material
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'fugitive', 'wpm' ] ]
      \ },
      \ 'component': {
      "\   'fugitive': '%{FugitiveStatusline()}',
      "\   'wpm': '%{WpmStatusLine()}'
      \ },
      \ }
