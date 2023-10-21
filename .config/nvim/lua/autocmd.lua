local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufReadPost" }, {
  pattern = { "plugin.lua" },
  command = "PackerCompile",
})
