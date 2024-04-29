vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.conceallevel = 2
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  leadmultispace = '· ',
  trail = '␣',
  extends = '▶',
  precedes = '◀',
  nbsp = '␣',
}

vim.opt.foldmethod = 'syntax'
vim.opt.syntax = 'on'

vim.opt.cindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 1
