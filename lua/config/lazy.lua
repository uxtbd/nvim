-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath ("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat (lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system ({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo ({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar ()
		os.exit (1)
	end
end
vim.opt.rtp:prepend (lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.number = true
vim.opt.relativenumber = true

-- Setup lazy.nvim
require ("lazy").setup ({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	pkg = {
		enabled = true,
		cache = vim.fn.stdpath ("state") .. "/lazy/pkg-cache.lua",
		sources = {
			"lazy",
			"rockspec", -- will only be used when rocks.enabled is true
			"packspec",
		},
	},
	rocks = {
		enabled = true,
		root = vim.fn.stdpath ("data") .. "/lazy-rocks",
		server = "https://lumen-oss.github.io/rocks-binaries/",
		hererocks = false,
	},
	throttle = 0,
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
		check_pinned = false, -- check for pinned packages that can't be updated
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to includes in the rtp
		},
	},
	readme = {
		enabled = true,
		root = vim.fn.stdpath ("state") .. "/lazy/readme",
		files = { "README.md", "lua/**/README.md" },
		-- only generate markdown helptags for plugins that don't have docs
		skip_if_doc_exists = true,
	},
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
