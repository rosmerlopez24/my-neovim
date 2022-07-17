-- Set mapleader
vim.g.mapleader = " "

-- Use filetype.lua instead of filetype.vim
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

vim.opt.confirm = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.expandtab = true
vim.opt.fillchars = { eob = " " }
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = false
vim.opt.ruler = false
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.syntax = "on"
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.updatetime = 250

vim.opt.shortmess:append "sI"
vim.opt.whichwrap:append "<>[]hl"

vim.schedule(function()
  vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
  vim.cmd [[ silent! rsh ]]
end)
