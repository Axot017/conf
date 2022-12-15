require("mason").setup()
require("mason-lspconfig").setup {
  automatic_installation = true
}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

require("mason-lspconfig").setup_handlers {
    function (server_name)
      require("lspconfig")[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
}
