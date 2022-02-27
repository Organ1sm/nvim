local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require("luasnip")

cmp.setup {
    -- 指定 snippet 引擎
    snippet = {expand = function(args) require('luasnip').lsp_expand(args.body) end},
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, --
        {name = 'luasnip'}, --
        {name = 'nvim_lua'}, --
        {name = 'emoji'}
    }, --
    {{name = 'buffer'}, {name = 'path'}}),

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
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

cmp.setup({
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Esc>'] = cmp.mapping.close(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})

    }
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
