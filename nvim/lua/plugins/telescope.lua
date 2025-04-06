local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = { ["<esc>"] = actions.close, },
        },
    },
    pickers = {
        find_files = {
            layout_config = {
                prompt_position = "top",
                height = .8,
                width = .8,
            },
            sorting_strategy = "ascending",
            prompt_prefix = "",
        },

        colorscheme = {
            theme = "ivy",
            previewer = false,
            layout_config = {
                height = .3,
            },
            prompt_prefix = "",
        },
    }
})

vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>t', function() builtin.colorscheme({enable_preview = true}) end, { desc = 'Telescope buffers' })
