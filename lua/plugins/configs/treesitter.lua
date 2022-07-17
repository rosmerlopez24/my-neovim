local present, treesitter = pcall(require, 'nvim-treesitter.configs')
if not present then
  return
end

local config = require("core.utils").load_config().config

local options = {
  sync_install = false,
  auto_install = false,
  ensure_installed = config.treesitter.language,
  autopairs = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  highlight = {
    enable = true,
  },
}

treesitter.setup(options)
