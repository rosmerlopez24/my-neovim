local M = {}

M.load = function()
  local present, onedark = pcall(require, "onedark")

  if not present then
    return
  end

  onedark.setup({ style = 'darker' })
  onedark.load()
end

return M
