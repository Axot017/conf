local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-n>", "<cmd>NeoTreeRevealToggle<CR>", opts)

keymap("n", "<C-h>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<C-l>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<C-j>", "<Cmd>BufferMovePrevious<CR>", opts)
keymap("n", "<C-k>", "<Cmd>BufferMoveNext<CR>", opts)
keymap("n", "<leader>x", "<Cmd>BufferClose<CR>", opts)

-- Better window navigation
keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-j>", "<C-w>j", opts)
keymap("n", "<S-k>", "<C-w>k", opts)
keymap("n", "<S-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<S-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<S-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>", opts)

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
keymap("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)
keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
keymap("n", "gd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", opts)

keymap("n", "<F4>", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<F6>", ":lua require('dap').toggle_breakpoint()<CR>", opts)

keymap("n", "<F7>", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<F1>", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<F2>", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<F3>", ":lua require('dap').step_out()<CR>", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

keymap("n", "<ESC>", "<cmd>noh<cr>", opts)
