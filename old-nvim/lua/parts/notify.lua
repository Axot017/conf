local ok, notify = pcall(require, 'notify')

if not ok then
  vim.notify('notify not installed')
  return
end

notify.setup {
  stages = "fade_in_slide_out",
  on_open = nil,
  on_close = nil,
  render = "default",
  background_colour = "Normal",
  minimum_width = 10,
}

vim.notify = notify
require("telescope").load_extension("notify")
