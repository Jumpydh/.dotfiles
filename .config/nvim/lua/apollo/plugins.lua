local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
	-- Packer can manage itself
	'wbthomason/packer.nvim',

	-- Telescope (<leader>pf)
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Color Scheme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Treesitter
	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/playground',

	-- Harpoon (C-e, C-h,t,n,s)
	'theprimeagen/harpoon',

	-- Vim be good
	'ThePrimeagen/vim-be-good',

	-- Tmux Navigator (C-h,j,k,l)
	-- use'numToStr/Navigator.nvim',
	'christoomey/vim-tmux-navigator',

	-- Undo Tree (<leader>u)
	'mbbill/undotree',

	-- Git (gx)
	'tpope/vim-fugitive',

	-- Aws
	{ 
		'kiran94/s3edit.nvim',
		config = true,
		cmd = "S3Edit" 
	},

	-- Trouble (xq, xqw)
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},

	-- Dadbod
	'tpope/vim-dadbod',

	-- LSP
	'neovim/nvim-lspconfig',
	'L3MON4D3/LuaSnip',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',

	'ray-x/lsp_signature.nvim',

	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',

	'Slotos/telescope-lsp-handlers.nvim',
	-- use {"OmniSharp/omnisharp-vim", config = function()
	--     vim.g.OmniSharp_server_stdio_quickload = 1
	--     vim.g.OmniSharp_server_use_mono = 1
	--     vim.g.enable_import_completion = true
	-- end}

	-- Autocompletion
	'prabirshrestha/asyncomplete.vim',

	-- Copilot
	'github/copilot.vim',

	-- Comments (gcc)
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},

	-- vim-surround (cs"' or ds")
	'tpope/vim-surround',

	-- Rust-Tools
	'simrat39/rust-tools.nvim',

	-- nvim context
	-- use'wellle/context.vim',

	-- Lualine
	{
		'nvim-lualine/lualine.nvim',
		dependenices = { 'nvim-tree/nvim-web-devicons', lazy = true }
	},
	-- Lualine Extensions
	'WhoIsSethDaniel/lualine-lsp-progress.nvim',
}

require("lazy").setup(plugins, {})
