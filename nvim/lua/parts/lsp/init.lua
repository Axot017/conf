local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not installed")
	return
end

require("parts.lsp.lsp-installer")
require("parts.lsp.setup").setup()
require("parts.lsp.nullls")

