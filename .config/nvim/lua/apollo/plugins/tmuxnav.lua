return {
    -- Tmux Navigator (C-h,j,k,l)
    -- use'numToStr/Navigator.nvim',
    'christoomey/vim-tmux-navigator',

    config = function()
        -- tmux navigation
        vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
        vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
        vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
        vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
    end,
}
