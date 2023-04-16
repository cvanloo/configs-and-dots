local o = vim.o -- global options
local w = vim.wo -- window local options
local b = vim.bo -- buffer local options

-- map leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- color compatibility with tmux
vim.go.t_Co = "256"
o.termguicolors = true

-- spell checking
b.spelllang = "en,de"
--w.spell = true

-- the dark side of vim
o.mouse = "a"

-- ~~~ general settings ~~~
--require("miya.ts_migrate")
require("miya.general.settings")
require("miya.keys.mappings")
require("plugins")

-- ~~~ Themes ~~~
vim.cmd 'source $HOME/.config/nvim/themes/sonokai.vim'  -- <-- great theme ;-)
--vim.cmd 'source $HOME/.config/nvim/themes/xcolors.vim' -- <-- best one!
--vim.cmd 'source $HOME/.config/nvim/themes/badwolf.vim'
--vim.cmd("source $HOME/.config/nvim/themes/gruvbox.vim")
--vim.cmd("source $HOME/.config/nvim/themes/gruvbox_material.vim")
--vim.cmd 'source $HOME/.config/nvim/themes/deus.vim' -- <-- also beautiful!
--vim.cmd 'source $HOME/.config/nvim/themes/ayu.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/oxocarbon.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/neovim-ayu.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/moonfly.vim' -- <-- great dark theme :-)
--vim.cmd 'source $HOME/.config/nvim/themes/papercolor.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/goodwolf.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/tokyonight.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/palenight.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/onedark.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/githubdark.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/githubdarksoft.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/github-nvim.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/cobalt2.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/catppuccin.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/desertEx.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/seoul256.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/bloop.vim'
--vim.cmd 'source $HOME/.config/nvim/themes/simple-dark.vim'

vim.cmd [[
autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
]]

-- neovide specific settings
vim.opt.guifont = { "Comic Code Ligatures", ":h10" }
vim.cmd [[
if exists("g:neovide")
    "let g:neovide_transparency=1
    "let g:neovide_floating_blur_amount_x = 2.0
    "let g:neovide_floating_blur_amount_y = 2.0
    "let g:neovide_profiler = v:true
    let g:neovide_cursor_vfx_mode = "ripple" " railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
endif
]]
