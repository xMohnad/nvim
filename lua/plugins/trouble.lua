return {
	"folke/trouble.nvim",
	event = "LspAttach",
	cmd = "Trouble",
	lazy = true,
	opts = {
		-- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
		mode = "workspace_diagnostics",
		position = "bottom", -- position of the list can be: bottom, top, left, right
		height = 15,
		padding = false,
		auto_jump = {},
		use_diagnostic_signs = true,
	}, -- for default options, refer to the configuration section for custom setup.
}
