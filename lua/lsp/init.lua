local present, _ = pcall(require, "lspconfig")
if not present then
  return
end

require("lsp.configs")
require("lsp.handlers").setup()
