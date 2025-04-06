require("blink.cmp").setup({
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
    },

    keymap = {
        preset = "default",
        ['<C-k>'] = { 'snippet_forward' },
        ['<C-j>'] = { 'snippet_backward' },
    },

	sources = {
		default = { "snippets", "lsp", "path", "buffer" },
        providers = {
            snippets = { score_offset = 1000, }
        }
	},

    signature = { enabled = true },

	fuzzy = {
		implementation = "rust",
	},
})
