local M = {}

M.autopairs = function()
  local present1, autopairs = pcall(require, "nvim-autopairs")
  local present2, cmp = pcall(require, "cmp")

  if not present1 and present2 then
    return
  end

  local options = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  }

  autopairs.setup(options)
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

M.blankline = function()
  local present, blankline = pcall(require, "indent_blankline")

  if not present then
    return
  end

  local options = {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "lsp-installer",
      "NvimTree",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = true,
  }

  blankline.setup(options)
end

M.colorizer = function()
  local present, colorizer = pcall(require, "colorizer")
  if not present then
    return
  end

  local options = {
    filetypes = {
      "*",
    },
    user_default_options = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = false, -- "Name" codes like Blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes
      rgb_fn = false, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode = "background", -- Set the display mode.
    },
  }

  colorizer.setup(options["filetypes"], options["user_default_options"])
  vim.cmd "ColorizerAttachToBuffer"
end

M.comment = function()
  local present, nvim_comment = pcall(require, "Comment")

  if not present then
    return
  end

  nvim_comment.setup()
end

M.luasnip = function()
  local present, luasnip = pcall(require, "luasnip")

  if not present then
    return
  end

  local options = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  }

  luasnip.config.set_config(options)
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.luasnippets_path or "" })
end

M.signature = function()
  local present, lsp_signature = pcall(require, "lsp_signature")

  if not present then
    return
  end

  local options = {
    bind = true,
    doc_lines = 0,
    floating_window = true,
    fix_pos = true,
    hint_enable = true,
    hint_prefix = " ",
    hint_scheme = "String",
    hi_parameter = "Search",
    max_height = 22,
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
      border = "single", -- double, single, shadow, none
    },
    zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
    padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
  }

  lsp_signature.setup(options)
end

return M
