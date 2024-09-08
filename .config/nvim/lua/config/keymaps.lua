-- files
vim.api.nvim_set_keymap("n", "wq", ":wq!<enter>", { noremap = false, desc = "Write Quit!" })
vim.api.nvim_set_keymap("n", "E", "$", { noremap = false, desc = "End of Line" })
vim.api.nvim_set_keymap("n", "B", "^", { noremap = false, desc = "Start of Line" })
-- splits
vim.api.nvim_set_keymap("n", "<leader>qw", ":q<CR>", { silent = true, noremap = true, desc = "Close Split" })
-- buffers
vim.api.nvim_set_keymap("n", "<leader>qb", ":bdelete<CR>", { silent = true, noremap = true, desc = "Close Buffer" })
vim.api.nvim_set_keymap("n", "<tab>", ":bnext<CR>", { silent = true, noremap = true, desc = "Next Buffer" })
vim.api.nvim_set_keymap("n", "<S-tab>", ":bprev<CR>", { silent = true, noremap = true, desc = "Next Buffer" })
