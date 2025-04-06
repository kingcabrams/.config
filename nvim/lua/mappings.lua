vim.g.mapleader = " "
vim.env.BROWSER = "firefox"

local set = vim.keymap.set

-- keep cursor at start of the line when J
set("n", "J", "mzJ`z")

-- center cursor on screen after movement commands
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzz", { silent = true })
set("n", "N", "Nzz", { silent = true })
set("n", "*", "*zz", { silent = true })
set("n", "#", "#zz", { silent = true })
set("n", "g*", "g*zz", { silent = true })

set("v", "<", "<gv")
set("v", ">", ">gv")


set("n", "<esc>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return "<esc>"
  end
end, { expr = true })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	command = "silent! lua vim.highlight.on_yank({ timeout = 150 })",
})

-- rustaceanvim
local bufnr = vim.api.nvim_get_current_buf() 

set("n", "<leader>a", function()
    vim.cmd.RustLsp('codeAction')
  end,
  { silent = true, buffer = bufnr }
)

set("n", "K", function() vim.cmd.RustLsp({'hover', 'actions'}) end, { silent = true, buffer = bufnr })

set("n", "gd", vim.lsp.buf.declaration, { buffer = bufnr })

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        print("insert triggered")
        if vim.v.hlsearch == 1 then
            vim.cmd("nohlsearch")
        end
    end,
})
