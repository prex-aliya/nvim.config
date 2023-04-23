-- set leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = " "
vim.g.localleader = "," -- local leader



-- Split {{{
vim.keymap.set('n', '<Leader>s', ':split<CR>')
vim.keymap.set('n', '<Leader>v', ':vsplit<CR>')

--vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
--vim.keymap.set('i', '<C-j>', '<C-w><C-j>')
--vim.keymap.set('i', '<C-k>', '<C-w><C-k>')
--vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
--vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
--vim.keymap.set('i', '<C-l>', '<C-w><C-l>')
--vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
--vim.keymap.set('i', '<C-h>', '<C-w><C-h>')

--vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>')
--vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>')
--vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>')
--vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>')
-- }}}
-- Disable arrow keys {{{
vim.keymap.set('', '<up>', '<nop>')
vim.keymap.set('', '<down>', '<nop>')
vim.keymap.set('', '<left>', '<nop>')
vim.keymap.set('', '<right>', '<nop>')
-- }}}
-- telescope {{{
require('telescope').setup { defaults = { mappings = { i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
},},},}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- }}}


-- Escape the terminal
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- leader
vim.keymap.set('n', '<Leader>t', ':terminal<CR>')
vim.keymap.set('n', '<Leader><Leader>t', ':vsplit<CR>:terminal<CR>')
vim.keymap.set('n', '<Leader><Leader>T', ':split<CR>:terminal<CR>:horizontal resize 15<CR>')

-- Wrap
vim.keymap.set('n', '<S-w>', ':set wrap!<CR>')

-- keymap change
vim.keymap.set('n', '<Leader>k', ':set keymap=kana<CR>')
vim.keymap.set('n', '<Leader>m', ':set keymap=<CR>')
