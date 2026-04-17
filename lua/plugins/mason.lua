return {
	"mason-org/mason-lspconfig.nvim",
	opts = {

		automatic_enable = true,
		ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {

				max_concurrent_installers = 12,
				pip = {
					upgrade_pip = true,
				},
			}
		},
		"neovim/nvim-lspconfig",
	},
}
