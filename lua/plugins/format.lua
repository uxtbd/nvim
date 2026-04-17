return {
	"stevearc/conform.nvim",
	lazy = false,
	config = function()
		require("conform").setup({
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 1000,
				lsp_format = "first",
			},
			formatters_by_ft = {
				lua = { "stylua" },
			},
		})
	end,
}
