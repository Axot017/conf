local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local fish_terminal = nil
local lazygit_terminal = nil

function _toggle_lazygit()
	if lazygit_terminal == nil then
		lazygit_terminal = require("toggleterm.terminal").Terminal:new({ cmd = "lazygit" })
		lazygit_terminal:toggle()
	else
		lazygit_terminal:toggle()
	end
end

function _toggle_fish()
	if lazygit_terminal ~= nil then
		lazygit_terminal:close()
		lazygit_terminal = nil
	elseif fish_terminal == nil then
		fish_terminal = require("toggleterm.terminal").Terminal:new({ cmd = "fish" })
		fish_terminal:toggle()
	else
		fish_terminal:toggle()
	end
end

function _reset_fish()
	if fish_terminal ~= nil then
		fish_terminal:close()
		fish_terminal = nil
	end
	_toggle_fish()
end

keymap("n", "<C-S-t>", "<cmd>lua _reset_fish()<cr>", opts)
keymap("n", "<C-t>", "<cmd>lua _toggle_fish()<cr>", opts)
keymap("n", "<leader>lg", "<cmd>lua _toggle_lazygit()<cr>", opts)
keymap("n", "<C-n>", "<cmd>NeoTreeRevealToggle<CR>", opts)

keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<C-,>", "<Cmd>BufferMovePrevious<CR>", opts)
keymap("n", "<C-.>", "<Cmd>BufferMoveNext<CR>", opts)
keymap("n", "<leader>x", "<Cmd>BufferClose<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<S-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<S-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>", opts)
keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true, replace_keycodes = false })
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<M-j>", ":m .+1<CR>==", opts)
keymap("v", "<M-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fc", "<cmd>lua require('telescope').extensions.flutter.commands()<cr>", opts)
keymap("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)
keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
keymap("n", "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", opts)

keymap("n", "<F1>", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<F2>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<F3>", ":lua require('dap').continue()<CR>", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

keymap("n", "<ESC>", "<cmd>noh<cr>", opts)

keymap("n", "<leader>tr", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
