vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xqw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
