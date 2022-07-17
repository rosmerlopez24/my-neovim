local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print("Cloning packer...")
  vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd [[packadd packer.nvim]]

  local present, packer = pcall(require, "packer")

  if present then
    print("Packer cloned successfully.")
  else
    error("Couldn't clone packer !\nPacker path: " .. install_path .. "\n" .. packer)
  end
end

local options = {
  auto_clean = true,
  compile_on_sync = true,
  git = { clone_timeout = 8000 },
  display = {
    working_sym = "ﲊ",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

local present, packer = pcall(require, "packer")

if not present then
  return
end

packer.init(options)

packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "lewis6991/impatient.nvim" })

  -- Colorscheme
  use({ "marko-cerovac/material.nvim" })
  use({ "navarasu/onedark.nvim" })
  use({ "shaunsingh/nord.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- Color
  use {
    "norcalli/nvim-colorizer.lua",
    opt = true,
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.configs.others").colorizer()
    end,
  }

  -- Icons
  use({ "kyazdani42/nvim-web-devicons" })

  -- File explorer
  use {
    "kyazdani42/nvim-tree.lua",
    after = "nvim-web-devicons",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("plugins.configs.nvimtree")
    end,
    setup = function()
      require("core.mappings").nvimtree()
    end
  }

  -- Tabline
  use {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("plugins.configs.bufferline")
    end,
    setup = function()
      require("core.mappings").bufferline()
    end
  }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.configs.lualine")
      vim.opt.laststatus = 3
    end
  }

  -- Syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter")
    end,
  }

  -- LSP
  use {
    "williamboman/nvim-lsp-installer",
    {
      "neovim/nvim-lspconfig",
      config = function()
        require("lsp")
      end
    },
    opt = true,
  }

  use {
    "ray-x/lsp_signature.nvim",
    opt = true,
    after = "nvim-lspconfig",
    config = function()
      require("plugins.configs.others").signature()
    end
  }

  -- Snippet
  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  }

  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").luasnip()
    end,
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require("plugins.configs.cmp")
    end
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "cmp-nvim-lua"
  }

  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip"
  }

  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
  }

  use {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp"
  }

  use {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip"
  }

  -- Editing support
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").autopairs()
    end
  }

  -- Comment
  use {
    "numToStr/Comment.nvim",
    module = "Comment",
    config = function()
      require("plugins.configs.others").comment()
    end,
    setup = function()
      require("core.mappings").comment()
    end
  }

  -- Indent
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("plugins.configs.others").blankline()
    end
  }

  -- Neovim Lua Development
  use {
    "folke/lua-dev.nvim",
    opt = true,
    ft = "lua"
  }
end)
