return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.angularls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            }
            lspconfig.markdown_oxide.setup({
                -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
                -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
                capabilities = vim.tbl_deep_extend(
                    'force',
                    capabilities,
                    {
                        workspace = {
                            didChangeWatchedFiles = {
                                dynamicRegistration = true,
                            },
                        },
                    }
                ),
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            })
            lspconfig.ansiblels.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            }
            lspconfig.terraformls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            }
            lspconfig.lua_ls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            }
            lspconfig.jdtls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            }
            lspconfig.sqls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            }
            lspconfig.jsonls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            }
            lspconfig.rust_analyzer.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
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

            lspconfig.ts_ls.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            }

            lspconfig.tailwindcss.setup {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach(Cfg, bufnr)
                    capabilities = capabilities
                end
            }
            local pid = vim.fn.getpid()
            local omnisharp_bin = "/home/a1/.local/share/nvim/mason/packages/omnisharp/omnisharp"
            local config = {
                handlers = {
                    -- ["textDocument/definition"] = require('omnisharp_extended').handler,
                },
                -- cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
                cmd = { "dotnet", "/home/a1/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },

                -- Enables support for reading code style, naming convention and analyzer
                -- settings from .editorconfig.
                enable_editorconfig_support = true,

                -- If true, MSBuild project system will only load projects for files that
                -- were opened in the editor. This setting is useful for big C# codebases
                -- and allows for faster initialization of code navigation features only
                -- for projects that are relevant to code that is being edited. With this
                -- setting enabled OmniSharp may load fewer projects and may thus display
                -- incomplete reference lists for symbols.
                enable_ms_build_load_projects_on_demand = false,

                -- Enables support for roslyn analyzers, code fixes and rulesets.
                enable_roslyn_analyzers = false,

                -- Specifies whether 'using' directives should be grouped and sorted during
                -- document formatting.
                organize_imports_on_format = false,

                -- Enables support for showing unimported types and unimported extension
                -- methods in completion lists. When committed, the appropriate using
                -- directive will be added at the top of the current file. This option can
                -- have a negative impact on initial completion responsiveness,
                -- particularly for the first few completion sessions after opening a
                -- solution.
                enable_import_completion = false,

                -- Specifies whether to include preview versions of the .NET SDK when
                -- determining which version to use for project loading.
                sdk_include_prereleases = true,

                -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                -- true
                analyze_open_documents_only = false,
                -- rest of your settings
            }
            lspconfig.omnisharp.setup(config)
            vim.api.nvim_create_autocmd('lspattach', {
                group = vim.api.nvim_create_augroup('userlspconfi', {}),
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
