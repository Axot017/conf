local status_ok, dapui = pcall(require, "dapui")

if not status_ok then
  vim.notify("dapui not installed")
  return
end

local ok, dap = pcall(require, "dap")

if not ok then
  vim.notify("dap not installed")
  return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
