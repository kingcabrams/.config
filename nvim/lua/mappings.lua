require "nvchad.mappings"

local map = vim.keymap.set

-- Can move entire groups of lines
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Movement commands center line in middle of screen
map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- j and k move through visual lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Escape to remove highlighted search
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Helix style movement
map('n', 'gn', '<cmd>bnext<CR>')
map('n', 'gp', '<cmd>bprev<CR>')
map({'n', 'v'}, 'gl', '$')
map({'n', 'v'}, 'gh', '^')

-- Keep visual selection after indent
map({'v'}, '<', '< gv')
map({'v'}, '>', '> gv')
