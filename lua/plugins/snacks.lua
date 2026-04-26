return {
	"folke/snacks.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			lazy = false,
			dependencies = {
				{ "nvim-lua/plenary.nvim", lazy = false },
				{ "nvim-telescope/telescope-fzf-native.nvim", lazy = false, build = "make" },
			},
			"folke/persistence.nvim",
		},
	},
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		animate = {
			duration = 5,
			easing = "outQuart",
			fps = 180,
		},
		bigfile = {
			notify = true,
			size = 2 * 1024 * 1024, -- 2MB
		},
		bufdelete = {},
		dashboard = {
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		indent = { enabled = true },
		input = {},
		notifier = {},
		words = {},
		git = {},
		explorer = {},
	},
}
