local status, null_ls = pcall(require, "null-ls")

if not status then
	vim.notify("null_ls not installed")
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.stylua,
	b.formatting.rustfmt,
	b.formatting.dart_format,
	b.formatting.terraform_fmt,
	b.formatting.taplo,
	b.formatting.yamlfmt,
	b.code_actions.gitsigns,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
