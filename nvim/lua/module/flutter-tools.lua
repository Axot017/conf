local status_ok, ft = pcall(require, "flutter-tools")

if not status_ok then
  vim.notify("flutter-tools not installed")
  return
end

ft.setup {
  fvm = true,
  lsp = {
    settings = {
      lineLength = 120
    }
  },
  debugger = {
    enabled = true,
    run_via_dap = false,
    register_configurations = function(_)
      require("dap").configurations.dart = {}
      require("dap.ext.vscode").load_launchjs()
    end,
  }
}
