local status, null_ls = pcall(require, "null-ls")

if not status then
	vim.notify("null_ls not installed")
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.stylua,
	b.formatting.rustfmt,
	b.formatting.ocamlformat,
	b.formatting.dart_format.with({
		extra_args = { "-l", "120" },
	}),
	b.formatting.terraform_fmt,
	b.formatting.taplo,
	b.formatting.yamlfmt,
	b.formatting.gofumpt,
	b.formatting.goimports,
	b.formatting.golines,
	b.code_actions.gitsigns,
  b.formatting.sql_formatter,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
