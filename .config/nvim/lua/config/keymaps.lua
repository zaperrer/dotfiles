-- splits
vim.api.nvim_set_keymap("n", "<leader>qw", ":q<CR>", { silent = true, noremap = true, desc = "Close Split" })
-- buffers
vim.api.nvim_set_keymap("n", "<leader>qb", ":bdelete<CR>", { silent = true, noremap = true, desc = "Close Buffer" })
