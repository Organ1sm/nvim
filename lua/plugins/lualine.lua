--[[
   	PluginName: lualine.nvim
   	Github:     github.com/hoob3rt/lualine.nvim
-- ]] --
-- -- -- Color table for highlights
local colors = {
    bg = '#202328',
    fg = '#bbc2cf',
    black = '#1c1e26',
    white = '#FFFFFF',
    white1 = '#6C6F93',
    red = '#F43E5C',
    red_error = '#800000',
    green = '#09F7A0',
    blue = '#25B2BC',
    yellow = '#F09383',
    gray = '#E95678',
    darkgray = '#1A1C23',
    lightgray = '#2E303E',
    inactivegray = '#1C1E26',
    cyan = '#008080',
    darkblue = '#081633',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd'
}

local lsp_status = require("lsp-status")
-- copied from https://gist.github.com/hoob3rt/b200435a765ca18f09f83580a606b878#file-evil_lualine-lua-L21
local conditions = {
    buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,

    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
}

-- Lsp server name .
local function getLspServerName()
    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            if client.name ~= "null-ls" then return "[" .. client.name .. "]" end
        end
    end
    return msg
end

function _G.set_lualine_diagnostic_highlights()
    vim.cmd('highlight my_hl_warn guifg=Orange guibg=#504945')
    vim.cmd('highlight my_hl_error guifg=Red guibg=#504945')
    vim.cmd('highlight my_hl_hint guifg=Green guibg=#504945')
end
vim.cmd('autocmd ColorScheme * :call v:lua.set_lualine_diagnostic_highlights()')

--[[
Lualine has sections as shown below.
+-------------------------------------------------+
| A | B | C                             X | Y | Z |
+-------------------------------------------------+
]]
require'lualine'.setup {
    --[[ Setting a theme:
            All available themes are listed in  https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
            16color, ayu_dark, ayu_light, ayu_mirage, codedark, dracula, everforest, gruvbox, gruvbox_light, gruvbox_material,
            horizon, iceberg_dark, iceberg_light, jellybeans, material, modus_vivendi, molokai, nightfly, nord, oceanicnext,
            onedark, onelight, palenight, papercolor_dark, papercolor_light, powerline, seoul256, solarized_dark, solarized_light,
            tomorrow, wombat
         Symbols:
                    ║ ⋰    ∫
    ]]
    options = {
        theme = 'material',
        section_separators = {'', ''}, -- separators between sections
        -- component_separators = {'|', '|'},
        disabled_filetypes = {"NvimTree", "neo-tree", "dashboard", "Outline"}, -- disable lualine for specific filetypes
        icons_enabled = 1, -- displays icons in alongside component
        -- padding                 = 0,              -- adds padding to the left and right of components
        left_padding = 0, -- adds padding to the left of components
        right_padding = 0, -- adds padding to the right of components
        upper = false, -- displays components in uppercase
        lower = false, -- displays components in lowercase
        format = nil -- format function, formats component's output
    },

    sections = {
        lualine_a = {{'mode', right_padding = 0, left_padding = 0, component_separators = ''}},

        lualine_b = {
            {
                'branch',
                -- icon = '',
                condition = conditions.check_git_workspace,
                right_padding = 1,
                component_separators = ''
            }
        },

        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
                condition = conditions.buffer_not_empty,
                left_padding = 1, -- adds padding to the left of components
                right_padding = 1, -- adds padding to the right of components
                component_separators = '',
                icons_enabled = true
            },
            {
                'diff',
                symbols = {added = '+ ', modified = '~ ', removed = '- '},
                color_added = colors.green,
                color_modified = colors.orange,
                color_removed = colors.red,
                condition = conditions.hide_in_width
            }
        },

        lualine_x = {
            {
                lsp_status.status,
                left_padding = 1, -- adds padding to the left of components
                right_padding = 1, -- adds padding to the right of components
                component_separators = {left = '', right = ''}
            },
            {
                'diagnostics',
                sources = {'nvim_diagnostic'},

                -- Displays diagnostics for the defined severity types
                sections = {'error', 'warn', 'info', 'hint'},

                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = 'DiagnosticError', -- Changes diagnostics' error color.
                    warn = 'DiagnosticWarn', -- Changes diagnostics' warn color.
                    info = 'DiagnosticInfo', -- Changes diagnostics' info color.
                    hint = 'DiagnosticHint' -- Changes diagnostics' hint color.
                },
                symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
                colored = true, -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false, -- Show diagnostics even if there are none.
                component_separators = {left = '', right = ''}
            },
            {
                getLspServerName,
                color = {fg = colors.white, gui = 'bold'},
                left_padding = 0, -- adds padding to the left of components
                right_padding = 0, -- adds padding to the right of components
                component_separators = {left = '', right = ''}
            }

        },

        lualine_y = {
            {
                'encoding',
                component_separators = {left = '', right = ''},
                left_padding = 1, -- adds padding to the right of components
                right_padding = 0
            },
            {
                'fileformat',
                upper = true,
                icons_enabled = true,
                left_padding = 0, -- adds padding to the right of components
                component_separators = {left = "", right = ""}
            },
            {
                'filetype',
                colored = true, -- displays filetype icon in color if set to `true` ,
                format = function() return " " end
            }
        },

        lualine_z = {{'location', right_padding = 1, icon = ''}}
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },

    tabline = {},
    extensions = {}
}
