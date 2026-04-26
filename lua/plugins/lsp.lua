return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"neovim/nvim-lspconfig",
		"saghen/blink.lib",
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	},
	version = "1.*",
	build = "cargo build --release",

	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "super-tab" },

		appearance = {
			nerd_font_variant = "normal",
		},

		completion = { documentation = { auto_show = true } },

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "omni", "cmdline" },
		},
		fuzzy = {
			implementation = "rust",
			sorts = {
				"exact",
				"score",
				"sort_text",
				"label",
				"kind"
			}
		},
	},
	opts_extend = { "sources.default" },
}
