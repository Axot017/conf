local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("nvim-lsp-installer not installed")
	return
end

local setup = require("parts.lsp.setup")

function setup_config(server)
	local opts = {
		on_attach = setup.on_attach,
		capabilities = setup.capabilities,
	}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("parts.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("parts.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	server:setup(opts)
end

lsp_installer.on_server_ready(setup_config)
