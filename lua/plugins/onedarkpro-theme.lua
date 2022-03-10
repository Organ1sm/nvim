local onedarkpro = require("onedarkpro")

onedarkpro.setup({
    -- Theme can be overwritten with 'onedark' or 'onelight' as a string!
    theme = function()
        if vim.o.background == "dark" then
            return "onedark"
        else
            return "onelight"
        end
    end,

    colors = {
        onedark = {
            bg = "#21252b" -- yellow
        }
    }, -- Override default colors. Can specify colors for "onelight" or "onedark" themes by passing in a table
    plugins = { -- Override which plugins highlight groups are loaded
        native_lsp = true,
        -- nvim_cmp = false,
        polygot = true,
        treesitter = true
        -- Others omitted for brevity
    },
    hlgroups = {
        CmpItemAbbrMatch = {fg = "#118dc3", style = "bold"},
        NvimTreeNormal = {bg = "#1b1f27"},
        NvimTreeNormalNC = {bg = "#1b1f27"}
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
    }
})
onedarkpro.load()
