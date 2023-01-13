local set = vim.opt


set.tw = 80

-- visuals
set.background = "dark" -- background {dark, light}
set.visualbell = true
set.relativenumber = true
set.foldmethod = "marker"

-- statusline
vim.opt.laststatus = 2
vim.cmd([[ set noshowmode ]])


-- tabs
set.tabstop = 8
set.softtabstop = 8
set.shiftwidth = 8
set.expandtab = true

set.splitbelow = true
set.splitright = true


-- Set highlight on search
vim.o.hlsearch = false
-- Save undo history
set.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true
-- Decrease update time
set.updatetime = 400
set.signcolumn = "yes"
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
