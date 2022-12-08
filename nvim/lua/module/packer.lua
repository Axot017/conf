local function bootstrap_packer()
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end

local function install_plugins(use)
  use { "wbthomason/packer.nvim", commit = "14571611c06e757f4f5fe46b82657417645c74dc" }
  use { "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }
  use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }
  use { "nvim-treesitter/nvim-treesitter", commit = "a33858d399d0da226b0cf7b45fe9dc8f0a06547b" }
  use { "p00f/nvim-ts-rainbow", commit = "fad8badcd9baa4deb2cf2a5376ab412a1ba41797" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "folke/tokyonight.nvim", commit = "393cc9fdcf0918b206a8a8bbb5c7f64a6721ed2f" }
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "numToStr/Comment.nvim", commit = "a85ca1b96198904e0086eea04580a944e788b7e4" }
  use { 'lewis6991/gitsigns.nvim', commit = "9ff7dfb051e5104088ff80556203634fc8f8546d" }
  use { 'nvim-lualine/lualine.nvim', commit = "edca2b03c724f22bdc310eee1587b1523f31ec7c" }
  use { 'akinsho/bufferline.nvim', commit = "a61991d307e4af75e606aa1241e419d0f532b968" }
  use { "kyazdani42/nvim-web-devicons", commit = "a8cf88cbdb5c58e2b658e179c4b2aa997479b3da" }
  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  use { "folke/trouble.nvim", commit = "929315ea5f146f1ce0e784c76c943ece6f36d786" }
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  use { "mfussenegger/nvim-dap", commit = "bbd3e7e15ac6b5e7aceb680515f7352d6a0953be" }
  use { "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" }
  use { "akinsho/flutter-tools.nvim", commit = "89a47278d9d27537735ae4e5e97acfc58ceebf2b" }
  use { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu", commit = "a864a79c8e024d4f5d95915210188c9c3430b160" }
  use { "nvim-treesitter/nvim-treesitter-context", commit = "c46a8a0a60412a8fe43aa6bd3a01845c46de6bf2" }
  use { "github/copilot.vim", commit = "2f4f9259a5c0f927b31c4256cd3e4d7c6df87662" }

  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use { "hrsh7th/cmp-cmdline", commit = "c66c379915d68fb52ad5ad1195cdd4265a95ef1e" }
  use { "L3MON4D3/LuaSnip", commit = "5406d30283209655d62b673407a57490b2ccf25a" }
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }

  use { "neovim/nvim-lspconfig", commit = "04d66a091886a1db16f8498dbcd01eee715ec409" }
  use { "williamboman/nvim-lsp-installer", commit = "ae913cb4fd62d7a84fb1582e11f2e15b4d597123" }

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
