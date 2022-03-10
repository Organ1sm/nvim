-- https://github.com/rmagatti/auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
require("auto-session").setup({
    log_level = "info",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = nil,
    auto_restore_enabled = false,
    auto_session_suppress_dirs = nil
})
vim.cmd([[
    autocmd VimLeavePre * silent! :SaveSession
]])


