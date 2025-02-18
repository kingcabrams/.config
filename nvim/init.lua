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
	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = {},
	  config = function()
		  vim.cmd("colorscheme tokyonight-storm")
	  end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
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
	{ "nvim-tree/nvim-tree.lua", opts = {} },
	{ "akinsho/toggleterm.nvim", version = "*", config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-;>]],
			direction = "float",
			float_opts = {
				border = "curved",
			}
		})
	end},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				modified_icon = "",

				show_close_icon = false,
				show_buffer_close_icons = false,

				indicator = {
					style = "none",
				},

				view = "multiwindow",
				separator_style = "thin",
				always_show_bufferline = false,
				auto_toggle_bufferline = true,
				offsets = {
					{
						filetype = "NvimTree",
					},
				},
			},
		},
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
	{ -- Collection of helpful plugins
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup({
				mappings = {
					add = "ysa", -- Add surrounding in Normal and Visual modes
					delete = "ysd", -- Delete surrounding
					find = "ysf", -- Find surrounding (to the right)
					find_left = "ysF", -- Find surrounding (to the left)
					replace = "ysr", -- Replace surrounding
				},
			})
			require("mini.move").setup({
				mappings = {
					left = "<",
					right = ">",
					down = "J",
					up = "K",
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
				"just",
			},
			auto_install = true,
		},
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				groups = { -- table: default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLineNr",
					"EndOfBuffer",
					"NormalSB",
					"Pmenu",
				},
				extra_groups = { -- table: additional groups that should be cleared
					"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
					"FloatBorder",
					"NvimTreeWinSeparator",
					"NvimTreeNormal",
					"NvimTreeNormalNC",
					"TroubleNormal",
					"TelescopeNormal",
					"TelescopeBorder",
					"WhichKeyFloat",
					"TroubleNormal ",
					"TroubleError ",
					"TroubleWarnin",
					"TroubleHint ",
					"TroubleInformation ",
					"NotifyINFOBody",
					"NotifyERRORBody",
					"NotifyWARNBody",
					"NotifyDEBUGBody",
					"NotifyTRACEBody",
					"NotifyINFOBorder",
					"NotifyERRORBorder",
					"NotifyWARNBorder",
					"NotifyDEBUGBorder",
					"NotifyTRACEBorder",
					"TroubleText ",
					"TroubleSign ",
					"TroubleFoldIcon ",
					"TroubleIndent ",
					"TroubleCount ",
					"TroubleError ",
					"TroubleWarning",
					"TroubleHint",
					"TroubleInformation",
					"TroubleDiagnosticLine",
				},
				exclude_groups = {}, -- table: groups you don't want to clear
			})
		end,
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
