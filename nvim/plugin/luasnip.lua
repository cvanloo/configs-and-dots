--[[ Luasnip configuration ]]
local ls = require("luasnip")

--[[ Keymaps ]]
vim.keymap.set({ "i", "s" }, "<c-n>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-p>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- Reload file
--vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/plugin/luasnip.lua<CR>", opts)

--[[ General settings ]]
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	-- enable_autosnippets = true,
	store_selection_keys = "<c-s>",
})

--[[ Snippets ]]
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local same = function(index)
	return f(function(arg)
		return arg[1][1]
	end, { index })
end

local date = function()
	return { os.date("%Y-%m-%d") }
end

local time = function()
	return { os.date("%H:%M") }
end

ls.add_snippets("all", {
	s("date", f(date, {})),
	s("time", f(time, {})),
	s(
		"meta",
		fmt(
			[[
        ---
        title: {}
        author: {}
        date: {}
        categories: [{}]
        lastmod: {}
        tags: [{}]
        comments: true
        ---
        {}
        ]],
			{
				i(1, "note_title"),
				i(2, "author"),
				f(date, {}),
				i(3, ""),
				f(date, {}),
				i(4),
				i(0),
			}
		)
	),
	s({
		trig = "link",
		namr = "markdown_link",
		dscr = "Create markdown link [txt](url)",
	}, {
		t("["),
		i(1),
		t("]("),
		f(function(_, snip)
			return snip.env.TM_SELECTED_TEXT[1] or {}
		end, {}),
		t(")"),
		i(0),
	}),
})
