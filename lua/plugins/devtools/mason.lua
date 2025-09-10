return {
	"mason-org/mason.nvim",
	lazy = false, -- Load immediately to ensure PATH is set
	cmd = "Mason",
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
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
}
