local options = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        }
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
        maxPreload = 10000,
      },
    },
  },
}

local present, lua_dev = pcall(require, "lua-dev")
if not present then
  return options
end

local luadev = {
  library = {
    vimruntime = true,
    types = true,
    plugins = true,
  },
  runtime_path = true,
  lspconfig = options,
}

return lua_dev.setup(luadev)
