local present, lsp_installer = pcall(require, "nvim-lsp-installer")
if not present then
  return
end

lsp_installer.setup({
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "",
      server_pending = "",
      server_uninstalled = "ﮊ",
    },
  },
  max_concurrent_installers = 1,
})

local present_lspconfig, lspconfig = pcall(require, "lspconfig")
if not present_lspconfig then
  return
end

local config = require("core.utils").load_config().config
local servers = config.lsp.servers

for _, server in pairs(servers) do
  local options = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "lsp.providers." .. server)
  if has_custom_opts then
    options = vim.tbl_deep_extend("force", server_custom_opts, options)
  end
  lspconfig[server].setup(options)
end
