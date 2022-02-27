-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    null-ls.nvim
--   Github:    github.com/jose-elias-alvarez/null-ls.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
local builtins = require("null-ls.builtins")
local formatting = builtins.formatting

local sources = {
    formatting.prettier,
    formatting.lua_format.with({extra_args = require("formater.lua_format").args}),
    formatting.clang_format,
    formatting.cmake_format.with({extra_args = require("formater.cmake_format").args}),
    formatting.black.with({extra_args = {"--fast"}})
}
-- ───────────────────────────────────────────────── --
-- ─────────────────❰ COMPLETION ❱────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
-- ───────────────❰ end COMPLETION ❱──────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ DIAGNOSTICS ❱───────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- ───────────────❰ end DIAGNOSTICS ❱─────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ CODEACTION ❱────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
-- ───────────────❰ end CODEACTION ❱──────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ───────────────────❰ HOVER ❱───────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
-- ─────────────────❰ end HOVER ❱─────────────────── --
-- ───────────────────────────────────────────────── --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
