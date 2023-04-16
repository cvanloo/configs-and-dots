let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua <<EOF
vim.api.nvim_set_keymap('', '<leader>lh', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true }) -- errors and warnings
vim.api.nvim_set_keymap('', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true }) -- function signatures
vim.api.nvim_set_keymap('', '<leader>ld', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('', '<leader>dn', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>dN', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true})

vim.api.nvim_set_keymap('', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', 'gD', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', 'gy', ':lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true})

vim.api.nvim_set_keymap('', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>li', ':lua vim.lsp.buf.incoming_calls()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>lo', ':lua vim.lsp.buf.outgoing_calls()<CR>', { noremap = true, silent = true})
EOF
