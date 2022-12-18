local M = {}

M.common = {
	n = {
		["n"] = { "nzz", "Move to next and center" },
		["N"] = { "Nzz", "Move to previous and center" },
		["<C-u>"] = { "<C-u>zz", "Half page up and center" },
		["<C-d>"] = { "<C-d>zz", "Half page down and center" },

		["<S-Up>"] = { "<cmd>resize +2<CR>", "Increase window height" },
		["<S-Down>"] = { "<cmd>resize -2<CR>", "Decrease window height" },
		["<S-Right>"] = { "<cmd>vertical resize +2<CR>", "Increase window width" },
		["<S-Left>"] = { "<cmd>vertical resize -2<CR>", "Decrease window width" },
	},
	v = {
		["<"] = { "<gv", "Shift left" },
		[">"] = { ">gv", "Shift right" },
		["p"] = { '"_dP', "Paste over selection" },
	},
}

M.dap = {
	n = {
		["<leader>dt"] = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle dap ui" },
		["<leader>dc"] = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
		["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
		["<leader>dl"] = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			"Set conditional breakpoint",
		},
		["<leader>do"] = { "<cmd>lua require'dap'.step_over()<CR>", "Step over" },
		["<leader>di"] = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
		["<leader>du"] = { "<cmd>lua require'dap'.step_out()<CR>", "Step out" },
		["<leader>dr"] = { "<cmd>lua require'dap'.repl.open()<CR>", "Open REPL" },
		["<leader>ds"] = { "<cmd>lua require'dap'.run_last()<CR>", "Run last" },
	},
}

M.lsp_telescope = {
	n = {
		["gr"] = { "<cmd>Telescope lsp_references<CR>", "References" },
		["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
		["gi"] = { "<cmd>Telescope lsp_implementations<CR>", "Implementations" },
	},
}

M.copilot = {
	i = {
		["<C-y>"] = {
			'copilot#Accept("<CR>")',
			" Copilot accept",
			opts = { noremap = true, silent = true, expr = true, replace_keycodes = false },
		},
	},
}

M.nvterm = {
	plugin = true,

	t = {
		["<C-t>f"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<C-t>h"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<C-t>v"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},
	},

	n = {
		["<C-t>f"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<C-t>h"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<C-t>v"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},
	},
}

return M
