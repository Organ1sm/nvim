--  Author:    Organ1sm
--  Github:    github.com/Organ1sm
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Plugin-Independent Mapping ❱━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
local keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
local silent = {silent = true}

-- to quit vim
keymap('n', '<leader>Q', ':wq<cr>', options)
keymap('n', 'H', "^", options)
keymap('v', 'H', "^", options)
keymap('n', 'L', "$", options)
keymap('v', 'L', "$", options)

keymap("i", "<A-k>", "<up>", options)
keymap("i", "<A-j>", "<down>", options)
keymap("i", "<A-h>", "<left>", options)
keymap("i", "<A-l>", "<right>", options)

-- scroll window up/down
keymap('i', '<C-e>', '<ESC><C-e>', silent)
keymap('i', '<C-y>', '<ESC><C-y>', silent)

-- clear Search Results
keymap('n', '//', ':noh <CR>', silent)

keymap("n", "sv", ":vsp<CR>", options)
keymap("n", "sh", ":sp<CR>", options)
keymap("n", "sc", "<C-w>c", options)
keymap("n", "so", "<C-w>o", options)

keymap("n", "s>", ":vertical resize +20<CR>", options)
keymap("n", "s<", ":vertical resize -20<CR>", options)
keymap("n", "s=", "<C-w>=", options)
keymap("n", "sj", ":resize +10<CR>", options)
keymap("n", "sk", ":resize -10<CR>", options)
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)
keymap("i", "z;", "<Esc>A;", options)
keymap("n", "z;", "A;", options)

-- Plugins.
keymap("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
keymap("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
keymap("n", "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
keymap("n", "<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
keymap("n", "<Leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
keymap('n', "<leader>M", "<cmd>lua require('telescope.builtin').keymaps()<cr>", options)

keymap('n', '<Leader>sb', '<cmd>:SymbolsOutline<cr>', options)

-- keymap('n', '<F5>', ":AsyncTask file-run<cr>", options)
-- keymap('n', '<F9>', ":AsyncTask file-build<cr>", options)

keymap("n", "<leader>fn", "<cmd>lua require('telescope').extensions.notify.notify()<CR>", options)

keymap("n", "<leader>ft", "<cmd>TodoTelescope theme=dropdown<CR>", options)


-- Debug
keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", options)
keymap("n", "<F4>", "<cmd>lua require('dap').terminate()<CR>", options)
keymap("n", "<F5>", "<cmd>lua require('dap').continue()<CR>", options)
keymap("n", "<F6>", "<cmd>lua require('dap').step_into()<CR>", options)
keymap("n", "<F7>", "<cmd>lua require('dap').step_over()<CR>", options)
keymap("n", "<F8>", "<cmd>lua require('dap').step_out()<CR>", options)
keymap("n", "<F9>", "<cmd>lua require('dap').run_last()<CR>", options)
keymap(
    "n",
    "<F10>",
    "<cmd>lua require'dap'.close()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
    options
)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", options)

