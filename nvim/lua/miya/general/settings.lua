local cmd = vim.cmd
local u = require("utils")

local o = vim.o -- global options
local w = vim.wo -- window local options
local b = vim.bo -- buffer local options
local set = vim.opt -- allows to set global, window and buffer settings (always use this!)

set.syntax = "enable" -- enable syntax highlighting
set.wrap = false -- do not wrap long lines
set.whichwrap = o.whichwrap .. "<,>,[,],h,l" -- movement in wrapped lines
set.ruler = true -- always show the cursor position in the status bar
set.cmdheight = 2 -- more space for displaying messages
set.conceallevel = 0 -- do not conceal anything (show `` in markdown files)

-- so we can use :find to jump to files at any depth in our project directory
set.path:append('**')

-- set tab width to 4 spaces
local TAB_WIDTH = 4
set.tabstop = TAB_WIDTH -- width of a tab in spaces
set.shiftwidth = TAB_WIDTH -- indents
set.softtabstop = TAB_WIDTH -- number of columns for a tab
set.expandtab = true -- replace tab with spaces
set.smarttab = true

set.background = "dark" -- make background dark

-- use hybrid line numbers for the active buffer only
set.number = true

u.create_augroup({
	{ "BufEnter,FocusGained,InsertLeave,WinEnter", "*", 'if &nu && mode() != "i" | set rnu | endif' },
	{ "BufLeave,FocusLost,InsertEnter,WinLeave", "*", "if &nu | set nornu | endif" },
}, "numbertoggle")


-- autocmd BufRead * autocmd FileType <buffer> ++once
--       \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif


set.autoindent = true -- better auto indentation
set.laststatus = 2 -- always display the status line
set.cursorline = true -- highlight the current line
set.showtabline = 2 -- always show tabs
set.backup = false -- recommended by coc
set.writebackup = false
set.signcolumn = "yes" -- always show sign column; an extra column for linting, etc...
set.updatetime = 300 -- faster completion
set.timeoutlen = 300 -- time waited for (leader key) sequence to be completed
--o.clipboard = 'unnamedplus'                   -- copy paste between vim and everything else
set.colorcolumn = "80,120" -- display vertical line after 80 columns
--o.hlsearch = false                            -- do not continue highlighting after search
-- set exrc
set.hidden = true -- keep files open in an extra buffer
set.errorbells = false -- keep quiet!
set.incsearch = true -- highlight while searching
set.inccommand = "split" -- show replace (%s/old/new/gc) preview in split window
set.scrolloff = 8 -- start scrolling when 8 lines from the top/bottom away
set.sidescrolloff = 8 -- start scrolling horizontally when 8 characters from left/right away

-- autocomplete options
--o.completeopt = 'menuone,preview,noinsert,noselect'
set.compatible = false -- shouldn't be necessary, Nvim is always 'nocompatible'
set.showmode = false -- if false, don't show mode message in cmd
--o.swapfile = true
local home = os.getenv("HOME")
set.undodir = home .. "/.vim/undodir" -- set the director for backup files
set.undofile = true -- automatically save undo history to undo-file

-- display whitespace characters
set.listchars = "eol:↲,tab: ,space:·,lead:·,trail:~,extends:>,precedes:<,"
set.list = true

--vim.go.whichwrap = '<,>,[,],h,l'

-- NOTE: `!~` and `=~` perform a match against the following regex
-- Example: !~ "markdown\|perl\|python"
--u.create_augroup({
--	{ 'BufWritePre', '*', 'if &ft !~ "markdown" | %s/\\s\\+$//e | endif' }
--}, 'deletewhitespaces')
--

set.laststatus = 3 -- Have only one global status line (yt - jH5PNvJIa6o)
-- highlight WinSeperator guibg=None

-- https://vim.fandom.com/wiki/Highlight_unwanted_spaces
-- highlight ExtraWhitespace ctermbg=red guibg=red
-- autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
-- match ExtraWhitespace /\s\+\%#\@<!$/
-- :au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
-- :au InsertLeave * match ExtraWhitespace /\s\+$/
--
-- " Show leading whitespace that includes spaces, and trailing whitespace.
-- :autocmd BufWinEnter * match ExtraWhitespace /^\s* \s*\|\s\+$/

