return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function ()
			require ("base16-colorscheme").setup ({
				base00 = "#131313",
				base01 = "#131313",
				base02 = "#848b80",
				base03 = "#848b80",
				base04 = "#d8e0d3",
				base05 = "#fbfff8",
				base06 = "#fbfff8",
				base07 = "#fbfff8",
				base08 = "#ffb19f",
				base09 = "#ffb19f",
				base0A = "#b7eb97",
				base0B = "#aaffa5",
				base0C = "#e1ffce",
				base0D = "#b7eb97",
				base0E = "#d1ffb3",
				base0F = "#d1ffb3",
			})

			vim.api.nvim_set_hl (0, "Visual", {
				bg = "#848b80",
				fg = "#fbfff8",
				bold = true,
			})
			vim.api.nvim_set_hl (0, "Statusline", {
				bg = "#b7eb97",
				fg = "#131313",
			})
			vim.api.nvim_set_hl (0, "LineNr", { fg = "#848b80" })
			vim.api.nvim_set_hl (0, "CursorLineNr", { fg = "#e1ffce", bold = true })

			vim.api.nvim_set_hl (0, "Statement", {
				fg = "#d1ffb3",
				bold = true,
			})
			vim.api.nvim_set_hl (0, "Keyword", { link = "Statement" })
			vim.api.nvim_set_hl (0, "Repeat", { link = "Statement" })
			vim.api.nvim_set_hl (0, "Conditional", { link = "Statement" })

			vim.api.nvim_set_hl (0, "Function", {
				fg = "#b7eb97",
				bold = true,
			})
			vim.api.nvim_set_hl (0, "Macro", {
				fg = "#b7eb97",
				italic = true,
			})
			vim.api.nvim_set_hl (0, "@function.macro", { link = "Macro" })

			vim.api.nvim_set_hl (0, "Type", {
				fg = "#e1ffce",
				bold = true,
				italic = true,
			})
			vim.api.nvim_set_hl (0, "Structure", { link = "Type" })

			vim.api.nvim_set_hl (0, "String", {
				fg = "#aaffa5",
				italic = true,
			})

			vim.api.nvim_set_hl (0, "Operator", { fg = "#d8e0d3" })
			vim.api.nvim_set_hl (0, "Delimiter", { fg = "#d8e0d3" })
			vim.api.nvim_set_hl (0, "@punctuation.bracket", { link = "Delimiter" })
			vim.api.nvim_set_hl (0, "@punctuation.delimiter", { link = "Delimiter" })

			vim.api.nvim_set_hl (0, "Comment", {
				fg = "#848b80",
				italic = true,
			})

			local current_file_path = vim.fn.stdpath ("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event ()
				_G._matugen_theme_watcher:start (
					current_file_path,
					{},
					vim.schedule_wrap (function ()
						local new_spec = dofile (current_file_path)
						if new_spec and new_spec[1] and new_spec[1].config then
							new_spec[1].config ()
							print ("Theme reload")
						end
					end)
				)
			end
		end,
	},
}
