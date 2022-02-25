--  Author:    Organ1sm
--  Github:    github.com/Organ1sm
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Plugin-Independent Mapping ❱━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
local keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
local silent = {silent = true}
local function mapcmd(key, cmd) vim.api.nvim_set_keymap('n', key, ':' .. cmd .. '<cr>', {noremap = true}) end

-- to quit vim
keymap('n', '<leader>Q', ':wq<cr>', options)
mapcmd('<leader>bd', 'bdelete')
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
keymap('n', "<leader>M", "<cmd>lua require('telescope.builtin').keymaps() <CR>", options)

keymap('n', '<Leader>sb', '<cmd>:SymbolsOutline<cr>', options)

keymap('n', '<F5>', ":AsyncTask file-run<cr>", options)
keymap('n', '<F9>', ":AsyncTask file-build<cr>", options)
