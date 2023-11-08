local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	vim.notify("nvim-treesitter.configs not installed")
	return
end

configs.setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
	ignore_install = { "lua" },
	indent = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})
