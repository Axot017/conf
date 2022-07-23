local function bootstrap_packer()
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end

local function install_plugins(use, use_rocks)
  use { "wbthomason/packer.nvim", commit = "4dedd3b08f8c6e3f84afbce0c23b66320cd2a8f2" }
  use { "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }
  use { "nvim-lua/plenary.nvim", commit = "2de0ff7afd4ae49b9706599b5773876025469127" }

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
