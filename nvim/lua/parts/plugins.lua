local function bootstrap_packer()
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end

local function install_plugins(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "lunarvim/colorschemes"
  use "Pocco81/AutoSave.nvim"
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "lewis6991/gitsigns.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use 'akinsho/flutter-tools.nvim'
  use 'mfussenegger/nvim-dap'
  use 'nvim-lualine/lualine.nvim'

  -- cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use "p00f/nvim-ts-rainbow"

  -- Nvim tree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  bootstrap_packer()
end

-- Packer setup

local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer not installed")
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(install_plugins)
