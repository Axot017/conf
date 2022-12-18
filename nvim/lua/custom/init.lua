vim.g.copilot_no_tab_map = true

vim.opt.relativenumber = true
vim.opt.guifont        = { "JetBrainsMonoNL Nerd Font Mono", "h12" },

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
