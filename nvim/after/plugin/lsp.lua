local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
	'clojure_lsp',
	'gopls',
	'rust_analyzer',
	'clangd',
	'julials',
	'lua_ls',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	["<C-e>"] = cmp.mapping.close(),
	["<CR>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	}),
	["<C-space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	--lsp.default_keymaps({buffer = bufnr})
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set('n', '<leader>lh', function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)

	vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
	vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set('n', 'gy', function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set('n', 'gw', function() vim.lsp.buf.document_symbol() end, opts)
	vim.keymap.set('n', 'gW', function() vim.lsp.buf.workspace_symbol() end, opts)

	vim.keymap.set('n', '<leader>la', function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set('n', '<leader>li', function() vim.lsp.buf.incoming_calls() end, opts)
	vim.keymap.set('n', '<leader>lo', function() vim.lsp.buf.outgoing_calls() end, opts)

	vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

-- configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
