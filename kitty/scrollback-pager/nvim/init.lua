vim.o.relativenumber = true
vim.o.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.virtualedit = 'all'
vim.o.laststatus = 0
vim.o.termguicolors = true
vim.o.scrollback = 100000
vim.o.shell = 'fish'

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('', 'q', ':qa!<CR>', { silent = true })
