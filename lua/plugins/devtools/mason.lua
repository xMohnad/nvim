return {
	"mason-org/mason.nvim",
	lazy = false, -- Load immediately to ensure PATH is set
	cmd = "Mason",
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			-- LSPs
			"basedpyright", -- Python
			"lua_lsp", -- Lua
			"fish-lsp", -- Fish shell

			-- Linters
			"ruff", -- Python

			-- Formatters
			"prettier", -- JS / JSON / HTML / CSS
			"stylua", -- Lua
		},
		ui = {
			icons = {
				package_pending = " ",
				package_installed = " ",
				package_uninstalled = " ",
			},
		},
	},
}
