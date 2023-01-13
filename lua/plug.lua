local fn = vim.fn

local ensure_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function()
  	use 'wbthomason/packer.nvim'

        use 'lervag/vimtex'
        use 'pdurbin/vim-tsv'
        use 'preservim/vim-markdown'

        use 'nvim-tree/nvim-tree.lua'
        use 'nvim-tree/nvim-web-devicons'

        use {'neoclide/coc.nvim', branch = 'release'}
        use 'preservim/tagbar'
        use 'sheerun/vim-polyglot'
        use 'rentalcustard/exuberant-ctags'

        --use 'luochenn1990/rainbow'
        use 'ntpeters/vim-better-whitespace'

        use 'neomake/neomake'
        --use 'terrortylor/nvim-commit'

        use 'folke/zen-mode.nvim'

        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.0',
                requires = { {'nvim-lua/plenary.nvim'} }
        }
        use 'nvim-treesitter/nvim-treesitter'

        -- install without yarn or npm
        use({
                'iamcco/markdown-preview.nvim',
                run = function() vim.fn["mkdp#util#install"]() end,
        })

    	  if packer_bootstrap then
                require('packer').sync()
        end
end)
