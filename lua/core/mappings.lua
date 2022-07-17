local utils = require("core.utils")
local map = utils.map

local M = {}

M.general = function()
  -- Use ESC to turn off seach highlighting
  map("n", "<ESC>", "<cmd> :noh <CR>")

  -- Save and close buffer
  map("n", "<leader>s", "<cmd> :w <CR>")
  map("n", "<leader>x", function()
    utils.close_buffer()
  end)

  -- Better window navigation
  map("n", "<C-h>", "<C-w>h")
  map("n", "<C-j>", "<C-w>j")
  map("n", "<C-k>", "<C-w>k")
  map("n", "<C-l>", "<C-w>l")

  -- Resize with arrows
  map("n", "<C-Up>", "<cmd> :resize +2<CR>")
  map("n", "<C-Down>", "<cmd> :resize -2<CR>")
  map("n", "<C-Left>", "<cmd> :vertical resize -2<CR>")
  map("n", "<C-Right>", "<cmd> :vertical resize +2<CR>")

  -- Navigate buffers
  map("n", "<S-l>", "<cmd> :bnext<CR>")
  map("n", "<S-h>", "<cmd> :bprevious<CR>")

  -- Stay in indent mode
  map("v", "<", "<gv")
  map("v", ">", ">gv")

  -- Move text up and down
  map("v", "<A-j>", ":m .+1<CR>==")
  map("v", "<A-k>", ":m .-2<CR>==")

  -- Move text up and down
  map("x", "J", ":move '>+1<CR>gv-gv")
  map("x", "K", ":move '<-2<CR>gv-gv")
  map("x", "<A-j>", ":move '>+1<CR>gv-gv")
  map("x", "<A-k>", ":move '<-2<CR>gv-gv")
end

M.nvimtree = function()
  map("n", "<leader>e", "<cmd> :NvimTreeToggle<CR>")
  map("n", "<leader>r", "<cmd> :NvimTreeRefresh<CR>")
end

M.bufferline = function()
  map("n", "<TAB>", "<cmd> :BufferLineCycleNext <CR>")
  map("n", "<S-Tab>", "<cmd> :BufferLineCyclePrev <CR>")
end

M.comment = function()
  map("n", "<leader>/", "<cmd> :lua require('Comment.api').toggle_current_linewise()<CR>")
  map("v", "<leader>/", "<esc><cmd> :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
end

M.lspconfig = function()
  map("n", "gD", function()
    vim.lsp.buf.declaration()
  end)

  map("n", "gd", function()
    vim.lsp.buf.definition()
  end)

  map("n", "K", function()
    vim.lsp.buf.hover()
  end)

  map("n", "gi", function()
    vim.lsp.buf.implementation()
  end)

  map("n", "<C-k>", function()
    vim.lsp.buf.signature_help()
  end)

  map("n", "<leader>D", function()
    vim.lsp.buf.type_definition()
  end)

  map("n", "<leader>ra", function()
    vim.lsp.buf.rename()
  end)

  map("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end)

  map("n", "gr", function()
    vim.lsp.buf.references()
  end)

  map("n", "<leader>f", function()
    vim.diagnostic.open_float()
  end)

  map("n", "[d", function()
    vim.diagnostic.goto_prev()
  end)

  map("n", "d]", function()
    vim.diagnostic.goto_next()
  end)

  map("n", "<leader>q", function()
    vim.diagnostic.setloclist()
  end)

  map("n", "<leader>fm", function()
    vim.lsp.buf.formatting()
  end)

  map("n", "<leader>wa", function()
    vim.lsp.buf.add_workspace_folder()
  end)

  map("n", "<leader>wr", function()
    vim.lsp.buf.remove_workspace_folder()
  end)

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
end

return M
