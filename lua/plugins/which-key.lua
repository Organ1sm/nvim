local status_ok, which_key = pcall(require, "which-key")
if not status_ok then return end

local mappings = {
    ["C"] = {"<cmd>%bd|e#<CR>", "Close Other Buffers"},
    ["s"] = {"<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Find Document Symbols"},
    ["S"] = {"<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "Find Symobls"},

    c = {
        name = "CMake",
        g = {"<cmd>CMake configure<CR>", "Configure"},
        t = {"<cmd>CMake select_target<CR>", "SelectTarget"},
        T = {"<cmd>CMake select_build_type<CR>", "SelectBuildType"},
        b = {"<cmd>CMake build<CR>", "BuildTarget"},
        A = {"<cmd>CMake build_all<CR>", "BuildAll"},
        r = {"<cmd>CMake build_and_run<CR>", "Run"},
        d = {"<cmd>CMake build_and_debug<CR>", "DebugTarget"},
        c = {"<cmd>CMake cancel<CR>", "Cancel"},
        s = {"<cmd>CMake set_target_args<CR>", "SetArg"}
    },

    d = {
        name = "Debug",
        R = {"<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor"},
        E = {"<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input"},
        X = {"<cmd>lua require'dap'.terminate()<cr>", "Terminate"},
        -- C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
        T = {"<cmd>lua require'dapui'.toggle('sidebar')<cr>", "Toggle Sidebar"},
        p = {"<cmd>lua require'dap'.pause()<cr>", "Pause"},
        r = {"<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl"},
        q = {"<cmd>lua require'dap'.close()<cr>", "Quit"}
    },

    T = {
        name = "Trouble",
        t = {"<cmd>Trouble<cr>", "ToggleTrouble"},
        d = {"<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics"},
        w = {"<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics"},
        q = {"<cmd>Trouble quickfix<cr>", "Quick Fix"},
        u = {"<cmd>Trouble lsp_references<cr>", "Usage"}
    },

    P = {
        name = "Packer",
        c = {"<cmd>PackerCompile<cr>", "Compile"},
        i = {"<cmd>PackerInstall<cr>", "Install"},
        s = {"<cmd>PackerSync<cr>", "Sync"},
        S = {"<cmd>PackerStatus<cr>", "Status"},
        u = {"<cmd>PackerUpdate<cr>", "Update"}
    },

    -- g = {
    --   name = "Git",
    --   b = { "<cmd>VGit buffer_gutter_blame_preview<cr>", "File Blame" },
    --   d = { "<cmd>VGit buffer_diff_preview<cr>", "Diff File" },
    --   D = { "<cmd>VGit project_diff_preview<cr>", "Diff Project" },
    --   s = { "<cmd>VGit buffer_stage<cr>", "Stage File" },
    --   u = { "<cmd>VGit buffer_unstage<cr>", "Unstage File" },
    --   r = { "<cmd>VGit buffer_reset<cr>", "Reset File" },
    --   f = { "<cmd>VGit buffer_history_preview <cr>", "Reset File" },
    --
    --   B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    --   c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    -- },

    -- g = {
    --     name = "Git",
    --     g = {"<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit"},
    --     f = {"<cmd>DiffviewFileHistory<CR>", "File History"},
    --     p = {"<cmd>DiffviewOpen<CR>", "Diff Project"},
    --     n = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
    --     N = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
    --     l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
    --     r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
    --     R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"},
    --     s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
    --     u = {"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk"},
    --     t = {"<cmd>Gitsigns setloclist<cr>", "Open changed file"},
    --     o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
    --     b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
    --     c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
    --     d = {"<cmd>Gitsigns diffthis HEAD<cr>", "Diff"}
    -- },

    -- R = {
    --     name = "Replace",
    --     f = {"<cmd>lua require('spectre').open_file_search()<CR>", "Replace File"},
    --     p = {"<cmd>lua require('spectre').open()<CR>", "Replace Project"},
    --     s = {"<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search"}
    -- },

    l = {
        name = "LSP",
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        w = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        I = {"<cmd>LspInstallInfo<cr>", "Installer Info"},
        j = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic"},
        k = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic"},
        q = {"<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"}
    },

    H = {
        name = "Help",
        -- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
        C = {"<cmd>Telescope commands<cr>", "Commands"}
    }

}

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>" -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2}, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left" -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = {"j", "k"},
        v = {"j", "k"}
    }
}

which_key.setup(setup)
which_key.register(mappings, opts)
