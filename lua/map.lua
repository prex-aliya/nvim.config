-- set leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = " "
vim.g.localleader = "," -- local leader


-- telescope {{{
--require('telescope').setup { defaults = { mappings = { i = {
--        ['<C-u>'] = false,
--        ['<C-d>'] = false,
--},},},}
--
---- Enable telescope fzf native, if installed
--pcall(require('telescope').load_extension, 'fzf')
--vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
--vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
--vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
--vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- }}}


-- Split
vim.keymap.set('n', '<Leader>s', ':split<CR>')
vim.keymap.set('n', '<Leader>v', ':vsplit<CR>')

-- Escape the terminal
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- leader
vim.keymap.set('n', '<Leader>t', ':terminal<CR>')
vim.keymap.set('n', '<Leader><Leader>t', ':vsplit<CR>:terminal<CR>')
vim.keymap.set('n', '<Leader><Leader>T', ':split<CR>:terminal<CR>:horizontal resize 15<CR>')

-- Wrap
vim.keymap.set('n', '<S-w>', ':set wrap!<CR>')

-- keymap change
vim.keymap.set('n', '<Leader>k', ':set keymap=kana<CR>') -- mainly to not forget
