require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = {
        "alpha",
        "terminal",
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        -- 'NvimTree',
        'lsp-installer'
    },
    buftype_exclude = {"terminal"},
    use_treesitter = true,
    show_end_of_line = true
})
