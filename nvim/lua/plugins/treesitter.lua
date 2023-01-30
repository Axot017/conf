local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  vim.notify("nvim-treesitter.configs not installed")
  return
end

configs.setup {
  auto_install = true,
}
