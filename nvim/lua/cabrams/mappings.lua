vim.g.mapleader = " "

-- open file explorer
local minifiles_toggle = function(...)
	if not MiniFiles.close() then
		MiniFiles.open(...)
	end
end

vim.keymap.set("n", "<leader>pv", minifiles_toggle)

-- key cursor at start of the line when J
vim.keymap.set("n", "J", "mzJ`z")

-- center cursor on screen after movement commands
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
