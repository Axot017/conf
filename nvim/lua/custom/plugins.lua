return {
	["github/copilot.vim"] = {},
	["williamboman/mason.nvim"] = {},
	["williamboman/mason-lspconfig.nvim"] = {},
	["jackMort/ChatGPT.nvim"] = {
		after = "telescope.nvim",
		config = function()
			require("chatgpt").setup({})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
		},
	},
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.config.lsp")
		end,
	},
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.config.null-ls")
		end,
	},
	["mfussenegger/nvim-dap"] = {
		after = "nvim-lspconfig",
	},
	["rcarriga/nvim-dap-ui"] = {
		after = "nvim-dap",
		config = function()
			require("custom.config.dap-ui")
		end,
	},
	["akinsho/flutter-tools.nvim"] = {
		after = "nvim-dap-ui",
		config = function()
			require("custom.config.flutter-tools")
		end,
	},
	["nvim-telescope/telescope-ui-select.nvim"] = {
		after = "telescope.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
}
