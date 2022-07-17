local M = {}

M.load = function()
  local present, material = pcall(require, "material")

  if not present then
    return
  end

  material.setup()
  vim.g.material_style = "deep ocean"
  vim.cmd("colorscheme material")
end

return M
