vim.opt.guicursor = ""

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.guifont = "SFMono Nerd Font:h21"

vim.opt.termguicolors = true
vim.opt.hlsearch = false

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.clipboard = "unnamedplus"
vim.opt.foldmethod = "marker"

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight TroubleNormal guibg=NONE ctermbg=NONE
]])
