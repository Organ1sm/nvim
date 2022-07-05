local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
    icons = {expanded = "▾", collapsed = "▸"},
    mappings = {
        -- Use a table to apply multiple mappings
        expand = {"o", "<2-LeftMouse>", "<CR>"},
        open = "O",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t"
    },
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                {id = "scopes", size = 0.25},
                "breakpoints",
                "stacks",
                "watches"
            },
            size = 40, -- 40 columns
            position = "left"
        },
        {
            elements = {"repl", "console"},
            size = 0.25, -- 25% of total lines
            position = "bottom"
        }
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {close = {"q", "<Esc>"}}
    },
    windows = {indent = 1}
})
dap.defaults.fallback.terminal_win_cmd = '40vsplit new' -- this will be overrided by dapui

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
end
