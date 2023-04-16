-- automatically install packer and all plugins
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- ~~~ Syntax highlighting ~~~
	-- use 'sheerun/vim-polyglot'
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- :TSInstall <language>
	use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = { "nvim-treesitter/nvim-treesitter" } })
	-- Allows for things such as:
	-- daf (delete around function) to delete entire function
	-- dic (delete inside class) to delete everything within a class

	-- ~~~ colorschemes ~~~
	-- use 'gruvbox-community/gruvbox'
	use("morhetz/gruvbox")
	use("sainnhe/gruvbox-material")
	use("sjl/badwolf")
	use("NLKNguyen/papercolor-theme")
	use("ghifarit53/tokyonight-vim")
	--use("folke/tokyonight.nvim")
	use("drewtempelmeyer/palenight.vim")
	use("wojciechkepka/vim-github-dark")
	use("projekt0n/github-nvim-theme")
	use("joshdick/onedark.vim")
	use("sainnhe/sonokai")
	--use("ayu-theme/ayu-vim")
	use("bluz71/vim-moonfly-colors")
	use("arzg/vim-colors-xcode")
	use("ajmwagar/vim-deus")
	use("lalitmee/cobalt2.nvim")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use("tek256/simple-dark")
	use("mbbill/desertEx")
	use({ "nocksock/bloop.nvim", requires = { "rktjmp/lush.nvim" } })
	use("shatur/neovim-ayu")
	use("junegunn/seoul256.vim")
	--use("krshrimali/vim-moonfly-colors")
	--use({ "shaunsingh/oxocarbon.nvim", run = "./install.sh" })

	use("tjdevries/colorbuddy.nvim")

	-- ~~~ statusline/tabline ~~~
	use("itchyny/lightline.vim")

	-- ~~~ LSP, etc. ~~~
	use("neovim/nvim-lspconfig")
	use("ray-x/lsp_signature.nvim")
	use("sbdchd/neoformat")
	use("RRethy/vim-illuminate")
	-- use 'folke/trouble.nvim'
	-- use 'kyazdani42/nvim-web-devicons' -- dependency for trouble

	-- ~~~ Completion ~~~
	use("hrsh7th/nvim-cmp") -- completion
	use("hrsh7th/cmp-buffer") -- completion source: complete from current buffer
	use("hrsh7th/cmp-path") -- completion source: complete file paths
	use("hrsh7th/cmp-nvim-lsp") -- completion source: from lsp
	use("L3MON4D3/LuaSnip") -- snippets
	use({ "saadparwaiz1/cmp_luasnip" }) -- helps integrating luasnip in nvim-cmp
	use("onsails/lspkind-nvim") -- icons
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})
	-- use 'hrsh7th/cmp-nvim-lua' -- completion source: for lua

	-- ~~~ Snippets ~~~

	-- ~~~ Git ~~~
	use("TimUntersberger/neogit")
	use("sindrets/diffview.nvim")
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use("rhysd/git-messenger.vim")
	-- use 'puremourning/vimspector'

	-- ~~~ other ~~~
	use("mbbill/undotree")
	-- use 'preservim/nerdtree'
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use("ThePrimeagen/harpoon")
	use("nvim-lua/popup.nvim") -- dependency for telescope, harpoon
	use("nvim-lua/plenary.nvim") -- dependency for telescope, harpoon
	use("goolord/alpha-nvim")
	use("kshenoy/vim-signature")
	use("tpope/vim-surround")
	use("lervag/vimtex")
	use("godlygeek/tabular")
	use("farmergreg/vim-lastplace")

	-- ~~~ language specific ~~~
	-- use { 'phpactor/phpactor', 'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o' } -- how does this work?
	--use("crispgm/nvim-go")
	use("Olical/conjure")
	use({ "clojure-vim/vim-jack-in", requires = { "radenling/vim-dispatch-neovim", "tpope/vim-dispatch" } })
	use({ "eraserhd/parinfer-rust", run = "cargo build --release" })
	-- use("luochen1990/rainbow")
    use("bakpakin/janet.vim")

	-- syntax highlighting for nix expressions
	use("LnL7/vim-nix")

	-- fun stuff
	use({ "giusgad/pets.nvim", requires = { "edluffy/hologram.nvim", "MunifTanjim/nui.nvim" } })

	--use("~/code/wpm.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
