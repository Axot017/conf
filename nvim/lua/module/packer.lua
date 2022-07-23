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
  use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb"}

  use { "hrsh7th/nvim-cmp", commit = "c4dcb1244a8942b8d2bd3c0a441481e12f91cdf1" }
  use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }
  use { "hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use { "hrsh7th/cmp-cmdline", commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252" }
  use { "L3MON4D3/LuaSnip", commit = "be3083bbb8ebc21671bf7c91c27f043ebe0a8d8d" }

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
