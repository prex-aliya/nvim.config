vim.g['rainbow_active'] = '1'
vim.g.coc_global_extensions = {
    'coc-emmet',
    'coc-html',
    'coc-prettier',
    'coc-rust-analyzer',
    'coc-json',
    'coc-css',
    'coc-clangd',
    'coc-jedi'
}
-- coc-rust-analyzer if failed to load, need to reload workspace try updating
-- rust

-- ZenMode {{{
require("zen-mode").setup({
  window = {
    width = 128 --.75 -- width will be 85% of the editor width
  }
})
---- }}}


-- vim: tw=80
