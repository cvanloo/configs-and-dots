require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"clojure",
		"vimdoc",
		"javascript",
		"typescript",
		"go",
		"rust",
		"c",
		"cpp",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"html",
		"json",
		"fish",
		"latex",
	},
	sync_install = false, -- install synchronously
	auto_install = true, -- automatically install missing parsers
	-- ignore_install = { "javascript" }, -- ignore these parsers (for ensure_install = { 'all' })
	highlight = {
		enable = true,
		-- disable = { "c", "rust" }, -- list of languages to be disabled
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	playground = {
		enable = true,
	},
}
