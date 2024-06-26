return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      local data = assert(vim.fn.stdpath "data") --[[@as string]]

      require("telescope").setup {
        extensions = {
          wrap_results = true,
          fzf = {},
          history = {
            path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
            limit = 100,
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "smart_history")
      pcall(require("telescope").load_extension, "ui-select")

      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fw", builtin.grep_string)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)
      vim.keymap.set('n', '<leader>fb', builtin.buffers)
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references)
    end,
}
