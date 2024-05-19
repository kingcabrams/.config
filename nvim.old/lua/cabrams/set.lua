vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true

vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.hlsearch = true
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

vim.opt.foldmethod = 'marker'
vim.opt.foldlevel = 0
vim.opt.syntax = 'on'

vim.opt.cindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
