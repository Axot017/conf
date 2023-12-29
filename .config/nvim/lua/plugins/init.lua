require("lazy").setup({
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local dracula = require("dracula")
			dracula.setup({
				transparent_bg = true,
				italic_comment = true,
			})

			vim.cmd([[colorscheme dracula]])
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.telescope")
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = function()
			require("plugins.treesitter")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		config = function()
			require("plugins.cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
    version = "v2.*",
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",

		config = function()
			require("plugins.lsp").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.mason")
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer", event = "VeryLazy" },
	{ "hrsh7th/cmp-path", event = "VeryLazy" },
	{ "hrsh7th/cmp-cmdline", event = "VeryLazy" },
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.null-ls")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{ "github/copilot.vim", event = "VeryLazy" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"romgrk/barbar.nvim",
		lazy = false,
		config = function()
			require("plugins.barbar")
		end,
	},
	{ "MunifTanjim/nui.nvim" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		config = function()
			require("plugins.neo-tree")
		end,
	},
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		config = function()
			require("plugins.dap")
		end,
	},
	{ "p00f/nvim-ts-rainbow", lazy = false },
	{
		"windwp/nvim-autopairs",
		lazy = false,
		config = function()
			require("plugins.autopairs")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		dependencies = { "nvimtools/none-ls.nvim" },
		config = function()
			require("plugins.gitsigns")
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.dressing")
		end,
	},
	{ "antoinemadec/FixCursorHold.nvim" },
	{
		"nvim-neotest/neotest",
		config = function()
			require("plugins.neotest")
		end,
	},
	{
		"sidlatau/neotest-dart",
	},
	{
		"rouge8/neotest-rust",
	},
	{
		"nvim-neotest/neotest-plenary",
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{
		"goolord/alpha-nvim",
		lazy = false,
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
	},
}, require("plugins.lazy"))
