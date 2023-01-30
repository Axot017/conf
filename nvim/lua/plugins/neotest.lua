local status, neotest = pcall(require, "neotest")

if not status then
  vim.notify("neotest not installed")
  return
end

neotest.setup({
  adapters = {
    require("neotest-plenary"),
    require("neotest-dart"),
    require("neotest-rust"),
  },
})
