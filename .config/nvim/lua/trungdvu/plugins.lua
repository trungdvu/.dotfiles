local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Make packer manage itself
  use 'wbthomason/packer.nvim'

  -- Improve startup time
  use 'lewis6991/impatient.nvim'

  -- Utils
  use 'nvim-lua/plenary.nvim'

  -- Tools
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Looks
  use 'folke/tokyonight.nvim'
  use 'morhetz/gruvbox'
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'norcalli/nvim-colorizer.lua'


  -- Navigations
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {
    run = ":TSUpdate"
  })
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Syntax, code, formatt and highlight
  use("L3MON4D3/LuaSnip")
  use 'akinsho/nvim-bufferline.lua'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Git
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'lewis6991/gitsigns.nvim'
  use 'iamcco/markdown-preview.nvim'


  -- Comment
  use 'terrortylor/nvim-comment'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
end)
