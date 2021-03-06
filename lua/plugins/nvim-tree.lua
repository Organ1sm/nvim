-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    nvim-tree.lua
--   Github:    github.com/kyazdani42/nvim-tree.lua
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ -
local keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
local tree_cb = require'nvim-tree.config'.nvim_tree_callback


require'nvim-tree'.setup {
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = false,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    update_cwd = false,
    diagnostics = {enable = false, icons = {hint = "", info = "", warning = "", error = ""}},
    git = {enable = false},
    update_focused_file = {enable = true, update_cwd = false, ignore_list = {}},
    system_open = {cmd = nil, args = {}},

    view = {
        width = 30,
        side = 'left',
        hide_root_folder = false,
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        mappings = {custom_only = false, list = {{key = "g?", cb = tree_cb("toggle_help")}}}
    },

    filters = {dotfiles = true, custom = {".git", "node_modules", ".cache"}},

    actions = {
        change_dir = {enable = true, global = false},
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"},
                    buftype = {"nofile", "terminal", "help"}
                }
            }
        }
    },

    renderer = {
        indent_markers = {enable = false, icons = {corner = "└ ", edge = "│ ", none = "  "}},
        icons = {webdev_colors = true}
    },

    ignore_ft_on_setup = {
        -- ".git",
        "node_modules",
        "startify",
        "dashboard",
        "alpha"
        -- ".cache"
    }
}

-- Toggle Nvim-Tree
keymap('n', '<A-m>', ':NvimTreeToggle<CR>', options)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
