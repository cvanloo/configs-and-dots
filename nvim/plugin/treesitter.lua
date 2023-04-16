local ts = require("nvim-treesitter.configs")

ts.setup({
	--ensure_installed = "all",
	ensure_installed = {
		"c",
		"cpp",
		"go",
		"rust",
		"html",
		"json",
		"javascript",
		"typescript",
		"fish",
		"lua",
		"clojure",
		"help",
	},
	sync_install = true,
	highlight = {
		enable = true,
		disable = function(lang, bufnr)
			local excludes = {
				--["help"] = true, -- treesitter shits the bed on help pages, idk why?
			}
			return vim.api.nvim_buf_line_count(bufnr) > 3000 or excludes[lang]
		end,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sa"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>sA"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		lsp_interop = {
			enable = true,
			border = "none",
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
	},
})
