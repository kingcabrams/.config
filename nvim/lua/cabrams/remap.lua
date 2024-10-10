vim.g.mapleader = ' '

local set = vim.keymap.set -- for conciseness

-- Move groups of lines
set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

-- Center cursor after movement
set('n', 'J', 'mzJ`z')
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

-- Better movement through splits
set('n',  '<C-h>', '<C-w>h')
set('n',  '<C-j>', '<C-w>j')
set('n',  '<C-k>', '<C-w>k')
set('n',  '<C-l>', '<C-w>l')

-- Escape to cancel search highlighting
set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- noremap <F10> <ESC> :w <CR> :!clang++ -std=c++20 -Wall -Wextra -Wshadow -O2 -o %< % && ./%< < inp<CR>

-- Copy to clipboard
set({ 'n', 'v' }, '<leader>y', [["+y]])

-- File Explorer
set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
set('n', '<leader>df', '<CMD>Oil ~/.config/<CR>', { desc = 'Open dotfiles' })
set('n', '<leader>sr', [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

set('n', '<leader>x', '<CMD>bd!<CR>')

-- Copy File
  set('n', '<C-c>', '<CMD>%y+<CR>')

-- CompProgramming compile and run bin
  set('n', '<leader>r', function()
    vim.cmd('w');
    local path = vim.fn.expand('%')

    local first_component = string.match(path, "([^/]+)")

    if first_component then
      local cmd = "cargo run --bin " .. first_component
      vim.cmd('!' .. cmd)
    end
end)
