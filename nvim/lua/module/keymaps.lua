local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-j>", "<C-w>j", opts)
keymap("n", "<S-k>", "<C-w>k", opts)
keymap("n", "<S-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<S-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>", opts)

keymap("n", "<Leader>q", ":Bdelete<CR>", opts)
keymap("n", "<Leader><C-q>", ":Bdelete!<CR>", opts)

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
keymap("n", "<Leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<Leader>/", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<Leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

keymap("n", "<F4>", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<F6>", ":lua require('dap').toggle_breakpoint()<CR>", opts)

keymap("n", "<F9>", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<F1>", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<F2>", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<F3>", ":lua require('dap').step_out()<CR>", opts)

keymap("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", opts)
keymap("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", opts)

keymap("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", opts)
keymap("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",
  opts)

keymap("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", opts)
keymap("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", opts)

keymap("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
  opts)
keymap("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", opts)

keymap("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", opts)
keymap("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", opts)

keymap("n", "<Leader>tw", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
keymap("n", "<Leader>td", "<cmd>TroubleToggle document_diagnostics<CR>", opts)

keymap("n", "<Leader>q", "<cmd>:Bd<CR>", opts)

keymap("n", "<C-h>", "<cmd>:bprevious<CR>", opts)
keymap("n", "<C-l>", "<cmd>:bnext<CR>", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
