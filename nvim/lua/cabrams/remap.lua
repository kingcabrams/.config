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
set("n", "<C-h>", "<c-w>5<")
set("n", "<C-l>", "<c-w>5>")
set("n", "<C-j>", "<C-W>+")
set("n", "<C-k>", "<C-W>-")

-- Escape to cancel search highlighting
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Compile and run C++ code with input redirection
function _G.compile_run_cpp()
  local src_path = vim.fn.expand('%:p:~')
  local src_noext = vim.fn.expand('%:p:~:r')
  local flags = ''
  local prog = 'g++ std=c++2b'
  local input_file = vim.fn.expand('%:p:h') .. '/inp.txt' -- Assuming input.txt is in the same directory as the source file

  -- Create a vertical split terminal buffer
  vim.cmd('vsplit')
  vim.cmd('resize 80')
  -- Compile and run with input redirection
  vim.cmd('term ' .. prog .. ' ' .. flags .. ' ' .. src_path .. ' -o ' .. src_noext .. ' && ' .. src_noext .. ' < ' .. input_file)
end

-- Map F9 key to compile and run Rust
vim.api.nvim_set_keymap('n', '<F9>', ':lua compile_run_cpp()<CR>', { noremap = true, silent = true })

-- Copy to clipboard
set({ 'n', 'v' }, '<leader>y', [["+y]])

-- File Explorer
set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
  end,
})
