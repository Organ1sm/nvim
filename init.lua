--                          Author:     Organ1sm
--                          Github:     github.com/Organ1sm
-- ───────────────────────────────────────────────── --
-- ────────────────❰ Leader Mapping ❱─────────────── --
-- mapping leader here. it will work for every mapped
vim.g.mapleader = ' '
vim.g.maplocalleader = '|'
-- ───────────────────────────────────────────────── --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --

-- plugin config to improve start-up time.
-- it should be always on top on init.lua file
-- require('plugins/impatient_nvim') -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your
-- require('plugins/filetype_nvim') -- Easily speed up your neovim startup time!

require('basicConfig') -- plugin independent configs
require('keymapping')

-- load/source PLUGINS CONFIGS
-- loading plugins and its configs are managed in seperate config file
-- ~/.config/nvim/lua/plugins/packer_nvim.lua
-- NOTE: laways load plugins at last
require('plugins')

-- ━━━━━━━━━━━━━━━━━❰ end of Load ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
