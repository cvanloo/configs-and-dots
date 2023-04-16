-- built-in nvim: :h ins-completion
local lspkind = require("lspkind")
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<C-space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "cmp_tabnine" },
		-- { name = 'nvim_lua' },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
		-- keyword_length, priority (also from position in list), max_item_count
	}),
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = { completeopt = "menu,menuone,noinsert" },
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				cmp_tabnine = "[T9]",
				buffer = "[buf]",
				nvim_lsp = "LSP]",
				path = "[path]",
				luasnip = "[luasnip]",
			},
		}),
	},
	experimental = { native_menu = false, ghost_text = true },
})

-- Setup lspconfig servers
local lspconfig = require("lspconfig")
local lsp_defaults = {
	-- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client, bufnr)
		require("lsp_signature").on_attach({ floating_window = false })
	end,
}
lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)

lspconfig.gopls.setup({})
lspconfig.phpactor.setup({})
lspconfig.clangd.setup({})
lspconfig.eslint.setup({})
lspconfig.ltex.setup({})
lspconfig.clojure_lsp.setup({})
lspconfig.julials.setup({})
--lspconfig.sumneko_lua.setup({
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

--require("go").setup({
--	lint_prompt_style = "vt", -- qf (quickfix) vt (virtual text)
--})
