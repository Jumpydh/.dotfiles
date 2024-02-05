return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.ansiblels.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                end
            }
            lspconfig.terraformls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                end
            }
            lspconfig.lua_ls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                end
            }
            lspconfig.sqls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                end
            }
            lspconfig.jsonls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                end
            }
            lspconfig.rust_analyzer.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                end,
                cmd = { "rustup", "run", "stable", "rust-analyzer" },
                -- settings = {
                --     ['rust-analyzer'] = {
                --         assist = {
                --             importEnforceGranularity = true,
                --             importPrefix = 'crate',
                --         },
                --         cargo = {
                --             allFeatures = true,
                --         },
                --         checkOnSave = {
                --             command = 'clippy',
                --         },
                --         inlayHints = { locationLinks = false },
                --         diagnostics = {
                --             enable = true,
                --             experimental = {
                --                 enable = true,
                --             },
                --         },
                --     },
                -- },
            }

            lspconfig.tsserver.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                end
            }

            lspconfig.tailwindcss.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                end
            }
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfi', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf, remap = false }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
                end,
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                profile = "default",
                profile_dir = "~/.config/mason",

            })
        end
    },
    {
        'gbrlsnchs/telescope-lsp-handlers.nvim',
        config = function()
            require('telescope-lsp-handlers').setup {
                extensions = {
                    lsp_handlers = {
                        code_action = {
                            telescope = require('telescope.themes').get_dropdown({}),
                        },
                    },
                },
            }
        end
    },





    -- local cmp = require('cmp')
    -- local cmp_select = {behavior = cmp.SelectBehavior.Select}
    -- local cmp_mappings = lspconfig.defaults.cmp_mappings({
    --   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    --   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    --   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    --   ["<C-Space>"] = cmp.mapping.complete(),
    -- })
    --
    -- cmp_mappings['<Tab>'] = nil
    -- cmp_mappings['<S-Tab>'] = nil
    --
    -- lspconfig.setup_nvim_cmp({
    --   mapping = cmp_mappings
    -- })

    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                bind = true,
                handler_opts = {
                    border = "single"
                }
            })
        end
    }
}


-- vim.diagnostic.config({
--     virtual_text = true
-- })
