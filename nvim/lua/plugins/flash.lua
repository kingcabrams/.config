require('flash').setup({
    modes = {
        search = { enabled = true },
    }
})

vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end)
vim.keymap.set({ "n", "x", "o" },  "S", function() require("flash").treesitter() end)
vim.keymap.set("o", "r", function() require("flash").remote() end)
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end)
