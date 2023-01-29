require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
   {
      "nvim-treesitter/nvim-treesitter", 
      lazy = false,
      config = function() 
         require("plugins.treesitter")
      end
   }
}, 
require("plugins.lazy")
)
