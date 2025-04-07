vim.lsp.config.clangd = {
  cmd = { 'clangd', '--background-index', '--log=verbose'},
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  init_options = {
      fallbackFlags = { '-std=c++23' }
  },
  filetypes = { 'c', 'cpp' },
}

vim.lsp.enable({'clangd'})
