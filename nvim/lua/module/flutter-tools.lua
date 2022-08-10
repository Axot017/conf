local status_ok, ft = pcall(require, "flutter-tools")

if not status_ok then
  vim.notify("flutter-tools not installed")
  return
end

ft.setup {
  fvm = true,
  lsp = {
    capabilities = require("module.lsp").capabilities,
    on_attach = require("module.lsp").on_attach,
    settings = {
      lineLength = 120
    }
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          "repl",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
    register_configurations = function(_)
      require("dap").configurations.dart = {}
      require("dap.ext.vscode").load_launchjs()
    end,
  }
}
