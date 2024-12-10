vim.g.mapleader = " "

-- key cursor at start of the line when J
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("", "<C-p>", "<cmd>FzfLua files<cr>")

-- center cursor on screen after movement commands
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "*", "*zz", { silent = true })
vim.keymap.set("n", "#", "#zz", { silent = true })
vim.keymap.set("n", "g*", "g*zz", { silent = true })

vim.keymap.set("v", "<C-h>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<C-h>", "<cmd>nohlsearch<cr>")

vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-h>", ":bp<cr>")
vim.keymap.set("n", "<C-l>", ":bn<cr>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>x', ':bd<CR>', { noremap = true, silent = true })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	command = "silent! lua vim.highlight.on_yank({ timeout = 500 })",
})

-- jump to last edit position on opening file
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function(_)
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			if not vim.fn.expand("%:p"):find(".git", 1, true) then
				vim.cmd('exe "normal! g\'\\""')
			end
		end
	end,
})

vim.cmd [[
  augroup TerminalLineNumbers
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
]]
