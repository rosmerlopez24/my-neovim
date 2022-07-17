local M = {}

M.load = function()
  local present, nord = pcall(require, "nord")

  if not present then
    return
  end

  -- Set config for theme
  vim.g.nord_contrast = false
  vim.g.nord_borders = false
  vim.g.nord_disable_background = false
  vim.g.nord_cursorline_transparent = false
  vim.g.nord_enable_sidebar_background = false
  vim.g.nord_italic = false

  -- Load the colorscheme
  nord.set()
end

return M
