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
    use('nvim-treesitter/nvim-treesitter')
    use('nvim-treesitter/playground')

    -- Harpoon (C-e, C-h,t,n,s)
    use('theprimeagen/harpoon')

    -- Vim be good
    use('ThePrimeagen/vim-be-good')

    -- Himalaya
    use('https://git.sr.ht/~soywod/himalaya-vim')

    -- Tmux Navigator (C-h,j,k,l)
    -- use('numToStr/Navigator.nvim')
    use('christoomey/vim-tmux-navigator')

    -- Undo Tree (<leader>u)
    use('mbbill/undotree')

    -- Git (gx)
    use('tpope/vim-fugitive')

    -- Aws
    use({ 'kiran94/s3edit.nvim', config = true, cmd = "S3Edit" })

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

    -- Dadbod
    use('tpope/vim-dadbod')

    -- LSP
    use('neovim/nvim-lspconfig')
    use('L3MON4D3/LuaSnip')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')

    use('ray-x/lsp_signature.nvim')

    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    use('Slotos/telescope-lsp-handlers.nvim')
    -- use {"OmniSharp/omnisharp-vim", config = function()
    --     vim.g.OmniSharp_server_stdio_quickload = 1
    --     vim.g.OmniSharp_server_use_mono = 1
    --     vim.g.enable_import_completion = true
    -- end}

    -- Autocompletion
    use('prabirshrestha/asyncomplete.vim')

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

    -- Rust-Tools
    use('simrat39/rust-tools.nvim')

    -- nvim context
    -- use('wellle/context.vim')

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- Lualine Extensions
    use 'WhoIsSethDaniel/lualine-lsp-progress.nvim'
end)
