local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.stylua,
	b.formatting.rustfmt,
	b.formatting.dart_format,
	b.formatting.terraform_fmt,
	b.formatting.yamlfmt,
	b.formatting.taplo,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
