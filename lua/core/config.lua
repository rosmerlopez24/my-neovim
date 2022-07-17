local M = {}

-- General settings
M.config = {
  -- Theming settings
  -- Options: "catppuccin", "material", "nord", "onedark"
  theme = "catppuccin",

  -- LSP settings
  lsp = {
    -- List servers you want to installl
    -- Options: see https://github.com/williamboman/nvim-lsp-installer#available-lsps
    servers = { "sumneko_lua", "bashls", "clangd", "pyright" }
  },

  -- Treesitter settings
  -- Options: see https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  treesitter = {
    language = { "bash", "c", "cpp", "lua", "make", "python", "vim" },
  }
}

return M
