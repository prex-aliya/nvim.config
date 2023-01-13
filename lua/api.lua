-- Enabels Spell Check in txt, markdown, and latex files
nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

-- vim: tw=80
