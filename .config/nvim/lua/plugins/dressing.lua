local status_ok, dressing = pcall(require, "dressing")

if not status_ok then
  vim.notify("dressing not installed")
  return
end

dressing.setup()
