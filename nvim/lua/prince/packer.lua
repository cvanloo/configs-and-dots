local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = { { 'nvim-treesitter/playground' } }
    }

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            {
                'L3MON4D3/LuaSnip',
                requires = { 'rafamadriz/friendly-snippets' }
            },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },

            -- TabNine
            { 'tzachar/cmp-tabnine',     run = './install.sh' }
        }
    }

    use { 'ThePrimeagen/harpoon', requires = { { 'nvim-lua/plenary.nvim' } } }

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    use 'mbbill/undotree'
    use { 'tpope/vim-surround', requires = { 'tpope/vim-repeat' } }
    use 'godlygeek/tabular'
    use 'ethanholz/nvim-lastplace'
    --use 'cohama/lexima.vim' -- lexima won't work with parinfer, use nvim-autopairs instead!
    --use 'windwp/nvim-autopairs'
    use 'ray-x/lsp_signature.nvim'

    use 'Olical/conjure'
    use { 'eraserhd/parinfer-rust', run = 'cargo build --release' }
    use { 'bakpakin/janet.vim' }

    use {
        'radenling/vim-dispatch-neovim',
        requires = {
            { 'tpope/vim-dispatch' },
            { 'clojure-vim/vim-jack-in' },
        }
    }

    --use 'itchyny/lightline.vim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'HiPhish/nvim-ts-rainbow2'
    use 'sjl/badwolf'
    use 'Shatur/neovim-ayu'
    use 'sainnhe/sonokai'
    use 'morhetz/gruvbox'
    use 'tek256/simple-dark'
    use 'theniceboy/nvim-deus'
    use 'bluz71/vim-moonfly-colors'
    use 'lunacookies/vim-colors-xcode'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
