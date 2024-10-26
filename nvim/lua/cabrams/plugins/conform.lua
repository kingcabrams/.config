return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
  local conform = require 'conform'
  conform.setup {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      javascript = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      java = { 'google-java-format' },
      markdown = { { 'prettierd', 'prettier' } },
      html = { 'htmlbeautifier' },
      bash = { 'beautysh' },
      rust = { 'rustfmt' },
      yaml = { 'yamlfix' },
      toml = { 'taplo' },
      css = { { 'prettierd', 'prettier' } },
      scss = { { 'prettierd', 'prettier' } },
      sh = { { 'shellcheck' } },
    },
  }

  vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
    conform.format {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    }
  end, { desc = 'Format file or range (in visual mode)' })
    end,
  },
}
