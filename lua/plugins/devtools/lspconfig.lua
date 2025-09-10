return {
	{
		"mason-org/mason.nvim",
		lazy = false, -- Load immediately to ensure PATH is set
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				"black",
				"ruff",
				"prettier",
				"stylua",
			},
			ui = {
				icons = {
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = { "lua_ls", "pyright" },
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
