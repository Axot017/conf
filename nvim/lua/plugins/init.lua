require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
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
    "jose-elias-alvarez/null-ls.nvim",
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
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.comment")
    end,
  },
  { "akinsho/flutter-tools.nvim" },
  { "mfussenegger/nvim-dap" },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    config = function()
      require("plugins.dap")
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("plugins.flutter-tools")
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
    dependencies = { "jose-elias-alvarez/null-ls.nvim" },
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
}, require("plugins.lazy"))
