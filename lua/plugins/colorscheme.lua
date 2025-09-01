return {
	--[[ {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true, -- do not set background color
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			integrations = {
				telescope = true,
				treesitter = true,
				cmp = true,
			},
		},
		config = function()
			-- vim.cmd.colorscheme("catppuccin")
		end,
	}, ]]
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true, -- do not set background color
		},
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	--[[ {
		"motaz-shokry/gruvbox",
		name = "gruvbox",
		url = "https://gitlab.com/motaz-shokry/gruvbox.nvim.git",
		priority = 1000,
		opts = {
			variant = "hard", -- hard, medium, soft, light
			styles = {
				transparency = true,
			},
		},
		config = function()
			-- vim.cmd.colorscheme("gruvbox-hard")
		end,
	}, ]]
}
