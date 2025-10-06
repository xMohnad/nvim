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
	keys = {
		-- LSP
		{
			"gO",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>dc",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / References / ... (Trouble)",
		},

		-- Diagnostics
		{
			"<leader>dw",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Workspace Diagnostics (Trouble)",
		},
		{
			"<leader>dd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>ds",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},

		-- Lists
		{
			"<leader>Q",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
