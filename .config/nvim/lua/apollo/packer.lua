-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope (<leader>pf)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Color Scheme
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- Harpoon (C-e, C-h,t,n,s)
    use('theprimeagen/harpoon')

    -- Tmux Navigator (C-h,j,k,l)
    use('christoomey/vim-tmux-navigator')

    -- Undo Tree (<leader>u)
    use('mbbill/undotree')

    -- Git (gx)
    use('tpope/vim-fugitive')

    -- Trouble (xq, xqw)
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }

    }

    -- Copilot
    use("github/copilot.vim")

    -- Comments (gcc)
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- vim-surround (cs"' or ds")
    use('tpope/vim-surround')

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- Lualine Extensions
    use 'WhoIsSethDaniel/lualine-lsp-progress.nvim'

end)
