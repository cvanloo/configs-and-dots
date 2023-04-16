--[[
'<mode>' '<new>' '<old>' <options>
mode | help page   | affected modes                           | vimscript equivalent
---- | ----------- | ---------------------------------------- | --------------------
''   | mapmode-nvo | Normal, Visual, Select, Operator-pending | :map (same as 'no')
'n'  | mapmode-n   | Normal                                   | :nmap (same as 'nnoremap')
'v'  | mapmode-v   | Visual, Select                           | :vmap (same as 'vnoremap')
's'  | mapmode-s   | Select                                   | :smap
'x'  | mapmode-x   | Visual                                   | :xmap
'o'  | mapmode-o   | Operator-pending                         | :omap
'!'  | mapmode-ic  | Insert, Command-line                     | :map!
'i'  | mapmode-i   | Insert                                   | :imap (same as 'inoremap')
'l'  | mapmode-l   | Insert, Command-line, Lang-Arg           | :lmap
'c'  | mapmode-c   | Command-line                             | :cmap
't'  | mapmode-t   | Terminal                                 | :tmap (same as 'tnoremap')
]]
--

vim.api.nvim_set_keymap("", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "N", "Nzzzv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<esc>", ":", { noremap = true, silent = false })

--vim.api.nvim_set_keymap('', '-', '$', { noremap = true, silent = true})
--vim.api.nvim_set_keymap('', '_', '^', { noremap = true, silent = true})

-- change selected pane (splits)
--vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true, silent = true})
-- select next pane
--vim.api.nvim_set_keymap('', 'N', '<C-W><C-W>', { noremap = true, silent = true})

-- turn highlighting off after search
vim.api.nvim_set_keymap("", "<leader>nh", ":noh<CR>", { noremap = true, silent = true })

-- keeps the cursor in the same position
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })

-- undo breakpoints
vim.api.nvim_set_keymap("i", ",", ",<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", ".", ".<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "!", "!<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "?", "?<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "(", "(<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", ")", ")<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "[", "[<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "]", "]<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "{", "{<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "}", "}<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "=", "=<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<space>", "<space><C-g>u", { noremap = true, silent = true })

-- jumplist mutations
--vim.api.nvim_set_keymap('n', 't', '(v:count > 5 ? "m\'" . v:count : "") . "t"', { expr = true, noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', 'h', '(v:count > 5 ? "m\'" . v:count : "") . "h"', { expr = true, noremap = true, silent = true})

-- moving text
vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<esc>:m .+1<CR>==a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<esc>:m .-2<CR>==a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- leave terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- fancy find replace
-- nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
vim.api.nvim_set_keymap(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ noremap = true, silent = false }
)

vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true, silent = true })
