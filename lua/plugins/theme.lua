return {
	"serhez/teide.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "darker", -- The theme comes in four styles, `darker`, `dark`, `dimmed`, and `light`
		light_style = "light", -- The theme is used when the background is set to light
		transparent = false, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		light_brightness = 0.3, -- Adjusts the brightness of the colors of the **Light** style. Number between 0 and 1, from dull to vibrant colors
		dim_inactive = true, -- dims inactive windows
		lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

		--- You can override specific color groups to use other groups or a hex color
		--- function will be called with a ColorScheme table
		---@param colors ColorScheme
		on_colors = function(colors) end,

		--- You can override specific highlights to use other groups or a hex color
		--- function will be called with a Highlights and ColorScheme table
		---@param highlights teide.Highlights
		---@param colors ColorScheme
		on_highlights = function(highlights, colors) end,

		cache = true, -- When set to true, the theme will be cached for better performance

		---@type table<string, boolean|{enabled:boolean}>
		plugins = {
			all = package.loaded.lazy == nil,
			auto = true,
		},
	},
}
