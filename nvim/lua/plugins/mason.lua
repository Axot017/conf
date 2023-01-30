local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason not installed")
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig not installed")
  return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not installed")
  return
end

mason.setup()
mason_lspconfig.setup {
  automatic_installation = true
}

local on_attach = require("plugins.lsp").on_attach
local capabilities = require("plugins.lsp").capabilities

mason_lspconfig.setup_handlers {
    function (server_name)
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
}
