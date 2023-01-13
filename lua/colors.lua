function Color(color)
	vim.cmd([[ source ./MinePink.vim ]])

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


Color()

-- set colorscheme
vim.o.termguicolors = true
