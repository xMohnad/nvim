return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = {
				-- To fix auto-fixable lint errors.
				"ruff_fix",
				-- To run the Ruff formatter.
				"ruff_format",
				-- To organize the imports.
				"ruff_organize_imports",
			},
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			javascript = { "prettier" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
	},
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ lsp_fallback = true })
			end,
			mode = { "n", "v", "x" },
			desc = "general format file",
		},
	},
}
