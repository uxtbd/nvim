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
		dashboard = {},
		indent = { enabled = true },
	},
}
