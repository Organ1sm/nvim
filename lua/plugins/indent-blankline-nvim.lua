require("indent_blankline").setup({
    -- 显示当前所在区域
    show_current_context = true,
    -- 显示当前所在区域的开始位置
    show_current_context_start = true,
    filetype_exclude = {"alpha"},
    buftype_exclude = {"terminal"}
    -- 显示行尾符
    -- show_end_of_line = true
})
