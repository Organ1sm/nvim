local signature_cfg = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    doc_lines = 9, -- will show two lines of comment/doc

    floating_window = true, -- show hint in a floating window,

    fix_pos = true, -- set to true, the floating window will
    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ", -- Panda for parameter
    hint_scheme = "String",
    use_lspsaga = false, -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    max_height = 18, -- max height of signature floating_window,
    max_width = 120, -- max_width of signature floating_window,
    handler_opts = {
        border = "shadow" -- double, single, shadow, none
    },
    extra_trigger_chars = {} -- Array of extra characters that will
}

return signature_cfg
