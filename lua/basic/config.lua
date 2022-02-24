-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Plugin-Independent Configs ❱━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
--[[
	 NOTE:
		every configs in this file are independent of any plugin
		configs for plugins are in "lua/plugins" directory and each plugin has
		it's own config file. some settings are already default in neovim so you
		don't need to define explicitly but it won't make any difference
    :end of NOTE
]] --
local cmd = vim.cmd -- execute Vim commands



-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- jump to the last position when reopening a file
cmd([[
	if has("autocmd")
		au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	endif
]])

cmd([[autocmd VimLeave,VimSuspend * set guicursor=a:hor20]])
