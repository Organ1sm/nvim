--    Author:     Organ1sm
--    Github:     github.com/Organ1sm
-- ───────────────────────────────────────────────── --
-- mapping leader here. it will work for every mapped
vim.g.mapleader = ' '
vim.g.maplocalleader = '|'

-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --

-- plugin config to improve start-up time.
-- it should be always on top on init.lua file
-- require('plugins/impatient_nvim') -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your
-- require('plugins/filetype_nvim') -- Easily speed up your neovim startup time!

require('basicConfig') -- plugin independent configs
require('keymapping')
require('plugins')

-- ━━━━━━━━━━━━━━━━━❰ end of Load ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
