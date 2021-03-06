local ok, flutter = pcall(require, "flutter-tools")

if not ok then
  vim.notify("flutter-tools not installed")
  return
end

require("telescope").load_extension("flutter")

flutter.setup {
  ui = {
    border = "rounded",
    notification_style = 'native'
  },
  decorations = {
    statusline = {
      app_version = false,
      device = true,
    }
  },
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
    run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
    register_configurations = function(_)
      local config = require("parts.config-reader").read_config()
      require("dap").configurations.dart = config
    end,
  },
  flutter_path = nil, -- <-- this takes priority over the lookup
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = "> ", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    on_attach = require("parts.lsp.setup").on_attach,
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = { "" },
      renameFilesWithClasses = "prompt",
      enableSnippets = true,
      lineLength = 80,
    }
  }
}
