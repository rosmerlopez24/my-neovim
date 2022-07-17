local M = {}

-- Load default settings
M.load_config = function ()
  local config = require("core.config")
  return config
end

-- Close current buffer
M.close_buffer = function(bufnr)
  -- If the buffer has been modified
  -- In case of modification, ask if you want to close
  -- In another case, close the buffer
  if vim.bo.modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd("bd!")
        vim.defer_fn(function()
          vim.cmd "echo"
        end, 0)
      end
    end)
  else
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    vim.cmd("bd" .. bufnr)
  end
end

-- Set keymaps
M.map = function(mode, keys, command, opt)
  local options = { noremap = true, silent = true }

  if opt then
    options = vim.tbl_extend("force", options, opt)
  end

  if type(keys) == "table" then
    for _, keymap in ipairs(keys) do
      M.map(mode, keymap, command, opt)
    end
    return
  end

  vim.keymap.set(mode, keys, command, opt)
end

return M
