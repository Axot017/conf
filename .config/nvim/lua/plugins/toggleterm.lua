local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
	vim.notify("toggleterm not found")
	return
end

toggleterm.setup({
	direction = "float",
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<C-t>", "<cmd>lua _toggle_fish()<cr>", opts)
	vim.keymap.set("t", "<ESC>", "<cmd>lua _toggle_fish()<cr>", opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
