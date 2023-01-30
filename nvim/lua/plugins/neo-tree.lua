local status, neo_tree = pcall(require, "neo-tree")

if not status then
	vim.notify("neo-tree not installed")
	return
end

neo_tree.setup({})
