local status_ok, ft = pcall(require, "flutter-tools")

if not status_ok then
  vim.notify("flutter-tools not installed")
  return
end

ft.setup({
  fvm = true,
  lsp = {
    capabilities = require("plugins.lsp").capabilities,
    on_attach = require("plugins.lsp").on_attach,
    settings = {
      lineLength = 80,
    },
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
    layouts = require("plugins.dap").config.layouts,
    register_configurations = function(_)
      require("dap").configurations.dart = {}
      require("dap.ext.vscode").load_launchjs()
    end,
  },
})