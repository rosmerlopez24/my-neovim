local M = {}

M.load = function()
  local present, catppuccin = pcall(require, "catppuccin")

  if not present then
    return
  end

  catppuccin.setup()
  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
  vim.cmd("colorscheme catppuccin")
end

return M
