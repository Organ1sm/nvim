-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--    Plugin:    packer.nvim
--    Github:    github.com/wbthomason/packer.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- If you want to automatically ensure that packer.nvim is installed on any machine you clone your configuration to,
-- add the following snippet (which is due to @Iron-E) somewhere in your config before your first usage of packer:
--
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Improve Start-UP time
    use { -- Speed up loading Lua modules in Neovim to improve startup time.
        'lewis6991/impatient.nvim',
        config = [[require('plugins/nvim-impatient')]]
    }

    -- Easily speed up your neovim startup time!. A faster version of filetype.vim
    use {'nathom/filetype.nvim', config = [[ require('plugins/nvim-filetype')]]}

    -- =====================================================================================================
    -- ====================================== lsp ==========================================================
    -- A collection of common configurations for Neovim's built-in language server client
    use {'neovim/nvim-lspconfig', config = [[ require('lsp/nvim-lsp-config') ]]}

    -- Companion plugin for nvim-lspconfig that allows you to seamlessly install LSP servers locally (inside :echo stdpath("data")).
    use {'williamboman/nvim-lsp-installer', config = [[ require('lsp/nvim-lsp-installer') ]]}

    -- vscode-like pictograms for neovim lsp completion items Topics
    use {'onsails/lspkind-nvim', config = [[ require('lsp/lspkind-nvim') ]]}

    -- Utility functions for getting diagnostic status and progress messages from LSP servers, for use in the Neovim statusline
    use {'nvim-lua/lsp-status.nvim', config = [[ require('lsp/lsp-status') ]]}

    use {"ray-x/lsp_signature.nvim", config = [[ require('lsp/lsp-signature') ]]}
    use {'tami5/lspsaga.nvim', config = [[ require("lsp/nvim-lspsaga") ]]}
    use {"j-hui/fidget.nvim", config = [[ require("lsp/nvim-fidget") ]]}
    -- use {"kosayoda/nvim-lightbulb", config = [[require("lsp/nvim-lightbulb") ]]}
    -- ====================================================================================================

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {'nvim-treesitter/playground', opt = true},
        run = ':TSUpdate',
        config = [[ require('plugins/nvim-treesitter') ]]
    }

    use {"p00f/nvim-ts-rainbow", after = "nvim-treesitter", requires = {"nvim-treesitter"}}

    -- Sippet Engine for Neovim written in Lua.
    use {
        'L3MON4D3/LuaSnip',
        requires = {
            "rafamadriz/friendly-snippets" -- Snippets collection for a set of different programming languages for faster development.
        },
        config = [[ require('plugins/LuaSnip') ]]
    }

    -- A completion plugin for neovim coded in Lua.
    use {'hrsh7th/nvim-cmp', config = [[ require('plugins/nvim-cmp') ]]}

    use {'hrsh7th/cmp-nvim-lsp'} -- { name = nvim_lsp }
    use {'hrsh7th/cmp-nvim-lua'} -- { name = nvim_lua }
    use {'hrsh7th/cmp-buffer'} -- { name = 'buffer' },
    use {'hrsh7th/cmp-path'} -- { name = 'path' }
    use {'hrsh7th/cmp-cmdline'} -- { name = 'cmdline' }
    use {"hrsh7th/cmp-emoji"}
    use {"saadparwaiz1/cmp_luasnip"} -- luasnip completion source for nvim-cmp
    -- A super powerful autopairs for Neovim. It support multiple character.
    use {'windwp/nvim-autopairs', config = [[ require('plugins/nvim-autopairs') ]]}

    use {'kevinhwang91/nvim-hlslens', config = [[ require("plugins/nvim-hlslens") ]]}

    -- Find, Filter, Preview, Pick. All lua, all the time.
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}, -- FZF sorter for telescope written in c
            "BurntSushi/ripgrep",
            "sharkdp/fd"
        },
        config = [[ require('plugins/telescope-nvim') ]]
    }

    use {'skywind3000/asyncrun.vim'}
    use {'skywind3000/asynctasks.vim'}

    -- Use (neo)vim terminal in the floating/popup window.
    use {'voldikss/vim-floaterm', config = [[ require('plugins/vim-floaterm') ]]}

    use {'kyazdani42/nvim-web-devicons', config = [[ require('plugins/nvim-web-devicons') ]]}

    use {'numToStr/Comment.nvim', config = [[ require('plugins/nvim-comment') ]]}

    use {"ur4ltz/surround.nvim", config = [[ require('plugins/nvim-surround') ]]}

    -- use {"rmagatti/auto-session", config = [[ require("plugins/nvim-autosession") ]]}

    use {"ethanholz/nvim-lastplace", config = [[ require("plugins/nvim-lastplace") ]]}

    use {"Pocco81/AutoSave.nvim", config = [[ require ('plugins/nvim-autosave')]]}

    use {"rcarriga/nvim-notify", config = [[require("plugins/nvim-notify")]]}

    use {"folke/todo-comments.nvim", config = [[require("plugins/nvim-todos-comment")]]}

    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    use {'jose-elias-alvarez/null-ls.nvim', config = [[ require('plugins/nvim-null-ls') ]]}

    use {'lukas-reineke/indent-blankline.nvim', config = [[ require('plugins/nvim-indent-blankline') ]]}
    use {"phaazon/hop.nvim", config = [[ require("plugins/hop-nvim") ]]}
    use {"norcalli/nvim-colorizer.lua", config = [[ require("plugins/nvim-colorizer") ]]}

    -- use { -- Git signs written in pure lua
    --     'lewis6991/gitsigns.nvim',
    --     requires = {'nvim-lua/plenary.nvim'},
    --     config = [[ require('plugins/gitsigns_nvim') ]]
    -- }

    -- use { -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
    --     'folke/trouble.nvim',
    --     config = [[ require('plugins/trouble_nvim') ]]
    -- }
    use {"folke/which-key.nvim", config = function() require("which-key").setup {} end}

    -- A snazzy bufferline for Neovim
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[ require('plugins/nvim-bufferline') ]]
    }

    use {'simrat39/symbols-outline.nvim', config = [[ require('plugins/nvim-symbols-outline') ]]}

    use {'kyazdani42/nvim-tree.lua', config = [[ require('plugins/nvim-tree') ]]}

    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'}, config = [[ require('plugins/lualine') ]]}

    -- fast and highly customizable greeter for neovim.
    use {
        "goolord/alpha-nvim",
        requires = {'kyazdani42/nvim-web-devicons'},
        config = [[ require('plugins/alpha-nvim') ]]
    }

    use {"projekt0n/github-nvim-theme", config = [[ require('plugins/github-nvim-theme') ]], opt = true}

    use {"navarasu/onedark.nvim", config = [[ require ('plugins/onedark-theme') ]], opt = true}

    use {
        "olimorris/onedarkpro.nvim",
        config = [[ require("plugins/onedarkpro-theme") ]] --
    }

    -- ━━━━━━━━━━━━━━━━━❰ DEVELOPMENT ❱━━━━━━━━━━━━━━━━━ --

    ----           for flutter/dart
    -- use { -- Tools to help create flutter apps in neovim using the native lsp
    --     'akinsho/flutter-tools.nvim',
    --     ft = {'dart'},
    --     requires = {
    --         {'nvim-lua/plenary.nvim'},
    --         {'Neevash/awesome-flutter-snippets'}, -- collection snippets and shortcuts for commonly used Flutter functions and classes
    --         {
    --             'dart-lang/dart-vim-plugin', -- Syntax highlighting for Dart in Vim
    --             config = [[ require('plugins/dart-vim-plugin') ]]
    --         }
    --     },
    --     config = [[ require('plugins/flutter-tools_nvim') ]]
    -- }

    -- --            for Web-Development
    -- use { --  Use treesitter to auto close and auto rename html tag, work with html,tsx,vue,svelte,php.
    --     "windwp/nvim-ts-autotag",
    --     ft = {'html', 'tsx', 'vue', 'svelte', 'php'},
    --     requires = {'nvim-treesitter/nvim-treesitter'},
    --     config = [[ require('plugins/nvim-ts-autotag') ]]
    -- }
    -- ━━━━━━━━━━━━━━❰ end of DEVELOPMENT ❱━━━━━━━━━━━━━ --

end)
