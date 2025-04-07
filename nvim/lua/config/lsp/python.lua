vim.lsp.config.jedi = {
    cmd = { 'jedi-language-server' },
    root_markers = { 'pyproject.toml' },
    filetypes = { 'python' },
}

vim.lsp.config.ruff = {
    cmd = { 'ruff', 'server'},
    root_markers = { 'pyproject.toml' },
    filetypes = { 'python' },
}

vim.lsp.enable({'ruff'})
vim.lsp.enable({'jedi'})
