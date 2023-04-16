vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files theme=get_ivy<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fa",
	"<cmd>Telescope lsp_document_symbols theme=get_ivy<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F1>", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true })

require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["t"] = require("telescope.actions").move_selection_previous,
				["h"] = require("telescope.actions").move_selection_next,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

require("telescope").load_extension("ui-select")
