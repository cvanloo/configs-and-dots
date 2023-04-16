vim.cmd [[packadd packer.nvim]]

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
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use { 'ThePrimeagen/harpoon', requires = { { 'nvim-lua/plenary.nvim' } } }

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    use 'mbbill/undotree'
    use 'tpope/vim-surround'
    use 'godlygeek/tabular'
    use 'ethanholz/nvim-lastplace'

    use 'Olical/conjure'
    use { 'eraserhd/parinfer-rust', run = 'cargo build --release' }
    use { 'bakpakin/janet.vim' }

    use 'sjl/badwolf'
end)
