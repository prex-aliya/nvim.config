-- Install packer {{{
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        is_bootstrap = true
        vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
        vim.cmd [[packadd packer.nvim]]
end
-- }}}
-- Packages {{{
require('packer').startup(function(use)
        -- Package manager
        use 'wbthomason/packer.nvim'
        use 'nvim-tree/nvim-web-devicons'
        use 'lewis6991/gitsigns.nvim'

        use({
                "iamcco/markdown-preview.nvim",
                run = function() vim.fn["mkdp#util#install"]() end,
        })

        use({
                "aserowy/tmux.nvim",
                config = function()
                        require("terminal.plugin_tmux").setup()
                end,
        })
        use { -- LSP Configuration & Plugins
                'neovim/nvim-lspconfig',
                requires = {
                        -- Automatically install LSPs to stdpath for neovim
                        'williamboman/mason.nvim',
                        'williamboman/mason-lspconfig.nvim',

                        -- Useful status updates for LSP
                        'j-hui/fidget.nvim',

                        -- Additional lua configuration, makes nvim stuff amazing
                        'folke/neodev.nvim',
                },
        }
        use { -- Autocompletion
                'hrsh7th/nvim-cmp',
                requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
        }

        if is_bootstrap then
                require('packer').sync()
        end
end)
-- }}}
-- Else {{{
-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
        print '=================================='
        print '    Plugins are being installed'
        print '    Wait until Packer completes,'
        print '       then restart nvim'
        print '=================================='
        return
end
-- }}}

-- config vvv

-- Tmux {{{
require("tmux").setup({
        copy_sync = {
                enable = true,
                redirect_to_clipboard = true,
        },
        navigation = {
                cycle_navigation = false,
                enable_default_keybindings = true,
                persist_zoom = true,
        },
        resize = {
                enable_default_keybindings = true,
        },
})
-- }}}
-- lsp/nvim-cmp {{{
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
Servers = {
        -- gopls = {},
        -- tsserver = {},
        clangd = {},
        pyright = {},
        rust_analyzer = {},
        cmake = {},
        html = {},
        ltex = {},
        --sumneko_lua = {},
}


-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
        snippet = {
                expand = function(args)
                        luasnip.lsp_expand(args.body)
                end,
        },
        mapping = cmp.mapping.preset.insert {
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                        else
                                fallback()
                        end
                end, { 'i', 's' }),
        },
        sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
        },
}
-- }}}
-- Markdown-Preview
vim.g.mkdp_browser = 'surf'


-- vim: tw=80
