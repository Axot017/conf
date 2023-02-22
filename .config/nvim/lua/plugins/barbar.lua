local status, bufferline = pcall(require, "bufferline")

if not status then
  vim.notify("barbar not installed")
  return
end

bufferline.setup({
  exclude_name = { "[dap-repl]", "__FLUTTER_DEV_LOG__" },
})
