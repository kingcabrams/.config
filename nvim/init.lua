require("cabrams")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy
require("lazy").setup({
	{
		"folke/trouble.nvim",
		lazy = false,
		opts = {
			-- Automatically open and close Trouble based on diagnostics
			use_diagnostic_signs = true, -- Use LSP diagnostic signs
			height = math.floor(vim.o.lines * 0.1),
			action_keys = {
				close = "<esc>", -- Close the Trouble window
			},
			modes = {
				diagnostics = {
					auto_open = true, -- Auto open Trouble when diagnostics are available
					auto_close = true, -- Auto close Trouble when diagnostics are cleared
					win = {
						type = "split",
						relative = "win",
						position = "bottom",
						size = 0.15,
					},
				},
			},
		},
		md = "Trouble",
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme monokai-pro")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = "",
					section_separators = "",
				},
			})
		end,
	},
	{ -- Fuzzy find files
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("fzf-lua").setup({
				winopts = {
					split = "belowright new",
				},
				files = {
					previewer = false,
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
		},
	},
    { -- Autoformat
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "n",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			notify_on_error = false,
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"rust",
				"python",
				"diff",
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
				"just",
			},
			auto_install = true,
		},
	},
	{ -- Completion setup
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{},
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", max_item_count = 10 },
					{ name = "luasnip", max_item_count = 10 },
				}, {
					{ name = "buffer", max_item_count = 10 },
				}),
			})
		end,
	},
	{ import = "plugins" },
})
