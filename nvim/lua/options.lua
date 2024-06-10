require "nvchad.options"

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

o.guicursor = ''

o.nu = true
o.relativenumber = true
o.guifont="IosevkaTerm Nerd Font:h20"

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.expandtab = true

o.smartindent = true
o.autoindent = true
o.cindent = true

o.wrap = true
o.swapfile = false
o.undofile = true

o.hlsearch = true
o.incsearch = true

o.termguicolors = true

o.scrolloff = 8

o.cindent = true
o.splitright = true
o.splitbelow = true

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

o.cursorline = true
o.breakindent = true
o.linebreak = true
o.showbreak = "↪ "

o.list = true
vim.opt.listchars = {
  lead = "·",
  eol = "⏎",
  precedes = "↪"
}

