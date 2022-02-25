require("hop").setup()

local options = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<leader>hw", "<cmd>HopWord<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>hl", "<cmd>HopLine<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>hc", "<cmd>HopChar1<CR>", options)

