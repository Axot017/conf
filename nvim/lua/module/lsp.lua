local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not installed")
  return
end

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("nvim-lsp-installer not installed")
  return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  vim.notify("cmp_nvim_lsp not installed")
  return
end

local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "כֿ" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text     = true,
    signs            = {
      active = signs,
    },
    update_in_insert = true,
    underline        = true,
    severity_sort    = true,
    float            = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

local function lsp_highlight_document(client)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.keymap.set("n", "<Leader>a", "<cmd>CodeActionMenu<CR>", opts)
  vim.keymap.set("v", "<Leader>a", "<cmd>CodeActionMenu<CR>", opts)
  vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
  vim.keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.keymap.set(
    "n",
    "<Leader>ld",
    '<cmd>lua vim.diagnostic.open_float(0, { border = "rounded" })<CR>',
    opts
  )
  vim.keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

M.capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function setup_config(server)
  local opts = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }
  server:setup(opts)
end

lsp_installer.on_server_ready(setup_config)

return M
