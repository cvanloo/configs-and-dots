# Vim

## Modifying the Default Config

Created a `~/.vimrc` and suddenly many features don't work anymore? That's
because vim has a default config, that we have now overwritten.

Many of the default config can be found under `/usr/share/vim/vim82/` and
`/etc/vimrc`.

But what if we just want to *append* to the config?

```vimrc
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" You're custom other config goes here...
nmap <ESC> :
mouse=a
```

## Last Position Jump

Vim and Nvim don't do that by default, it requires an autocmd (see :help
last-position-jump).

> autocmd BufRead * autocmd FileType <buffer> ++once\
>     \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif

`defaults.vim` (/usr/share/vim/vim82/defaults.vim) already sets this
autocommand.

Better to use `farmergreg/vim-lastplace` (Github) instead, also handles edge
cases like git/hg commit messages, etc.

## Treesitter is INCREDIBLY SLOW in large files

I have a file with >4000 columns, treesitter renders Nvim unusable.

Best fix I found is to disable treesitter in large files:

```lua
-- In $HOME/.config/nvim/plugin/treesitter.lua
local ts = require('nvim-treesitter.configs')
ts.setup({
    highlight = {
        enable = true,
        disable = function(lang, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 3000
        end,
    },
})
```
