vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'vim-airline/vim-airline'

  -- Filer
  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'airblade/vim-gitgutter'
  use 'simeji/winresizer'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'github/copilot.vim'
  use 'mattn/vim-goimports'
  use 'tpope/vim-surround'
end)
