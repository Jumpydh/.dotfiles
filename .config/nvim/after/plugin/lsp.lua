local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {
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
    cmd = { "rustup","run","stable","rust-analyzer" },
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
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      -- vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

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


require("mason").setup()
require("mason-lspconfig").setup()

require('telescope-lsp-handlers').setup()

Cfg = {
    hint_enable = false,
    toggle_key = '<C-c>',
     toggle_key_flip_floatwin_setting = true,
}

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

require('lsp_signature').on_attach({
    bind = true,
    handler_opts = {
        border = "single"
    }
})

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


-- vim.diagnostic.config({
--     virtual_text = true
-- })
