-- =================     ===============     ===============   ========  ========
-- \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
-- ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
-- || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
-- ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
-- || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
-- ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
-- || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
-- ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
-- ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
-- ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
-- ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
-- ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
-- ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
-- ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
-- ||.=='    _-'                                                     `' |  /==.||
-- =='    _-'                        N E O V I M                         \/   `==
-- \   _-'                                                                `-_   /


-- set leader {{{
vim.g.mapleader = " "
vim.g.localleader = ","
-- }}}


-- load legacy options
vim.cmd([[
        source $HOME/.config/nvim/MinePink.vim
]])
--source $HOME/.config/nvim/legacy.vim

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- empty setup using defaults
require("nvim-tree").setup()

-- Packer {{{
-- Set packpath to point to where Packer is installed
local packer_path = vim.fn.stdpath('config') .. '/site'
local config_path = vim.fn.stdpath('config')
local config_files = config_path .. '/?.lua'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path .. ',' .. config_path
-- Set package.path so the "require" statements below work
package.path = package.path .. ';' .. config_files
-- }}}

require('lua/statusline')   -- custom status line "https://elianiva.my.id/post/neovim-lua-statusline/"
require('lua/plug')             -- nvim plugins and configurations
require('lua/global')           -- global variables     "vim.g"
require('lua/api')              -- nvim api calls       "vim.api"
require('lua/map')              -- nvim keymaps         "map()"
require('lua/opt')              -- vim normal set       "vim.opt"


-- vim: tw=80
