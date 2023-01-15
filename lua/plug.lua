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
        -- Fuzzy Finder (files, lsp, etc)
        use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

        use { -- Highlight, edit, and navigate code
                'nvim-treesitter/nvim-treesitter',
                run = function()
                        pcall(require('nvim-treesitter.install').update { with_sync = true })
                end,
        }
        -- Additional text objects via treesitter
        use { 'nvim-treesitter/nvim-treesitter-textobjects',
                after = 'nvim-treesitter',
        }



        -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
        local has_plugins, plugins = pcall(require, 'custom.plugins')
        if has_plugins then
                plugins(use)
        end

        if is_bootstrap then
                require('packer').sync()
        end
end)
-- }}}
-- else {{{
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

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
        group = packer_group,
        pattern = vim.fn.expand '$MYVIMRC',
})



local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        rust_analyzer = {},
        -- tsserver = {},

        sumneko_lua = {
                Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                },
        },
}
-- }}}

-- config vvv




-- ZenMode {{{
--require("zen-mode").setup({
--  window = {
--    width = 128 --.75 -- width will be 85% of the editor width
--  }
--})
---- }}}
-- lsp/nvim-cmp {{{
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
Servers = {
  clangd = {},
  -- gopls = {},
  pyright = {},
  rust_analyzer = {},
  -- tsserver = {},
  cmake = {},
  html = {},

  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
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



-- vim: tw=80
