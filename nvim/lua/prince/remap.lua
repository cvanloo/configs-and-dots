vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<ESC>', ':')

vim.keymap.set('', 'n', 'nzzzv')
vim.keymap.set('', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>nh', vim.cmd.nohl)

vim.keymap.set('n', 'J', 'mzJ`z')

vim.keymap.set('i', '<C-j>', '<esc>:m .+1<CR>==a')
vim.keymap.set('i', '<C-k>', '<esc>:m .-2<CR>==a')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set(
    'n',
    '<leader>s',
    ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
    { noremap = true, silent = false }
)

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format()
end)

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>')
