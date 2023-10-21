local options = {
  encoding = "utf-8",
  syntax = "on",
  clipboard = "unnamedplus",
  expandtab = true,
  autoindent = true,
  tabstop = 4,
  shiftwidth = 4,
  inccommand = "split"
}

vim.opt.shortmess:append("c")
for k, v in pairs(options) do
  vim.opt[k] = v
end
