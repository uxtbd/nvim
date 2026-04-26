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

		completion = {
			keyword = { range = "full" },
			trigger = {
				prefetch_on_insert = true,
				show_in_snippet = true,
				show_on_backspace = true,
				show_on_backspace_in_keyword = true,
				show_on_insert = true,
			},
			list = {
				max_items = 250,
				selection = {
					preselect = true,
					auto_insert = true,
				},
				cycle = {
					from_bottom = true,
					from_top = true,
				},
			},
			accept = {
				dot_repeat = true,
				create_undo_point = true,
				resolve_timeout_ms = 1000,
				auto_brackets = {
					enabled = true,
					-- Default brackets to use for unknown languages
					default_brackets = { "(", ")" },
					override_brackets_for_filetypes = {},
					kind_resolution = {
						enabled = true,
					},
					semantic_token_resolution = {
						enabled = true,
						timeout_ms = 1000,
					},
				},
			},
			documentation = { auto_show = true, treesitter_highlighting = true },
			ghost_text = {
				enabled = true,
				-- Show the ghost text when an item has been selected
				show_with_selection = true,
				-- Show the ghost text when no item has been selected, defaulting to the first item
				show_without_selection = true,
				-- Show the ghost text when the menu is open
				show_with_menu = true,
				-- Show the ghost text when the menu is closed
				show_without_menu = true,
			},
			signature = {
				enabled = true,
				trigger = {
					-- Show the signature help automatically
					enabled = true,
					-- Show the signature help window after typing any of alphanumerics, `-` or `_`
					show_on_keyword = true,
					blocked_trigger_characters = {},
					blocked_retrigger_characters = {},
					-- Show the signature help window after typing a trigger character
					show_on_trigger_character = true,
					-- Show the signature help window when entering insert mode
					show_on_insert = true,
					-- Show the signature help window when the cursor comes after a trigger character when entering insert mode
					show_on_insert_on_trigger_character = true,
				},
				window = {
					min_width = 1,
					max_width = 100,
					max_height = 10,
					border = nil, -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
					winblend = 0,
					winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
					scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
					-- Which directions to show the window,
					-- falling back to the next direction when there's not enough space,
					-- or another window is in the way
					direction_priority = { "n", "s" },
					-- Can accept a function if you need more control
					-- direction_priority = function()
					--   if condition then return { 'n', 's' } end
					--   return { 's', 'n' }
					-- end,

					-- Disable if you run into performance issues
					treesitter_highlighting = true,
					show_documentation = true,
				},
			},
		},

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
				"kind",
			},
		},
		term = {
			enabled = true,
			keymap = { preset = "inherit" }, -- Inherits from top level `keymap` config when not set
		},
	},
	opts_extend = { "sources.default" },
}
