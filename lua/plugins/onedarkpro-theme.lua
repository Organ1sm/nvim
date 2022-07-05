local onedarkpro = require("onedarkpro")

onedarkpro.setup({
    dark_theme = "onedark", -- The default dark theme
    light_theme = "onelight", -- The default light theme
    theme = function()
        if vim.o.background == "dark" then
            return "onedark"
        else
            return "onelight"
        end
    end,
    colors = {onedark = {bg = "#0d1117"}}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes by passing in a table
    -- colors = {onedark = {bg = "#000000"}}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes by passing in a table
    plugins = { -- Override which plugins highlight groups are loaded
        native_lsp = true,
        -- nvim_cmp = false,
        polygot = true,
        treesitter = true,
        telescope = false
        -- Others omitted for brevity
    },
    hlgroups = {
        CmpItemAbbrMatch = {fg = "#118dc3", style = "bold"},
        NvimTreeNormal = {bg = "#0d1117"},
        NvimTreeNormalNC = {bg = "#0d1117"},
        CursorLine = {bg = "#26292c"}
    },
    styles = {
        strings = "NONE", -- Style that is applied to strings
        comments = "NONE", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        functions = "NONE", -- Style that is applied to functions
        variables = "NONE" -- Style that is applied to variables
    },
    options = {
        bold = true, -- Use the themes opinionated bold styles?
        italic = false, -- Use the themes opinionated italic styles?
        underline = true, -- Use the themes opinionated underline styles?
        undercurl = true, -- Use the themes opinionated undercurl styles?
        cursorline = true, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
        window_unfocussed_color = false -- When the window is out of focus, change the normal background?
    },
    filetype_hlgroups_ignore = {
        filetypes = {
            "^aerial$",
            "^alpha$",
            "^fugitive$",
            "^fugitiveblame$",
            "^help$",
            "^NvimTree$",
            "^packer$",
            "^qf$",
            "^startify$",
            "^startuptime$",
            "^TelescopePrompt$",
            "^TelescopeResults$",
            "^terminal$",
            "^toggleterm$",
            "^undotree$"
        },
        buftypes = {"^terminal$"}

    }
})
onedarkpro.load()
