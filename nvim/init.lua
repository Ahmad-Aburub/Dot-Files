-- term colors
vim.opt.termguicolors = true

-----------------------------------------

require("config.lazy")

-----------------------------------------
-- line number opts
vim.opt.number = true
vim.opt.relativenumber = true

-- signcolumn on
vim.opt.signcolumn = 'yes'

-- CursorLine
vim.opt.cursorline = true

-- Show Whitespace
vim.opt.list = true
vim.opt.listchars = { tab = '   ', trail = '∙' }

-- Preview substitutions
vim.opt.inccommand = "split"

-- Text wrapping
vim.opt.wrap = false
vim.opt.breakindent = true

-- Tabstops
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- floating window border
vim.opt.winborder = "rounded"

-- Mouse options
vim.opt.mouse = "i"

-- Theme
vim.cmd.colorscheme("cyberdream")

-----------------------------------------

require("config.keymap")
require("config.lsp")

