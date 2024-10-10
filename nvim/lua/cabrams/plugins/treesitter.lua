return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {'kotlin', 'bash', 'c', 'cpp', 'vim', 'python', 'rust', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'typst'},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  }
