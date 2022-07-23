local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  vim.notify("nvim-treesitter.configs not installed")
  return
end

configs.setup {
  ensure_installed = { "rust", "dart", "comment", "dockerfile", "lua", "toml", "yaml" },
  sync_install = true,
  auto_install = false,
  ignore_install = { "phpdoc" },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
