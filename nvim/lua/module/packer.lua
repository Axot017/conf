local function bootstrap_packer()
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end

local function install_plugins(use, use_rocks)
  use { "wbthomason/packer.nvim", commit = "4dedd3b08f8c6e3f84afbce0c23b66320cd2a8f2" }
  use { "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }
  use { "nvim-lua/plenary.nvim", commit = "2de0ff7afd4ae49b9706599b5773876025469127" }
  use { "nvim-telescope/telescope.nvim", commit = "8c563017200bebd76153feb1046ecdf2db26c9d4" }
  use { "nvim-treesitter/nvim-treesitter", commit = "783c74cefc21eda9602acc3f50409432c95c76b8" }
  use { "p00f/nvim-ts-rainbow", commit = "9dd019e84dc3b470dfdb5b05e3bb26158fef8a0c" }
  use { "tpope/vim-surround", commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea" }
  use { "lewis6991/impatient.nvim", commit = "2aa872de40dbbebe8e2d3a0b8c5651b81fe8b235" }
  use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  use { "windwp/nvim-autopairs", commit = "972a7977e759733dd6721af7bcda7a67e40c010e" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "numToStr/Comment.nvim", commit = "2e0572cc35ecc117c0ab6dc0aa3132b109d61047" }
  use { 'lewis6991/gitsigns.nvim', commit = "4883988cf8b623f63cc8c7d3f11b18b7e81f06ff" }
  use { 'nvim-lualine/lualine.nvim', commit = "5f68f070e4f7158517afc55f125a6f5ed1f7db47" }
  use { 'akinsho/bufferline.nvim', commit = "bf9eb696c2f640c812374f5eead740b189adcccf" }
  use { "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" }
  use { "kyazdani42/nvim-tree.lua", commit = "d927e89aa9b8a88dba5c58bfbf67586de01ed8dd" }
  use { "folke/trouble.nvim", commit = "da61737d860ddc12f78e638152834487eabf0ee5" }
  use { "akinsho/toggleterm.nvim", commit = "1a8b330d3da8b5ee3d726cdc1797ac83ef84b695" }
  use { "mfussenegger/nvim-dap", commit = "c0f43f43b3093c9716b338925b50c8c36eb72f24" }
  use { "rcarriga/nvim-dap-ui", commit = "225115ae986b39fdaffaf715e571dd43b3ac9670" }
  use { "akinsho/flutter-tools.nvim", commit = "89a47278d9d27537735ae4e5e97acfc58ceebf2b" }
  use { "weilbith/nvim-code-action-menu", commit = "a864a79c8e024d4f5d95915210188c9c3430b160", cmd = "CodeActionMenu" }
  use { "nvim-treesitter/nvim-treesitter-context", commit = "200f9272fdf6c0a239509752fed071fdc63d1190" }

  use { "hrsh7th/nvim-cmp", commit = "c4dcb1244a8942b8d2bd3c0a441481e12f91cdf1" }
  use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }
  use { "hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use { "hrsh7th/cmp-cmdline", commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252" }
  use { "L3MON4D3/LuaSnip", commit = "be3083bbb8ebc21671bf7c91c27f043ebe0a8d8d" }
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }

  use { "neovim/nvim-lspconfig", commit = "99596a8cabb050c6eab2c049e9acde48f42aafa4" }
  use { "williamboman/nvim-lsp-installer", commit = "d1d888fda594ffcf41213ba4df40a9478096b226" }

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
    autocmd BufWritePost packer.lua source <afile> | PackerSync
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
