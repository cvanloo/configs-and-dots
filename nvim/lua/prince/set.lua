vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.lightline = {
    --colorscheme = 'wombat',
    colorscheme = 'seoul256',
}

vim.opt.guifont = { "Berkeley Mono", ":h10" }
if vim.g.neovide then
    -- vim.g.neovide_transparency = 1
    -- vim.g.neovide_floating_blur_amount_x = 2.0
    -- vim.g.neovide_floating_blur_amount_y = 2.0
    -- vim.g.neovide_profiler = true
    vim.g.neovide_cursor_vfx_mode = "ripple" -- railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
end

vim.opt.cmdheight = 2
vim.opt.signcolumn = 'yes'
vim.opt.path:append('**')
vim.opt.hidden = true

vim.opt.background = 'dark'
vim.opt.termguicolors = true

--vim.opt.wrap = false
--vim.opt.whichwrap = vim.o.whichwrap .. "<,>,[,],h,l"
--vim.opt.conceallevel = 0

vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.showmode = false

vim.opt.cursorline = true
vim.opt.colorcolumn = '80,120'
vim.opt.ruler = true

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.incsearch = true
vim.opt.inccommand = 'split'
--vim.opt.hlsearch = false

local tab_width = 4
vim.opt.tabstop = tab_width
vim.opt.shiftwidth = tab_width
vim.opt.softtabstop = tab_width
vim.opt.expandtab = true
vim.opt.smarttab = true

-- vim.opt.autoindent = true

vim.opt.listchars = 'eol:↲,tab: ,space:·,lead:·,trail:~,extends:>,precedes:<,'
vim.opt.list = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.number = true
local number_toggle_group = vim.api.nvim_create_augroup('number_toggle', { clear = true})
vim.api.nvim_create_autocmd({'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
	pattern = '*',
	group = number_toggle_group,
	command = 'if &nu && mode() != "i" | set rnu | endif'
})
vim.api.nvim_create_autocmd({'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave'}, {
	pattern = '*',
	group = number_toggle_group,
	command = 'if &nu | set nornu | endif'
})

local home = os.getenv("HOME")
vim.opt.swapfile = false
vim.opt.undodir = home .. '/.vim/undodir'
vim.opt.undofile = true
