-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Plugin-Independent Configs ❱━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
local cmd = vim.cmd -- execute Vim commands

-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- jump to the last position when reopening a file
-- cmd([[
-- 	if has("autocmd")
-- 		au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
-- 	endif
-- ]])

cmd([[autocmd VimLeave,VimSuspend * set guicursor=a:hor20]])
cmd([[ :nnoremap <c-z> <nop><cr> ]])

-- recognise libstdc++/libc++ header file which doesn't have an extension 
-- such as iostream/vector
vim.api.nvim_create_augroup('set_filetype_for_stdlib', {})
vim.api.nvim_create_autocmd('BufRead', {
	group = 'set_filetype_for_stdlib',
	pattern = '/usr/include/c++/*',
	command = 'set ft=cpp',
})
