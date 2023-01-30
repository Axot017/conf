local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
  vim.notify("Comment not installed")
  return
end

gitsigns.setup({
  current_line_blame = false,
})
