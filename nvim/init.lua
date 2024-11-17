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
	"tpope/vim-sleuth", -- Automatic tab size detection based on filetype
	{ -- Aura colorscheme :)
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
	},
	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {},

			formatters_by_ft = {
				lua = { "stylua" },
			},

			notify_on_error = false,

			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	},
	{ -- Collection of helpful plugins ex: statusline, tabline, etc.
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup()
			require("mini.pairs").setup()
			require("mini.move").setup({
				mappings = {
					left = "<",
					right = ">",
					down = "J",
					up = "K",
				},
			})
			require("mini.statusline").setup({})
			require("mini.files").setup()
			require("mini.basics").setup({
				options = {
					basic = true,
					extra_ui = false,
					win_borders = "double",
				},
			})
		end,
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
			},
			auto_install = true,
		},
	},
	{ -- LSP setup
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{
				"hrsh7th/nvim-cmp",
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
							{ name = "nvim_lsp" },
							{ name = "luasnip" },
						}, {
							{ name = "buffer" },
						}),
					})
				end,
			},
			{ "williamboman/mason.nvim", config = true },
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"clangd",
					"rust_analyzer",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
						vim.diagnostic.config({
							update_in_insert = true,
							float = {
								focusable = false,
								style = "minimal",
								border = "rounded",
								source = "always",
								header = "",
								prefix = "",
							},
						})
					end,
					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim", "MiniFiles" },
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
})
