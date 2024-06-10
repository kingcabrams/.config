return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
          require "configs.conform"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
          require("nvchad.configs.lspconfig").defaults()
          require "configs.lspconfig"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
           "html", "css", "rust", "python",
            "typescript", "java",
            },
        },
    },
    {
    'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },
    {
    'tpope/vim-sleuth',
    },
}
