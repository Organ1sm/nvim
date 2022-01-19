--                          Author:    Organ1sm
--                          Github:    github.com/Organ1sm 
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Plugin-Independent Mapping ❱━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
local keymap = vim.api.nvim_set_keymap
local cmd = vim.cmd
local options = {noremap = true, silent = true}
local silent = {silent = true}

-- to quit vim
keymap('n', '<Leader>q', ':wq<CR>', options)

-- scroll window up/down
keymap('i', '<C-e>', '<ESC><C-e>', silent)
keymap('i', '<C-y>', '<ESC><C-y>', silent)

-- scroll window horizontally (scroll-horizontal)
-- < reference: https://unix.stackexchange.com/questions/110251/how-to-put-current-line-at-top-center-bottom-of-screen-in-vim
-- keymap('n', '<C-h>', 'zh', silent) -- left
-- keymap('n', '<C-l>', 'zl', silent) -- right

-- clear Search Results
keymap('n', '//', ':noh <CR>', silent)

keymap('n', 'H', "^", options)
keymap('n', 'L', "$", options)
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

-- ================= Telescope -==============================
-- ===========================================================

keymap("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
keymap("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
keymap("n", "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
keymap("n", "<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
keymap('n', "<leader>M", "<cmd>lua require('telescope.builtin').keymaps() <CR>", options)

-- =================== format ====================================
keymap('n', '<Leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', options)

cmd([[ :nnoremap <c-z> <nop><CR> ]])
