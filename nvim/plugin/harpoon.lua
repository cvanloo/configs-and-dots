require("harpoon").setup({
	global_settings = {
		save_on_toggle = true,
	},
})

-- menu
vim.api.nvim_set_keymap(
	"n",
	"<leader>m",
	'<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>',
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>a",
	'<cmd>lua require("harpoon.mark").add_file()<CR>',
	{ noremap = true, silent = true }
)

-- quick select
vim.api.nvim_set_keymap(
	"n",
	"<C-h>",
	'<cmd>lua require("harpoon.ui").nav_file(1)<CR>',
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<C-t>",
	'<cmd>lua require("harpoon.ui").nav_file(2)<CR>',
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<C-n>",
	'<cmd>lua require("harpoon.ui").nav_file(3)<CR>',
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<C-s>",
	'<cmd>lua require("harpoon.ui").nav_file(4)<CR>',
	{ noremap = true, silent = true }
)
