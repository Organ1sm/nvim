local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require("luasnip")

local hasWordBefore = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil

end

local feedKey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
    -- 指定 snippet 引擎
    snippet = {expand = function(args) require('luasnip').lsp_expand(args.body) end},
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, --
        {name = 'luasnip'}, --
        {name = 'nvim_lua'}, --
        {name = 'emoji'}
    }, --
    {
        {name = 'buffer'}, --
        {name = 'path'}
    }),

    completion = {keyword_length = 1, completeopt = "menu,noselect"},

    formatting = {
        format = lspkind.cmp_format({
            with_text = false, -- do not show text alongside icons
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            menu = {
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                buffer = "[Buffer]",
                emoji = "[Emoji]"
            }
        })
    }

}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {mapping = cmp.mapping.preset.cmdline(), sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

cmp.setup({
    mapping = {
        ['<Esc>'] = cmp.mapping({
            i = cmp.mapping.abort(), --
            c = cmp.mapping.close()
        }),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace, --
            select = true
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip and luasnip.expand_or_jumpable() then
                feedKey("<Plug>luasnip-expand-or-jump", "")
            elseif hasWordBefore() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip and luasnip.jumpable(-1) then
                feedKey("<Plug>luasnip-jump-prev", "")
            else
                fallback()
            end
        end, {"i", "s"})

    }
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
